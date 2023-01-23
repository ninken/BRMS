using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Text.RegularExpressions;
using System.Windows.Forms;

namespace BRMS
{
    public partial class RuleEditor : Form
    {
        private static string viewType;

        public RuleEditor()
        {
            InitializeComponent();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            if (3 > txtName.Text.Length)
            {
                MessageBox.Show("Rule name too short.");
                return;
            }

            string gotsql = build_update();
            string result = test_sql(gotsql);

            if (result == "Success")
            {
                using (SqlConnection conn = new SqlConnection(connectionString: DBConnect.ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand command = new SqlCommand("uspRuleAddUpdate", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        try
                        {
                            if (Business.vRuleId == 0)
                        { 
                         command.Parameters.AddWithValue("@RuleId", 0); // Add New Rule
                        }
                        else
                        {
                          command.Parameters.AddWithValue("@RuleId", Business.vRuleId); // Update Rule
                        }
                        command.Parameters.AddWithValue("@RuleGroup", Business.vRuleGroupId);
                        command.Parameters.AddWithValue("@RuleExpression", RichExpression.Text);
                        command.Parameters.AddWithValue("@RuleSetCommand", RichSet.Text);
                        command.Parameters.AddWithValue("@RuleTitle", txtName.Text);
                        command.Parameters.AddWithValue("@RuleStartDate", dtStart.Value);
                        command.Parameters.AddWithValue("@RuleEndDate", dtEnd.Value);
                        command.Parameters.AddWithValue("@Active", chkEnable.Checked);
                        SqlParameter output = new SqlParameter("@StatusMsg", SqlDbType.VarChar, -1);
                        output.Direction = ParameterDirection.Output;
                        command.Parameters.Add(output);

                        command.ExecuteNonQuery();
                        string status = (string)output.Value;

                            if (status == "Success")
                            {
                                this.Close();
                                return;
                            }
                            else
                            {
                                MessageBox.Show("uspRuleAddUpdate Returned Error:" + Environment.NewLine + status);
                            }
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show("uspRuleAddUpdate Returned Error: " + ex.ToString());
                        }
                    }
                }
            }
            else
            {
                MessageBox.Show("Server Returned Error:" + Environment.NewLine + result);
                MessageBox.Show("Error in Generated T-SQL:" + Environment.NewLine + gotsql);
            }

        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void RuleEditor_Load(object sender, EventArgs e)
        {
            if (Business.vRuleId == 0)
            {
                lbTitle.Text = "Create a new Rule";
                btnAdd.Text = "Add Rule";
            }
            else
            {
                lbTitle.Text = "Editing Rule No: " + Business.vRuleId.ToString();
                btnAdd.Text = "Update Rule";
            }
            Load_Data();
        }

        private void Load_Data()
        {
            lstColumns.Items.Clear();
            RichExpression.Text = "";

            //==== Load Saved Group ID
            if (Business.vRuleGroupId != 0)
            {
                using (SqlConnection conn = new SqlConnection(connectionString: DBConnect.ConnectionString))
                {
                    conn.Open();
                    string selectCommand = "SELECT DBTable, TableName, TableKey, DBView, ViewName, ViewKey FROM [BRMS].[dbo].[BusinessRulesGroup] WHERE [RuleGroup] = @GroupId";
                    SqlCommand cmd = new SqlCommand(selectCommand, conn);
                    cmd.Parameters.AddWithValue("@GroupId", Business.vRuleGroupId);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            Business.vDBTable = reader.GetString(0);
                            Business.vTableName = reader.GetString(1);
                            Business.vTableKey = reader.GetString(2);
                            Business.vDBView = reader.GetString(3);
                            Business.vViewName = reader.GetString(4);
                            Business.vViewKey = reader.GetString(5);
                        }
                    }
                }

                //==== Load Saved Rule Contents
                if (Business.vRuleId != 0)
                {
                    using (SqlConnection conn = new SqlConnection(connectionString: DBConnect.ConnectionString))
                    {
                        conn.Open();
                        string selectCommand = "SELECT [RuleTitle],[RuleExpression],[RuleSetCommand],[RuleStartDate],[RuleEndDate],[Active],[RuleCreatedOn],[RuleChangedOn],[RuleCreatedBy],[RuleChangedBy],[CreateTransaction] FROM [BRMS].[dbo].[BusinessRules] WHERE [RuleId] = @RuleId";
                        SqlCommand cmd = new SqlCommand(selectCommand, conn);
                        cmd.Parameters.AddWithValue("@RuleId", Business.vRuleId);
                        SqlDataReader reader = cmd.ExecuteReader();

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                txtName.Text = reader.GetString(0);
                                RichExpression.Text = reader.GetString(1);
                                RichSet.Text = reader.GetString(2);
                                dtStart.Value = reader.GetDateTime(3);
                                dtEnd.Value = reader.GetDateTime(4);
                                chkEnable.Checked = reader.GetBoolean(5);
                            }
                        }
                    }
                }
                else
                {
                    dtStart.Value = DateTime.Today;
                    dtEnd.Value = DateTime.Today.AddYears(1);
                }

