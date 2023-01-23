using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace BRMS
{
    public partial class RuleGroupEdit : Form
    {
        private string viewdb;
        private string viewselect;
        private string viewkey;
        private string tabledb;
        private string tableselect;        
        private string tablekey;

        public RuleGroupEdit()
        {
            InitializeComponent();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            if (3 > txtName.Text.Length )
            {
                MessageBox.Show("Group name too short.");
                return;
            }
            if ( cbDBView.SelectedItem == null && cbDBView.Items.Contains(viewdb) == false)
            {
                MessageBox.Show("DB View: "+viewdb+" is not is not vaild in list");
                return;
            }
            if (cbView.SelectedItem == null && cbView.Items.Contains(viewselect) == false )
            {
                MessageBox.Show("Selected View: "+ viewselect + " is not is not vaild in list");
                return;
            }
            if (cbViewKey.SelectedItem == null && cbViewKey.Items.Contains(viewkey) == false )
            {
                MessageBox.Show("Selected View Key: "+ viewkey + " is not is not vaild in list");
                return;
            }
            if (cbDBtbl.SelectedItem == null && cbDBtbl.Items.Contains(tabledb) == false )
            {
                MessageBox.Show("Table DB: "+ tabledb + " is not is not vaild in list");
                return;
            }
            if (cbDBtbl.SelectedItem == null && cbDBtbl.Items.Contains(tableselect) == false)
            {
                MessageBox.Show("Selected Table: " + tableselect + " is not is not vaild in list");
                return;
            }
            if (cbViewKey.SelectedItem == null && cbViewKey.Items.Contains(tablekey) == false)
            {
                MessageBox.Show("Selected Table Key:  " + tablekey + " is not is not vaild in list");
                return;
            }

            //==== Create New Record
            if (Business.vRuleGroupId == 0)
            {
                using (SqlConnection conn = new SqlConnection(connectionString: DBConnect.ConnectionString))
                {
                    conn.Open();
                    string selectCommand = "SELECT Count(*) as CNT FROM [BRMS].[dbo].[BusinessRulesGroup] WHERE [RuleGroupName] = @RName";
                    SqlCommand cmd = new SqlCommand(selectCommand, conn);
                    cmd.Parameters.AddWithValue("@RName", txtName.Text);

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    if ((int)dt.Rows[0]["CNT"] > 0)
                    {
                        MessageBox.Show("Rule Group name: " + txtName.Text + " already exists");
                        return;
                    }
                }
                try
                {
                    using (SqlConnection connection = new SqlConnection(connectionString: DBConnect.ConnectionString))
                    {
                        connection.Open();
                        using (SqlCommand command = new SqlCommand("dbo.uspRuleGroupRecInsert", connection))
                        {
                            command.CommandType = CommandType.StoredProcedure;
                            command.Parameters.Add("@RuleGroupName", SqlDbType.NVarChar, 60).Value = txtName.Text.Truncate(60);
                            command.Parameters.Add("@DBTable", SqlDbType.NVarChar, 150).Value = tabledb.Truncate(150);
                            command.Parameters.Add("@TableName", SqlDbType.NVarChar, 150).Value = tableselect.Truncate(150);
                            command.Parameters.Add("@TableKey", SqlDbType.NVarChar, 150).Value = tablekey.Truncate(150);
                            command.Parameters.Add("@DBView", SqlDbType.NVarChar, 150).Value = viewdb.Truncate(150);
                            command.Parameters.Add("@ViewName", SqlDbType.NVarChar, 150).Value = viewselect.Truncate(150);
                            command.Parameters.Add("@ViewKey", SqlDbType.NVarChar, 150).Value = viewkey.Truncate(150);
                            command.Parameters.Add("@GroupActive", SqlDbType.Bit).Value = chkEnable.Checked;
                            command.ExecuteNonQuery();
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.ToString());
                    return;
                }
            }

            //==== Update Record
            if (Business.vRuleGroupId != 0)
            {
                try
                {
                    using (SqlConnection connection = new SqlConnection(connectionString: DBConnect.ConnectionString))
                    {
                        connection.Open();
                        using (SqlCommand command = new SqlCommand("dbo.uspRuleGroupRecUpdate", connection))
                        {
                            command.CommandType = CommandType.StoredProcedure;
                            command.Parameters.Add("@RuleGroup", SqlDbType.Int).Value = Business.vRuleGroupId;
                            command.Parameters.Add("@RuleGroupName", SqlDbType.NVarChar, 60).Value = txtName.Text.Truncate(60);
                            command.Parameters.Add("@DBTable", SqlDbType.NVarChar, 150).Value = tabledb.Truncate(150);
                            command.Parameters.Add("@TableName", SqlDbType.NVarChar, 150).Value = tableselect.Truncate(150);
                            command.Parameters.Add("@TableKey", SqlDbType.NVarChar, 150).Value = tablekey.Truncate(150);
                            command.Parameters.Add("@DBView", SqlDbType.NVarChar, 150).Value = viewdb.Truncate(150);
                            command.Parameters.Add("@ViewName", SqlDbType.NVarChar, 150).Value = viewselect.Truncate(150);
                            command.Parameters.Add("@ViewKey", SqlDbType.NVarChar, 150).Value = viewkey.Truncate(150);
                            command.Parameters.Add("@GroupActive", SqlDbType.Bit).Value = chkEnable.Checked;
                            command.ExecuteNonQuery();
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.ToString());
                    return;
                }
            }
            this.Close();
        }

        private void RuleGroupEdit_Load(object sender, EventArgs e)
        {
            if (Business.vRuleGroupId == 0)
            {
                lbTitle.Text = "Create a new Rule Group";
                btnAdd.Text = "Create Group";
                CreateMode();
            }
            else
            {
                lbTitle.Text = "Editing Rule Group: " + Business.vRuleGroupId.ToString();
                btnAdd.Text = "Update Group";
                LoadMode();
            }
        }

        private void CreateMode()
        {
            cbDBView.Items.Clear();
            cbDBtbl.Items.Clear();
            using (SqlConnection conn = new SqlConnection(connectionString: DBConnect.ConnectionString))
            {
                conn.Open();
                using (SqlCommand command = new SqlCommand("dbo.uspList_Database", conn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            string database = reader["database"].ToString();
                            cbDBView.Items.Add(database);
                            cbDBtbl.Items.Add(database);
                        }
                    }
                }
            }
        }

        private void LoadMode()
        {
            cbDBView.Items.Clear();
            cbDBtbl.Items.Clear();
            using (SqlConnection conn = new SqlConnection(connectionString: DBConnect.ConnectionString))
            {
                conn.Open();
                using (SqlCommand command = new SqlCommand("dbo.uspList_Database", conn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            string database = reader["database"].ToString();
                            cbDBView.Items.Add(database);
                            cbDBtbl.Items.Add(database);
                        }
                    }
                }
            }
            //==== Load Saved Group ID
            if (Business.vRuleGroupId != 0)
            {
                using (SqlConnection conn = new SqlConnection(connectionString: DBConnect.ConnectionString))
                {
                    conn.Open();
                    string selectCommand = "SELECT  RuleGroupName, DBTable, TableName, TableKey, DBView, ViewName, ViewKey, GroupActive FROM [BRMS].[dbo].[BusinessRulesGroup] WHERE [RuleGroup] = @GroupId";
                    SqlCommand cmd = new SqlCommand(selectCommand, conn);
                    cmd.Parameters.AddWithValue("@GroupId", Business.vRuleGroupId);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            txtName.Text = reader.GetString(0);
                            cbDBtbl.Text = reader.GetString(1);
                            cbDBView.Text = reader.GetString(4);
                            cbtbl.Text = reader.GetString(2);
                            cbtblKey.Text = reader.GetString(3);
                            cbView.Text = reader.GetString(5);
                            cbViewKey.Text = reader.GetString(6);
                            chkEnable.Checked = reader.GetBoolean(7);
                        }
                    }
                }
            }
        }   

        #region viewgroup
        private void cbDBView_SelectedIndexChanged(object sender, EventArgs e)
        {
            cbView.Items.Clear();
            cbView.Text = "";
            cbView.Enabled = false;

            cbViewKey.Items.Clear();
            cbViewKey.Text = "";
            cbViewKey.Enabled = false;

            viewdb = "";
            viewselect = "";
            viewkey = "";
            viewdb = (string)cbDBView.SelectedItem;

            if (viewdb.Length > 2)
            {
                cbView.Enabled = true;

                using (SqlConnection conn = new SqlConnection(connectionString: DBConnect.ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand command = new SqlCommand("dbo.uspList_Views", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        SqlParameter parameter = new SqlParameter("@DatabaseName", SqlDbType.NVarChar, 150);
                        parameter.Value = viewdb;
                        command.Parameters.Add(parameter);
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                string viewlist = reader["views"].ToString().Replace(viewdb+ ".", "");
                                cbView.Items.Add(viewlist);
                            }
                        }
                    }
                }
            }
        }

        private void cbView_SelectedIndexChanged(object sender, EventArgs e)
        {
            cbViewKey.Items.Clear();
            cbViewKey.Text = "";
            cbViewKey.Enabled = false;
            viewselect = "";
            viewselect = (string)cbView.SelectedItem;

            if (viewselect.Length > 2)
            {
                cbViewKey.Enabled = true;

                using (SqlConnection conn = new SqlConnection(connectionString: DBConnect.ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand command = new SqlCommand("dbo.uspList_ViewsColumns", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        SqlParameter parameter1 = new SqlParameter("@DatabaseName", SqlDbType.NVarChar, 150);
                        SqlParameter parameter2 = new SqlParameter("@ViewName", SqlDbType.NVarChar, 150);
                        parameter1.Value = viewdb;
                        command.Parameters.Add(parameter1);
                        parameter2.Value = viewselect;
                        command.Parameters.Add(parameter2);

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                string viewcolumns = reader["ColumnName"].ToString();
                                cbViewKey.Items.Add(viewcolumns);

                            }
                        }
                    }
                }
            }
        }

        private void cbViewKey_SelectedIndexChanged(object sender, EventArgs e)
        {
            string chklen = (string)cbViewKey.SelectedItem;
            if (chklen.Length > 2)
            {
                viewkey = (string)cbViewKey.SelectedItem;
            }
        }
        #endregion

        #region tablegroup
        private void cbDBtbl_SelectedIndexChanged(object sender, EventArgs e)
        {
            cbtbl.Items.Clear();
            cbtbl.Text = "";
            cbtbl.Enabled = false;

            cbtblKey.Items.Clear();
            cbtblKey.Text = "";
            cbtblKey.Enabled = false;

            tabledb = "";
            tableselect = "";
            tablekey = "";
            tabledb = (string)cbDBtbl.SelectedItem;

            if (tabledb.Length > 2)
            {
                cbtbl.Enabled = true;

                using (SqlConnection conn = new SqlConnection(connectionString: DBConnect.ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand command = new SqlCommand("dbo.uspList_Tables", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        SqlParameter parameter = new SqlParameter("@DatabaseName", SqlDbType.NVarChar, 150);
                        parameter.Value = tabledb;
                        command.Parameters.Add(parameter);
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                string viewlist = reader["Tables"].ToString().Replace(tabledb + ".", "");
                                cbtbl.Items.Add(viewlist);
                            }
                        }
                    }
                }
            }
        }

        private void cbtbl_SelectedIndexChanged(object sender, EventArgs e)
        {
            cbtblKey.Items.Clear();
            cbtblKey.Text = "";
            cbtblKey.Enabled = false;
            tableselect = "";
            tableselect = (string)cbtbl.SelectedItem;

            if (tableselect.Length > 2)
            {
                cbtblKey.Enabled = true;

                using (SqlConnection conn = new SqlConnection(connectionString: DBConnect.ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand command = new SqlCommand("dbo.uspList_TablesColumns", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        SqlParameter parameter1 = new SqlParameter("@DatabaseName", SqlDbType.NVarChar, 150);
                        SqlParameter parameter2 = new SqlParameter("@TableName", SqlDbType.NVarChar, 150);
                        parameter1.Value = tabledb;
                        command.Parameters.Add(parameter1);
                        parameter2.Value = tableselect;
                        command.Parameters.Add(parameter2);

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                string tablecolumns = reader["ColumnName"].ToString();
                                cbtblKey.Items.Add(tablecolumns);
                            }
                        }
                    }
                }
            }
        }
        private void cbtblKey_SelectedIndexChanged(object sender, EventArgs e)
        {
            string chklen = (string)cbtblKey.SelectedItem;
            if (chklen.Length > 2)
            {
                tablekey = (string)cbtblKey.SelectedItem;
            }
        }
        #endregion
    }
}
