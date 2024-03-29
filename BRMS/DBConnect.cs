﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms; 

namespace BRMS
{
	public partial class DBConnect : Form
	{
		private readonly string _WINDOWSAUTH = "Windows Authentication";
		private readonly string _SQLAUTH = "SQL Server Authentication";
		private readonly string _LOGINTYPEWINDOWS = "0";
		private readonly string _LOGINTYPESQL = "1";
		private readonly string _SERVERANDUSERSEPARATOR = "@&";
		private readonly string _USERANDPASSWORDSEPARATOR = "~~~";
		//public string ConnectionString = "";
		public static string ConnectionString { get; internal set; }
		public DBConnect()
		{
			InitializeComponent();
		}

		private void buttonCancel_Click(object sender, EventArgs e)
		{
			this.DialogResult = DialogResult.Cancel;
			this.Close();
		}
		private void FormConnectToSQLServer_Load(object sender, EventArgs e)
		{
			GetDPI();
			LoadSharedDefaultValues();
			InitializePropertiesForFirstTimeUsers();
			LoadLastServerSelectedByThisUser();
			FormConnectToSQLServer_Resize(sender, e);
		}
		bool _highDPI = false;



        private void GetDPI()
		{
			float dx, dy;
			Graphics g = this.CreateGraphics();
			try
			{
				dx = g.DpiX;
				dy = g.DpiY;
				if (dx > 96)
					_highDPI = true;
			}
			finally
			{
				g.Dispose();
			}
		}
		public void LoadLastServerSelectedByThisUser()
		{
			if (Properties.Settings.Default.ServerNames != null)
			{
				var savedNames = Properties.Settings.Default.ServerNames;
				foreach (var item in savedNames)
				{
					this.comboBoxServerName.Items.Add(item);
				}
			}
			if (Properties.Settings.Default.LastDatabase != null)
			{
				var savedNames = Properties.Settings.Default.LastDatabase;
				foreach (var item in savedNames)
				{
					this.textDatabaseName.Text = item.ToString();
				}
			}
			if (Properties.Settings.Default.LoginNames != null)
			{
				var savedNames = Properties.Settings.Default.LoginNames;
				foreach (var item in savedNames)
				{
					this.comboBoxLogin.Items.Add(item);
				}
			}

			comboBoxServerName.Text = Properties.Settings.Default.LastServerName;
			textDatabaseName.Text = Properties.Settings.Default.LastDatabase;
		}

		private void buttonConnect_Click(object sender, EventArgs e)
		{
			EnableOrDisableAllFields(false);
			if (TestUserCredentials())
			{
				Properties.Settings.Default.Save();
				this.Hide();

				//Load Main Application
				Main form = new Main();
				form.Show();
				form.WindowState = FormWindowState.Maximized;
				
			}
			else
			{
				EnableOrDisableAllFields(true);
				EnableOrDisableFields(comboBoxAuthentication.Text.Equals(_SQLAUTH));
				this.DialogResult = DialogResult.None;
			}
		}
		private bool TestUserCredentials()
		{
			string selectedServer = comboBoxServerName.Text.Trim();
			string authType = comboBoxAuthentication.Text.Trim();
			string authNum = _LOGINTYPEWINDOWS;
			if (authType.Equals(_SQLAUTH))
				authNum = _LOGINTYPESQL;
			string selectedLogin = comboBoxLogin.Text.Trim();
			string selectedDatabase = textDatabaseName.Text.Trim();
			string concat = selectedServer + _SERVERANDUSERSEPARATOR + authNum + selectedLogin;
			if (!Properties.Settings.Default.ServerNames.Contains(selectedServer))
			{
				Properties.Settings.Default.ServerNames.Add(selectedServer);
			}
			if (!string.IsNullOrWhiteSpace(selectedLogin))
			{
				if (!Properties.Settings.Default.LoginNames.Contains(selectedLogin))
				{
					Properties.Settings.Default.LoginNames.Add(selectedLogin);
				}
				if (!Properties.Settings.Default.LastDatabase.Contains(selectedDatabase))
				{
					Properties.Settings.Default.LastDatabase.Contains(selectedDatabase);
				}
			}

			Properties.Settings.Default.LastServerName = selectedServer;
			Properties.Settings.Default.LastLogin = selectedLogin;
			Properties.Settings.Default.LastDatabase = selectedDatabase;
			Properties.Settings.Default.RememberChecked = checkBoxRememberPassword.Checked;
			if (checkBoxRememberPassword.Checked)
			{
				string encryptedPassword = textBoxPassword.Text.Trim().Protect(selectedServer);
				concat += _USERANDPASSWORDSEPARATOR + encryptedPassword;
			}
			bool found = false;
			foreach (var item in Properties.Settings.Default.ConcatStuff)
			{
				if (item.StartsWith(selectedServer + _SERVERANDUSERSEPARATOR))
				{
					Properties.Settings.Default.ConcatStuff.Remove(item);
					Properties.Settings.Default.ConcatStuff.Add(concat);
					found = true;
					break;
				}
			}
			if (found == false)
			{
				Properties.Settings.Default.ConcatStuff.Add(concat);
			}
			string login = "Integrated Security=true";
			if (authType.Equals(_SQLAUTH))
			{
				login = $"user id={selectedLogin};password={textBoxPassword.Text.Trim()}";
			}

			ConnectionString = "Data Source=" + selectedServer + ";Initial Catalog=" + selectedDatabase + ";" + login;
            return AttemptDatabaseConnection(ConnectionString, selectedServer);
		}

