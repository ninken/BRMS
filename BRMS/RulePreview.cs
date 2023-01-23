using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace BRMS
{
    public partial class RulePreview : Form
    {
        public RulePreview()
        {
            InitializeComponent();
        }

        private void btnPreview_Click(object sender, EventArgs e)
        {
            string prevsql = Business.vSQLPreview;

            if (rowcnt.Value == 0)
            {
                using (SqlConnection conn = new SqlConnection(connectionString: DBConnect.ConnectionString))
                {
                    conn.Open();

                    string selectCommand = prevsql;
                    SqlDataAdapter adapter = new SqlDataAdapter(selectCommand, conn);
                    DataTable table = new DataTable();
                    adapter.Fill(table);

                    dataGridView1.DataSource = table;
                }
            }
            else
            {
                prevsql = prevsql.Replace("SELECT *", "SELECT TOP " +rowcnt.Value.ToString()+ "*");

                using (SqlConnection conn = new SqlConnection(connectionString: DBConnect.ConnectionString))
                {
                    conn.Open();

                    string selectCommand = prevsql;
                    SqlDataAdapter adapter = new SqlDataAdapter(selectCommand, conn);
                    DataTable table = new DataTable();
                    adapter.Fill(table);

                    dataGridView1.DataSource = table;
                }


            }
        }
    }
}