                //==== Load Columns of View
                using (SqlConnection conn = new SqlConnection(connectionString: DBConnect.ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand command = new SqlCommand("dbo.uspList_ViewsColumns", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        SqlParameter parameter1 = new SqlParameter("@DatabaseName", SqlDbType.NVarChar, 150);
                        SqlParameter parameter2 = new SqlParameter("@ViewName", SqlDbType.NVarChar, 150);
                        parameter1.Value = Business.vDBView;
                        command.Parameters.Add(parameter1);
                        parameter2.Value = Business.vViewName;
                        command.Parameters.Add(parameter2);

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                string tablecolumns = reader["ColumnName"].ToString();
                                lstColumns.Items.Add(tablecolumns);
                                lstViewColumns.Items.Add(tablecolumns);
                            }
                        }
                    }
                }

                //==== Load Columns of Table
                using (SqlConnection conn = new SqlConnection(connectionString: DBConnect.ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand command = new SqlCommand("dbo.uspList_TablesColumns", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        SqlParameter parameter1 = new SqlParameter("@DatabaseName", SqlDbType.NVarChar, 150);
                        SqlParameter parameter2 = new SqlParameter("@TableName", SqlDbType.NVarChar, 150);
                        parameter1.Value = Business.vDBView;
                        command.Parameters.Add(parameter1);
                        parameter2.Value = Business.vTableName;
                        command.Parameters.Add(parameter2);

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                string tablecolumns = reader["ColumnName"].ToString();
                                lstTable.Items.Add(tablecolumns);
                            }
                        }
                    }
                }
            }
        }

        private void lstColumns_SelectedIndexChanged(object sender, EventArgs e)
        {
            string[] stringArray = { "varchar", "nvarchar", "xml", "text", "ntext", "sql_variant" };
            string[] charArray = { "char", "nchar" };
            string[] intArray = { "numeric", "int", "float", "money", "real", "smallint", "smallmoney", "bigint", "decimal", "hierarchyid", "tinyint" };
            string[] DateArray = { "date", "datetime", "datetime", "datetimeoffset", "smalldatetime", "time", "timestamp" };
            string[] SQLStringArray = { " ", "= ''", "<> ''", "LIKE '%%'", "IN ('','')", "SUBSTRING(", "UPPER(", "LOWER(", "TRIM(", "LTRIM(", "RTRIM(", "FORMAT(", "LEN(", "LEFT(", "RIGHT(", "CONCAT(", "CHARINDEX(", "REPLACE(", "REPLICATE(", "REVERSE(", "STUFF(" };
            string[] SQLCHARArray = { " ", "= ''", "<> ''" };
            string[] SQLINTArray = { " ", "=", "<>", ">", "<", ">=", "<=", "!<", ">!", "IN (0,1,2,3)", "BETWEEN 0 AND 1" };
            string[] SQLDateArray = { " ", "=", "<>", ">", "<", ">=", "<=", "!<", ">!", "in", "BETWEEN", "DATEADD", "DATEPART", "DATEDIFF", "DATENAME" };
            lstCMD.Items.Clear();

            // Get Data Type of Column
            using (SqlConnection conn = new SqlConnection(connectionString: DBConnect.ConnectionString))
            {
                conn.Open();
                using (SqlCommand command = new SqlCommand("dbo.uspList_ViewsColumnType", conn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    SqlParameter parameter1 = new SqlParameter("@DatabaseName", SqlDbType.NVarChar, 150);
                    SqlParameter parameter2 = new SqlParameter("@ViewName", SqlDbType.NVarChar, 150);
                    SqlParameter parameter3 = new SqlParameter("@ColumnName", SqlDbType.NVarChar, 150);
                    parameter1.Value = Business.vDBView;
                    command.Parameters.Add(parameter1);
                    parameter2.Value = Business.vViewName;
                    command.Parameters.Add(parameter2);
                    parameter3.Value = lstColumns.SelectedItem.ToString();
                    command.Parameters.Add(parameter3);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                    while (reader.Read())
                    {
                        viewType = reader["DataType"].ToString();
                        lblType.Text = viewType;
                    }
                    }
                    foreach (string vtype in stringArray)
                    {
                        if (viewType == vtype)
                        {
                            lstCMD.Items.AddRange(SQLStringArray);
                        }
                    }
                    foreach (string vtype in charArray)
                    {
                        if (viewType == vtype)
                        {
                            lstCMD.Items.AddRange(SQLCHARArray);
                        }
                    }
                    foreach (string vtype in intArray)
                    {
                        if (viewType == vtype)
                        {
                            lstCMD.Items.AddRange(SQLINTArray);
                        }
                    }
                    foreach (string vtype in DateArray)
                    {
                        if (viewType == vtype)
                        {
                            lstCMD.Items.AddRange(SQLDateArray);
                        }
                    }
                }
            }
        }

        private void lstColumns_DoubleClick(object sender, EventArgs e)
        {
            if (RichExpression.Text.Length > 0)
            {
                var lastChar = RichExpression.Text[RichExpression.Text.Length - 1];
                if (lastChar.ToString() == "]")
                {
                    RichExpression.AppendText(" AND " + Environment.NewLine);
                }
            }
            RichExpression.AppendText("[vw]." + lstColumns.SelectedItem.ToString());
        }
        private void lstCMD_DoubleClick(object sender, EventArgs e)
        {
            RichExpression.AppendText(' ' + lstCMD.SelectedItem.ToString() + ' ');
        }
        private void RichExpression_TextChanged(object sender, EventArgs e)
        {
            int selPos = RichExpression.SelectionStart;
            ApplySyntaxHighlighting();
            RichExpression.SelectionStart = selPos;
        }
        private void ApplySyntaxHighlighting()
        {
            RichExpression.SelectAll();
            RichExpression.SelectionColor = Color.Black;
            RichExpression.SelectionFont = new Font(RichExpression.SelectionFont, FontStyle.Regular);

             Regex keywordsRegex = new Regex(@"\b(SELECT|FROM|WHERE|AND|OR|LIKE|IN|BETWEEN|IS|NULL|CONVERT|CAST|NOT|EXISTS|UNION|ALL|AS|ANY|ASC|DESC|ORDER|GROUP|OVER|BY|HAVING|TOP|LIMIT|COUNT|SUM|AVG|MIN|MAX|DISTINCT|GETDATE|VARCHAR|NVARCHAR|INT|NUMERIC|FLOAT|MONEY|BIGINT|TINYINT|BIT|REAL|DATE|DATETIME|DATETIME2|SMALLDATETIME|GEOGRAPHY|CHAR|NCHAR)\b", RegexOptions.IgnoreCase); 
             Regex functionsRegex = new Regex(@"\b(DATEADD|DATEPART|DATEDIFF|DATENAME|UPPER|LOWER|TRIM|LTRIM|RTRIM|FORMAT|LEN|LEFT|RIGHT|SUBSTRING|CONCAT|CHARINDEX|REPLACE|REPLICATE|REVERSE|STUFF)\b", RegexOptions.IgnoreCase);
            foreach (Match match in keywordsRegex.Matches(RichExpression.Text))
            {
                RichExpression.Select(match.Index, match.Length);
                RichExpression.SelectionColor = Color.Blue;
                RichExpression.SelectionFont = new Font(RichExpression.SelectionFont, FontStyle.Regular);
            }
            foreach (Match match in functionsRegex.Matches(RichExpression.Text))
            {
                RichExpression.Select(match.Index, match.Length);
                RichExpression.SelectionColor = ColorTranslator.FromHtml("#AB7D00");
                RichExpression.SelectionFont = new Font(RichExpression.SelectionFont, FontStyle.Regular);
            }
            Regex quotesRegex = new Regex("'[^']*'");
            foreach (Match match in quotesRegex.Matches(RichExpression.Text))
            {
                RichExpression.Select(match.Index, match.Length);
                RichExpression.SelectionColor = Color.Red;
            }
        }

        private void lstTable_DoubleClick(object sender, EventArgs e)
        {
            if (RichSet.Text.Length > 0)
            {
                var lastChar = RichSet.Text[RichSet.Text.Length - 1];
                if (lastChar.ToString() == "]")
                {
                    RichSet.AppendText("," + Environment.NewLine);
                }
            }
            RichSet.AppendText(Business.vDBTable + "." + Business.vTableName + "." + lstTable.SelectedItem + " = ");
        }

        private void lstViewColumns_DoubleClick(object sender, EventArgs e)
        {
            RichSet.AppendText("[vw]." + lstViewColumns.SelectedItem);
        }

        private void btnAND_Click(object sender, EventArgs e)
        {
            RichExpression.AppendText(" AND ");
        }

        private void btnOR_Click(object sender, EventArgs e)
        {
            RichExpression.AppendText(" OR ");
        }

        private void btnPrev_Click(object sender, EventArgs e)
        {
            string gotsql = build_sql();
            string result = test_sql(gotsql);

            if (result == "Success")
            {
                Business.vSQLPreview = gotsql;
                RulePreview form = new RulePreview();
                form.Parent = Parent;
                form.StartPosition = FormStartPosition.CenterParent;
                form.ShowDialog();
            }
            else
            {
                MessageBox.Show("Server Returned Error:" + Environment.NewLine + result);
                MessageBox.Show("Error in Generated T-SQL:" + Environment.NewLine + gotsql);
            }

        }

        private void btnCheck_Click(object sender, EventArgs e)
        {
           string gotsql = build_sql();
           string result = test_sql(gotsql);
           
            if (result == "Success")
            {
                MessageBox.Show(result);
            }
            else
            {
                MessageBox.Show("Server Returned Error:" + Environment.NewLine + result);
                MessageBox.Show("Error in Generated T-SQL:" + Environment.NewLine + gotsql);
            }
        }

        private void btnUpdateCheck_Click(object sender, EventArgs e)
        {
            string gotsql = build_update();
            string result = test_sql(gotsql);

            if (result == "Success")
            {
                MessageBox.Show(result);
            }
            else
            {
                MessageBox.Show("Server Returned Error:" + Environment.NewLine + result);
                MessageBox.Show("Error in Generated T-SQL:" + Environment.NewLine + gotsql);
            }
        }
        private string build_sql()
        {
            string vsql = "";
            using (SqlConnection conn = new SqlConnection(connectionString: DBConnect.ConnectionString))
            {
                conn.Open();
                using (SqlCommand command = new SqlCommand("uspGenerateSQL", conn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@vDBView", Business.vDBView);
                    command.Parameters.AddWithValue("@vViewName", Business.vViewName);
                    command.Parameters.AddWithValue("@vDBTable", Business.vDBTable);
                    command.Parameters.AddWithValue("@vTableName", Business.vTableName);
                    command.Parameters.AddWithValue("@vViewKey", Business.vViewKey);
                    command.Parameters.AddWithValue("@vTableKey", Business.vTableKey);
                    command.Parameters.AddWithValue("@vExpression", RichExpression.Text);
                    SqlParameter output = new SqlParameter("@vsql", SqlDbType.NVarChar, -1);
                    output.Direction = ParameterDirection.Output;
                    command.Parameters.Add(output);
                    command.ExecuteNonQuery();
                    vsql = (string)output.Value;
                }
            }
            return vsql;
        }

        private string build_update()
        {
            string vsql = "";
            using (SqlConnection conn = new SqlConnection(connectionString: DBConnect.ConnectionString))
            {
                conn.Open();
                using (SqlCommand command = new SqlCommand("uspGenerateSQLUpdate", conn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@vDBTable", Business.vDBTable);
                    command.Parameters.AddWithValue("@vTableName", Business.vTableName);
                    command.Parameters.AddWithValue("@vTableKey", Business.vTableKey);
                    command.Parameters.AddWithValue("@vDBView", Business.vDBView);
                    command.Parameters.AddWithValue("@vViewName", Business.vViewName);
                    command.Parameters.AddWithValue("@vViewKey", Business.vViewKey);
                    command.Parameters.AddWithValue("@vSet", RichSet.Text);
                    command.Parameters.AddWithValue("@vExpression", RichExpression.Text);

                    SqlParameter output = new SqlParameter("@vsql", SqlDbType.NVarChar, -1);
                    output.Direction = ParameterDirection.Output;
                    command.Parameters.Add(output);
                    command.ExecuteNonQuery();
                    vsql = (string)output.Value;
                }
            }
            return vsql;
        }

        private string test_sql(string vsql)
        {
            using (SqlConnection conn = new SqlConnection(connectionString: DBConnect.ConnectionString))
            {
                conn.Open();
                using (SqlCommand command = new SqlCommand("dbo.uspCheckSQL", conn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@CustomQuery", vsql);
                    SqlParameter statusMessage = command.Parameters.Add("@StatusMsg", SqlDbType.VarChar, 100);
                    statusMessage.Direction = ParameterDirection.Output;
                    command.ExecuteNonQuery();

                    string result = statusMessage.Value.ToString();
                    return result;
                }
            }
        }

        private void lstTable_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get Data Type of Column
            using (SqlConnection conn = new SqlConnection(connectionString: DBConnect.ConnectionString))
            {
                conn.Open();
                using (SqlCommand command = new SqlCommand("dbo.uspList_TablesColumnType", conn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    SqlParameter parameter1 = new SqlParameter("@DatabaseName", SqlDbType.NVarChar, 150);
                    SqlParameter parameter2 = new SqlParameter("@TableName", SqlDbType.NVarChar, 150);
                    SqlParameter parameter3 = new SqlParameter("@ColumnName", SqlDbType.NVarChar, 150);
                    parameter1.Value = Business.vDBTable;
                    command.Parameters.Add(parameter1);
                    parameter2.Value = Business.vTableName;
                    command.Parameters.Add(parameter2);
                    parameter3.Value = lstTable.SelectedItem.ToString();
                    command.Parameters.Add(parameter3);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            viewType = reader["DataType"].ToString();
                            lbtset.Text = viewType;
                        }
                    }
                }
            }
        }

        private void lstViewColumns_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get Data Type of Column
            using (SqlConnection conn = new SqlConnection(connectionString: DBConnect.ConnectionString))
            {
                conn.Open();
                using (SqlCommand command = new SqlCommand("dbo.uspList_ViewsColumnType", conn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    SqlParameter parameter1 = new SqlParameter("@DatabaseName", SqlDbType.NVarChar, 150);
                    SqlParameter parameter2 = new SqlParameter("@ViewName", SqlDbType.NVarChar, 150);
                    SqlParameter parameter3 = new SqlParameter("@ColumnName", SqlDbType.NVarChar, 150);
                    parameter1.Value = Business.vDBView;
                    command.Parameters.Add(parameter1);
                    parameter2.Value = Business.vViewName;
                    command.Parameters.Add(parameter2);
                    parameter3.Value = lstViewColumns.SelectedItem.ToString();
                    command.Parameters.Add(parameter3);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            viewType = reader["DataType"].ToString();
                            lbvset.Text = viewType;
                        }
                    }
                }
            }
        }

        private void btnRunRule_Click(object sender, EventArgs e)
        {
            string result = "No Results";
            DialogResult dresult;

            if (Business.vRuleId == 0)
             {
                MessageBox.Show("Rule must be saved to run a rule");
                return;
            }

            dresult = MessageBox.Show("Running just this rule ignores running the group sequence. Do you want to continue?", "Confirmation", MessageBoxButtons.YesNo);
            if (dresult == DialogResult.Yes)
            {
                using (SqlConnection conn = new SqlConnection(connectionString: DBConnect.ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand command = new SqlCommand("dbo.uspExectueRule", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        try
                        {
                            command.Parameters.AddWithValue("@RuleId", Business.vRuleId); // Update Rule
                            SqlParameter output = new SqlParameter("@OutputMsg", SqlDbType.VarChar, 1000);
                            output.Direction = ParameterDirection.Output;
                            command.Parameters.Add(output);
                            command.ExecuteNonQuery();
                            result = (string)output.Value;
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show("Error running rule: " + ex.ToString());
                        }
                    }
                    MessageBox.Show(result + " - Check Rule Log History for additional details");
                }
            }
            else if (dresult == DialogResult.No)
            {
                MessageBox.Show("Running this Rule is canceled.");
            }
        }
    }
}
