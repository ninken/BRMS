using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace BRMS
{
    public partial class Main : Form
    {
        public Main() { InitializeComponent(); }
        private void Main_FormClosed(object sender, FormClosedEventArgs e) { Application.Exit(); }
        private void Main_Load(object sender, EventArgs e) { Load_Data(); Load_Columns(); }
        private DataTable orgDSRules;
        private string selectedGroup = "All Groups";

        private void Load_Data()
        {
            int prevGroupIdx;
            if (cbGroup.SelectedIndex == -1)
            {
                prevGroupIdx = 0;
            }
            else
            {
                prevGroupIdx = cbGroup.SelectedIndex;
            }
            dtLogStart.MaxDate = DateTime.Now;
            dtLogEnd.MaxDate = DateTime.Now;
            using (SqlConnection conn = new SqlConnection(connectionString: DBConnect.ConnectionString))
            {
                conn.Open();
                string selectCommand = "SELECT Distinct GroupName FROM vRuleList";
                SqlCommand command = new SqlCommand(selectCommand, conn);
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    cbGroup.Items.Clear();
                    cbGroupLog.Items.Clear();
                    cbGroup.Items.Add("All Groups"); 
                    cbGroupLog.Items.Add("All Groups");
                    cbGroupLog.SelectedIndex = 0;

                    while (reader.Read())
                    {
                        string tablecolumns = reader["GroupName"].ToString();
                        cbGroup.Items.Add(tablecolumns);
                        cbGroupLog.Items.Add(tablecolumns);
                    }
                }
            }
            cbGroup.SelectedIndex = prevGroupIdx;

            using (SqlConnection conn = new SqlConnection(connectionString: DBConnect.ConnectionString))
            {
                conn.Open();
                string selectCommand = "SELECT GrpId, GroupName, GroupOrderBy, RuleId, RuleTitle, RuleStartDate, RuleEndDate, Active, GroupActive,RuleOrderBy FROM vRuleList";
                SqlDataAdapter adapter = new SqlDataAdapter(selectCommand, conn);
                DataTable table = new DataTable();
                adapter.Fill(table);
                orgDSRules = table;
                if (cbGroup.Text != "All Groups")
                {
                    DataTable filteredData = orgDSRules.Clone();
                    DataRow[] filteredRows = orgDSRules.Select("GroupName = '" + selectedGroup + "'");

                foreach (DataRow row in filteredRows)
                {
                    filteredData.ImportRow(row);
                }
                dataGridView1.DataSource = filteredData;
                }
                else
                {
                    dataGridView1.DataSource = orgDSRules;
                }
            }

            using (SqlConnection conn = new SqlConnection(connectionString: DBConnect.ConnectionString))
            {
                conn.Open();

                string selectCommand = " SELECT [RuleGroup],[RuleGroupName],[GroupActive],[GroupOrderBy] FROM [BRMS].[dbo].[BusinessRulesGroup] Order by [GroupOrderBy] ASC";
                SqlDataAdapter adapter = new SqlDataAdapter(selectCommand, conn);
                DataTable table = new DataTable();
                adapter.Fill(table);
                dataGridView3.DataSource = table;
            }

        }

        private void Load_Columns()
        {
                //Other 
                DataGridViewColumn GrpId = dataGridView1.Columns[0];
                GrpId.Visible = false; // Hide Group Id
                DataGridViewColumn GrpName = dataGridView1.Columns[1];
                GrpName.Width = 220;
                DataGridViewColumn GrpOrderBy = dataGridView1.Columns[2];
                GrpOrderBy.HeaderText = "GrpOrdBy";
                GrpOrderBy.Width = 60;
                DataGridViewColumn RuleId = dataGridView1.Columns[3];
                RuleId.Width = 50;
                DataGridViewColumn RuleName = dataGridView1.Columns[4];
                RuleName.Width = 220;
                DataGridViewColumn RuleStartDate = dataGridView1.Columns[5];
                RuleStartDate.HeaderText = "StartDate";
                RuleStartDate.Width = 70;
                DataGridViewColumn RuleEndDate = dataGridView1.Columns[6];
                RuleEndDate.HeaderText = "EndDate";
                RuleEndDate.Width = 70;
                DataGridViewColumn Active = dataGridView1.Columns[7];
                Active.Width = 50;
                DataGridViewColumn GrpActive = dataGridView1.Columns[8];
                GrpActive.HeaderText = "GrpActive";
                GrpActive.Width = 50;
                DataGridViewColumn RuleOrderBy = dataGridView1.Columns[9];
                RuleOrderBy.HeaderText = "RuleOrdBy";
                RuleOrderBy.Width = 60;
                //Editor
                DataGridViewButtonColumn EditColumn = new DataGridViewButtonColumn();
                dataGridView1.CellContentClick += new DataGridViewCellEventHandler(EditColumn_Click);
                EditColumn.UseColumnTextForButtonValue = true;
                EditColumn.Text = "Edit";
                EditColumn.Name = "Editor";
                EditColumn.Width = 70;
                dataGridView1.Columns.Add(EditColumn);
                 //Up
                DataGridViewButtonColumn UpColumn = new DataGridViewButtonColumn();
                dataGridView1.CellContentClick += new DataGridViewCellEventHandler(UpColumn_Click);
                UpColumn.UseColumnTextForButtonValue = true;
                UpColumn.Text = "˄";
                UpColumn.Name = "Up";
                UpColumn.Width = 40;
                dataGridView1.Columns.Add(UpColumn);
                //Down
                DataGridViewButtonColumn DownColumn = new DataGridViewButtonColumn();
                dataGridView1.CellContentClick += new DataGridViewCellEventHandler(DownColumn_Click);
                DownColumn.UseColumnTextForButtonValue = true;
                DownColumn.Text = "˅";
                DownColumn.Name = "Down";
                DownColumn.Width = 40;
                dataGridView1.Columns.Add(DownColumn);
                //=========== Rule Group Column Settings
                DataGridViewColumn GRuleGroup = dataGridView1.Columns[0];
                DataGridViewColumn GRuleName = dataGridView1.Columns[1];
                DataGridViewColumn GGroupActive = dataGridView1.Columns[2];
                DataGridViewColumn GGroupOrderBy = dataGridView1.Columns[3];
                GRuleGroup.Width = 60;
                GRuleName.Width = 200;
                GGroupActive.Width = 40;
                GGroupActive.HeaderText = "Active";
                GGroupOrderBy.Width = 50;
                GGroupOrderBy.HeaderText = "OrderBy";
                //Edit Group
                DataGridViewButtonColumn GSelectColumn = new DataGridViewButtonColumn();
                dataGridView3.CellContentClick += new DataGridViewCellEventHandler(GSelectColumn_Click);
                GSelectColumn.UseColumnTextForButtonValue = true;
                GSelectColumn.Text = "Edit Group";
                GSelectColumn.Name = "Edit";
                GSelectColumn.Width = 85;
                dataGridView3.Columns.Add(GSelectColumn);
                //Create Rule
                Business.vRuleId = 0;
                DataGridViewButtonColumn GRuleCreateColumn = new DataGridViewButtonColumn();
                dataGridView3.CellContentClick += new DataGridViewCellEventHandler(GRuleCreateColumn_Click);
                GRuleCreateColumn.UseColumnTextForButtonValue = true;
                GRuleCreateColumn.Text = "New Rule";
                GRuleCreateColumn.Name = "Rule";
                GRuleCreateColumn.Width = 80;
                dataGridView3.Columns.Add(GRuleCreateColumn);
                //Up
                DataGridViewButtonColumn GUpColumn = new DataGridViewButtonColumn();
                dataGridView3.CellContentClick += new DataGridViewCellEventHandler(GUpColumn_Click);
                GUpColumn.UseColumnTextForButtonValue = true;
                GUpColumn.Text = "˄";
                GUpColumn.Name = "Up";
                GUpColumn.Width = 40;
                dataGridView3.Columns.Add(GUpColumn);
                //Down
                DataGridViewButtonColumn GDownColumn = new DataGridViewButtonColumn();
                dataGridView3.CellContentClick += new DataGridViewCellEventHandler(GDownColumn_Click);
                GDownColumn.UseColumnTextForButtonValue = true;
                GDownColumn.Text = "˅";
                GDownColumn.Name = "Down";
                GDownColumn.Width = 40;
                dataGridView3.Columns.Add(GDownColumn);
                //Run Group
                DataGridViewButtonColumn GRunGrpColumn = new DataGridViewButtonColumn();
                dataGridView3.CellContentClick += new DataGridViewCellEventHandler(GRunGrpColumn_Click);
                GRunGrpColumn.UseColumnTextForButtonValue = true;
                GRunGrpColumn.Text = "Run Group";
                GRunGrpColumn.Name = "Execute";
                GRunGrpColumn.Width = 60;
                dataGridView3.Columns.Add(GRunGrpColumn);
        }

        private void UpColumn_Click(object sender, DataGridViewCellEventArgs e)
        {
            if (dataGridView1.Columns[e.ColumnIndex] is DataGridViewButtonColumn && e.RowIndex >= 0 && dataGridView1.Columns[e.ColumnIndex].HeaderText == "Up")
            {
                DataGridViewRow row = dataGridView1.Rows[e.RowIndex];
                int ruleId = (int)row.Cells["RuleId"].Value;
                int ruleIdGrp = (int)row.Cells["GrpId"].Value;
                int ruleOrder = (int)row.Cells["RuleOrderBy"].Value;
                
                // Already at the top?
                if (ruleOrder != 1 && ruleOrder != 999999)
                {
                ruleOrder = ruleOrder - 1; 
                using (SqlConnection connection = new SqlConnection(connectionString: DBConnect.ConnectionString))
                {
                    connection.Open();
                    using (SqlCommand command = new SqlCommand("dbo.uspRuleReorder", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                            try
                            {
                            SqlParameter parameter1 = new SqlParameter("@RuleId", SqlDbType.Int);
                            SqlParameter parameter2 = new SqlParameter("@newOrder", SqlDbType.Int);
                            SqlParameter parameter3 = new SqlParameter("@Groupid", SqlDbType.Int);
                            parameter1.Value = ruleId;
                            parameter2.Value = ruleOrder;
                            parameter3.Value = ruleIdGrp;
                            command.Parameters.Add(parameter1);
                            command.Parameters.Add(parameter2);
                            command.Parameters.Add(parameter3);
                            command.ExecuteNonQuery();
                            }
                            catch (Exception ex)
                            {
                                MessageBox.Show("Error Occured: " + ex.ToString());
                            }
                    }
                }
                    Load_Data();
                }
            }
        }

        private void DownColumn_Click(object sender, DataGridViewCellEventArgs e)
        {
            if (dataGridView1.Columns[e.ColumnIndex] is DataGridViewButtonColumn && e.RowIndex >= 0 && dataGridView1.Columns[e.ColumnIndex].HeaderText == "Down")
            {
                DataGridViewRow row = dataGridView1.Rows[e.RowIndex];
                int ruleId = (int)row.Cells["RuleId"].Value;
                int ruleIdGrp = (int)row.Cells["GrpId"].Value;
                int ruleOrder = (int)row.Cells["RuleOrderBy"].Value;

                    ruleOrder = ruleOrder + 1;
                    using (SqlConnection connection = new SqlConnection(connectionString: DBConnect.ConnectionString))
                    {
                        connection.Open();
                        using (SqlCommand command = new SqlCommand("dbo.uspRuleReorder", connection))
                        {
                            try
                            {
                            command.CommandType = CommandType.StoredProcedure;
                            SqlParameter parameter1 = new SqlParameter("@RuleId", SqlDbType.Int);
                            SqlParameter parameter2 = new SqlParameter("@newOrder", SqlDbType.Int);
                            SqlParameter parameter3 = new SqlParameter("@Groupid", SqlDbType.Int);
                            parameter1.Value = ruleId;
                            parameter2.Value = ruleOrder;
                            parameter3.Value = ruleIdGrp;
                            command.Parameters.Add(parameter1);
                            command.Parameters.Add(parameter2);
                            command.Parameters.Add(parameter3);
                            command.ExecuteNonQuery();
                            }
                            catch (Exception ex)
                            {
                                MessageBox.Show("Error Occured: " + ex.ToString());
                            }
                        }
                    }
                  Load_Data();
            }
        }

        private void EditColumn_Click(object sender, DataGridViewCellEventArgs e)
        {
            if (dataGridView1.Columns[e.ColumnIndex] is DataGridViewButtonColumn && e.RowIndex >= 0 && dataGridView1.Columns[e.ColumnIndex].HeaderText == "Editor")
            {
                DataGridViewRow row = dataGridView1.Rows[e.RowIndex];
                int ruleId = (int)row.Cells["RuleId"].Value;
                int groupid = (int)row.Cells["GrpId"].Value;
                Business.vRuleId = ruleId;
                Business.vRuleGroupId = groupid;
                RuleEditor form1 = new RuleEditor();
                form1.Parent = Parent;
                form1.StartPosition = FormStartPosition.CenterParent;
                form1.ShowDialog();
                Load_Data();
            }
        }

        private void cbGroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedGroup = cbGroup.SelectedItem.ToString();
            if (selectedGroup == "All Groups")
            {
                dataGridView1.DataSource = orgDSRules;
            }
            else
            {
                DataTable filteredData = orgDSRules.Clone();
                DataRow[] filteredRows = orgDSRules.Select("GroupName = '" + selectedGroup + "'");
                foreach (DataRow row in filteredRows)
                {
                    filteredData.ImportRow(row);
                }
                dataGridView1.DataSource = filteredData;
            }
        }

        private void btnRun_Click(object sender, EventArgs e)
        {
            try
            {
                int selectedRowIndex = dataGridView1.SelectedCells[0].RowIndex;
                DataGridViewRow selectedRow = dataGridView1.Rows[selectedRowIndex];
                int ruleId = (int)selectedRow.Cells["RuleId"].Value;
                MessageBox.Show(ruleId.ToString());
            }
            catch (Exception)
            {
                MessageBox.Show("Please select a rule row. ");
            }

        }

        private void btnfilterlog_Click(object sender, EventArgs e)
        {
            string ruleStarted = dtLogStart.Value.ToString("MM/dd/yyyy");
            string ruleEnded = dtLogEnd.Value.ToString("MM/dd/yyyy");
            string ruleGroupName = cbGroupLog.Text;

            using (SqlConnection connection = new SqlConnection(connectionString: DBConnect.ConnectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("dbo.uspRuleLogHistory", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@RuleStarted", ruleStarted);
                    command.Parameters.AddWithValue("@RuleEnded", ruleEnded);
                    command.Parameters.AddWithValue("@RuleGroupName", ruleGroupName);

                    SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                    DataTable dt = new DataTable();
                    dataAdapter.Fill(dt);
                    dataGridView2.DataSource = dt;
                }
            }
        }

        private void btnAddGroup_Click(object sender, EventArgs e)
        {
            try
            {
                Business.vRuleGroupId = 0;
                RuleGroupEdit form1 = new RuleGroupEdit();
                form1.Parent = Parent;
                form1.StartPosition = FormStartPosition.CenterParent;
                form1.ShowDialog();
                Load_Data();
            }
            catch (Exception ex)
            {
                MessageBox.Show("An Error Occurred " + ex.ToString());
            }
        }
        //=========== Rule Group
        private void GRuleCreateColumn_Click(object sender, DataGridViewCellEventArgs e)
        {
            if (dataGridView3.Columns[e.ColumnIndex] is DataGridViewButtonColumn && e.RowIndex >= 0 && dataGridView3.Columns[e.ColumnIndex].HeaderText == "Rule")
            {
                DataGridViewRow row = dataGridView3.Rows[e.RowIndex];
                Business.vRuleGroupId = (int)row.Cells["RuleGroup"].Value;
                Business.vRuleId = 0;
                RuleEditor form1 = new RuleEditor();
                form1.Parent = Parent;
                form1.StartPosition = FormStartPosition.CenterParent;
                form1.ShowDialog();
            }
        }

        private void GUpColumn_Click(object sender, DataGridViewCellEventArgs e)
        {
            if (dataGridView3.Columns[e.ColumnIndex] is DataGridViewButtonColumn && e.RowIndex >= 0 && dataGridView3.Columns[e.ColumnIndex].HeaderText == "Up")
            {
                DataGridViewRow row = dataGridView3.Rows[e.RowIndex];
                int ruleIdGrp = (int)row.Cells["RuleGroup"].Value;
                int ruleOrder = (int)row.Cells["GroupOrderBy"].Value;

                // Already at the top?
                if (ruleOrder != 1 && ruleOrder != 999999)
                {
                    ruleOrder = ruleOrder - 1;

                    using (SqlConnection connection = new SqlConnection(connectionString: DBConnect.ConnectionString))
                    {
                        connection.Open();
                        using (SqlCommand command = new SqlCommand("dbo.uspRuleGroupReorder", connection))
                        {
                            command.CommandType = CommandType.StoredProcedure;
                            try
                            {
                                SqlParameter parameter1 = new SqlParameter("@Groupid", SqlDbType.Int);
                                SqlParameter parameter2 = new SqlParameter("@newOrder", SqlDbType.Int);
                                parameter1.Value = ruleIdGrp;
                                parameter2.Value = ruleOrder;

                                command.Parameters.Add(parameter1);
                                command.Parameters.Add(parameter2);
                                command.ExecuteNonQuery();
                            }
                            catch (Exception ex)
                            {
                                MessageBox.Show("Error Occured: " + ex.ToString());
                            }
                        }
                    }
                    Load_Data();
                }
            }
        }

        private void GDownColumn_Click(object sender, DataGridViewCellEventArgs e)
        {
            if (dataGridView3.Columns[e.ColumnIndex] is DataGridViewButtonColumn && e.RowIndex >= 0 && dataGridView3.Columns[e.ColumnIndex].HeaderText == "Down")
            {
                DataGridViewRow row = dataGridView3.Rows[e.RowIndex];
                int ruleIdGrp = (int)row.Cells["RuleGroup"].Value;
                int ruleOrder = (int)row.Cells["GroupOrderBy"].Value;

                if (ruleOrder != 999999)
                {
                    ruleOrder = ruleOrder + 1;
                    using (SqlConnection connection = new SqlConnection(connectionString: DBConnect.ConnectionString))
                    {
                        connection.Open();
                        using (SqlCommand command = new SqlCommand("dbo.uspRuleGroupReorder", connection))
                        {
                            command.CommandType = CommandType.StoredProcedure;
                            try
                            {
                                SqlParameter parameter1 = new SqlParameter("@Groupid", SqlDbType.Int);
                                SqlParameter parameter2 = new SqlParameter("@newOrder", SqlDbType.Int);
                                parameter1.Value = ruleIdGrp;
                                parameter2.Value = ruleOrder;
                                command.Parameters.Add(parameter1);
                                command.Parameters.Add(parameter2);
                                command.ExecuteNonQuery();
                            }
                            catch (Exception ex)
                            {
                                MessageBox.Show("Error Occured: " + ex.ToString());
                            }
                        }
                    }
                    Load_Data();
                }
            }
        }

        private void GSelectColumn_Click(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                if (dataGridView3.Columns[e.ColumnIndex] is DataGridViewButtonColumn && e.RowIndex >= 0 && dataGridView3.Columns[e.ColumnIndex].HeaderText == "Edit")
                {
                    DataGridViewRow row = dataGridView3.Rows[e.RowIndex];
                    int ruleId = (int)row.Cells["RuleGroup"].Value;
                    Business.vRuleGroupId = ruleId;
                    RuleGroupEdit form1 = new RuleGroupEdit();
                    form1.Parent = Parent;
                    form1.StartPosition = FormStartPosition.CenterParent;
                    form1.ShowDialog();
                    Load_Data();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("An Error Occurred " + ex.ToString());
            }
        }

        private void GRunGrpColumn_Click(object sender, DataGridViewCellEventArgs e)
        {
            if (dataGridView3.Columns[e.ColumnIndex] is DataGridViewButtonColumn && e.RowIndex >= 0 && dataGridView3.Columns[e.ColumnIndex].HeaderText == "Execute")
            {
                DataGridViewRow row = dataGridView3.Rows[e.RowIndex];
                Business.vRuleGroupId = (int)row.Cells["RuleGroup"].Value;
                Business.vRuleId = 0;
                DialogResult dresult;

                dresult = MessageBox.Show("Exectue all active rules in this group sequence?", "Confirmation", MessageBoxButtons.YesNo);
                if (dresult == DialogResult.Yes)
                {
                    using (SqlConnection conn = new SqlConnection(connectionString: DBConnect.ConnectionString))
                    {
                        conn.Open();
                        using (SqlCommand command = new SqlCommand("dbo.uspExectueRuleGroup", conn))
                        {
                            command.CommandType = CommandType.StoredProcedure;
                            try
                            {
                                command.Parameters.AddWithValue("@RuleGroup", Business.vRuleGroupId);
                                command.ExecuteNonQuery();
                            }
                            catch (Exception ex)
                            {
                                MessageBox.Show("Error running rule group: " + ex.ToString());
                                return;
                            }
                        }
                        MessageBox.Show("Rule group executed sucessful, check Rule Log History for additional details");
                    }
                }
                else if (dresult == DialogResult.No)
                {
                    MessageBox.Show("Execution Rule Group is canceled.");
                }
            }
        }
    }
}