		private bool AttemptDatabaseConnection(string connString, string selectedServer)
		{
			try
			{
				using (System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(connString))
				{
					conn.Open();
					ConnectionString = connString; 
				}
			}
			catch (Exception ex)
			{
				MessageBox.Show("Cannot connect to " + selectedServer + "." + Environment.NewLine + Environment.NewLine + "Additional information: " + Environment.NewLine + ex.Message, "Connect to Server", MessageBoxButtons.OK);
				return false;
			}
			return true;
		}


		private void comboBoxServerName_SelectedIndexChanged(object sender, EventArgs e)
		{
			string selectedServer = comboBoxServerName.Text.Trim();
			foreach (var item in Properties.Settings.Default.ConcatStuff)
			{
				if (item.StartsWith(selectedServer + _SERVERANDUSERSEPARATOR))
					PopulateDefaultsForSelectedServer(item.Replace(selectedServer + _SERVERANDUSERSEPARATOR, ""));
			}
			if (string.IsNullOrWhiteSpace(comboBoxAuthentication.Text))
			{
				comboBoxAuthentication.Text = comboBoxAuthentication.Items[0].ToString();
			}
		}

		private void PopulateDefaultsForSelectedServer(string concat)
		{
			string lastAuth = concat.Substring(0, 1);
			if (lastAuth == _LOGINTYPEWINDOWS)
			{
				comboBoxAuthentication.Text = _WINDOWSAUTH;
			}
			else
			{
				comboBoxAuthentication.Text = _SQLAUTH;
				concat = concat.Substring(1);
				int indexOfPassword = concat.IndexOf(_USERANDPASSWORDSEPARATOR);
				if (indexOfPassword >= 0)
				{
					comboBoxLogin.Text = concat.Substring(0, indexOfPassword);
					string lastPwd = concat.Substring(indexOfPassword + _USERANDPASSWORDSEPARATOR.Length);
					textBoxPassword.Text = lastPwd.Unprotect(comboBoxServerName.Text.Trim());
					checkBoxRememberPassword.Checked = true;
				}
				else
				{
					comboBoxLogin.Text = concat;
					textBoxPassword.Text = "";
					checkBoxRememberPassword.Checked = false;
				}
			}
		}

		private void comboBoxAuthentication_SelectedIndexChanged(object sender, EventArgs e)
		{
			EnableDisableBasedOnAuthMethod(comboBoxAuthentication.Text.Equals(_SQLAUTH));
		}

		private static void InitializePropertiesForFirstTimeUsers()
		{
			if (Properties.Settings.Default.ServerNames == null)
			{
				Properties.Settings.Default.ServerNames = new System.Collections.Specialized.StringCollection();
			}
			if (Properties.Settings.Default.LoginNames == null)
			{
				Properties.Settings.Default.LoginNames = new System.Collections.Specialized.StringCollection();
			}
			if (Properties.Settings.Default.ConcatStuff == null)
			{
				Properties.Settings.Default.ConcatStuff = new System.Collections.Specialized.StringCollection();
			}
		}

		private void EnableOrDisableAllFields(bool enable)
		{
			EnableOrDisableFields(enable);
			comboBoxAuthentication.Enabled = enable;
			comboBoxServerName.Enabled = enable;
			labelAuthentication.Enabled = enable;
			labelServerName.Enabled = enable;
			comboBoxServerType.Enabled = enable;
			labelServerType.Enabled = enable;
			buttonConnect.Enabled = enable;
			buttonCancel.Enabled = enable; 
		}

		private void EnableDisableBasedOnAuthMethod(bool sqlAuth)
		{
			EnableOrDisableFields(sqlAuth);
			if (sqlAuth == false)
			{
				comboBoxLogin.Text = "";
				textBoxPassword.Text = "";
			}
		}

		private void EnableOrDisableFields(bool enable)
		{
			comboBoxLogin.Enabled = enable;
			textBoxPassword.Enabled = enable;
			checkBoxRememberPassword.Enabled = enable;
			labelLogin.Enabled = enable;
			labelPassword.Enabled = enable;
		}

		private void LoadSharedDefaultValues()
		{
			buttonHelp.Visible = false;
			buttonOptions.Visible = false;

			comboBoxAuthentication.Items.Add(_WINDOWSAUTH);
			comboBoxAuthentication.Items.Add(_SQLAUTH);
			comboBoxAuthentication.Text = _WINDOWSAUTH;
			comboBoxAuthentication.DropDownStyle = ComboBoxStyle.DropDownList;

			comboBoxServerType.Items.Add("Database Engine");
			comboBoxServerType.Text = "Database Engine";
			comboBoxServerType.DropDownStyle = ComboBoxStyle.DropDownList;
		}


		private void FormConnectToSQLServer_Resize(object sender, EventArgs e)
		{
			int rightoffset = 164;
			if (!_highDPI)
			{
				rightoffset = 64;
				this.Height = 360;
			}
			this.CenterToParent();
			comboBoxServerType.Width = this.Width - comboBoxServerType.Left - rightoffset;
			comboBoxServerName.Width = this.Width - comboBoxServerName.Left - rightoffset;
			comboBoxLogin.Width = this.Width - comboBoxLogin.Left - rightoffset;
			comboBoxAuthentication.Width = this.Width - comboBoxAuthentication.Left - rightoffset;
			textBoxPassword.Width = this.Width - textBoxPassword.Left - rightoffset;
		}
    }
}
