
namespace BRMS
{
    partial class RuleGroupEdit
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(RuleGroupEdit));
            this.txtName = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.btnAdd = new System.Windows.Forms.Button();
            this.btnCancel = new System.Windows.Forms.Button();
            this.panel1 = new System.Windows.Forms.Panel();
            this.lbTitle = new System.Windows.Forms.Label();
            this.panel2 = new System.Windows.Forms.Panel();
            this.cbDBtbl = new System.Windows.Forms.ComboBox();
            this.cbtblKey = new System.Windows.Forms.ComboBox();
            this.lbKey = new System.Windows.Forms.Label();
            this.cbtbl = new System.Windows.Forms.ComboBox();
            this.lblDatabase = new System.Windows.Forms.Label();
            this.lbTable = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.panel3 = new System.Windows.Forms.Panel();
            this.cbDBView = new System.Windows.Forms.ComboBox();
            this.cbViewKey = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.cbView = new System.Windows.Forms.ComboBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.chkEnable = new System.Windows.Forms.CheckBox();
            this.panel1.SuspendLayout();
            this.panel2.SuspendLayout();
            this.panel3.SuspendLayout();
            this.SuspendLayout();
            // 
            // txtName
            // 
            this.txtName.Font = new System.Drawing.Font("Microsoft Sans Serif", 16F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtName.Location = new System.Drawing.Point(206, 60);
            this.txtName.MaxLength = 200;
            this.txtName.Name = "txtName";
            this.txtName.Size = new System.Drawing.Size(435, 32);
            this.txtName.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 16F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(12, 60);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(194, 26);
            this.label1.TabIndex = 2;
            this.label1.Text = "Rule Group Name:";
            // 
            // btnAdd
            // 
            this.btnAdd.Font = new System.Drawing.Font("Microsoft Sans Serif", 16F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnAdd.Location = new System.Drawing.Point(32, 429);
            this.btnAdd.Name = "btnAdd";
            this.btnAdd.Size = new System.Drawing.Size(160, 39);
            this.btnAdd.TabIndex = 8;
            this.btnAdd.Text = "&Create Group";
            this.btnAdd.UseVisualStyleBackColor = true;
            this.btnAdd.Click += new System.EventHandler(this.btnAdd_Click);
            // 
            // btnCancel
            // 
            this.btnCancel.Font = new System.Drawing.Font("Microsoft Sans Serif", 16F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnCancel.Location = new System.Drawing.Point(481, 429);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(160, 39);
            this.btnCancel.TabIndex = 9;
            this.btnCancel.Text = "&Cancel";
            this.btnCancel.UseVisualStyleBackColor = true;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.SteelBlue;
            this.panel1.Controls.Add(this.lbTitle);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(657, 38);
            this.panel1.TabIndex = 6;
            // 
            // lbTitle
            // 
            this.lbTitle.AutoSize = true;
            this.lbTitle.Font = new System.Drawing.Font("Microsoft Sans Serif", 16F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbTitle.ForeColor = System.Drawing.Color.White;
            this.lbTitle.Location = new System.Drawing.Point(12, 7);
            this.lbTitle.Name = "lbTitle";
            this.lbTitle.Size = new System.Drawing.Size(281, 26);
            this.lbTitle.TabIndex = 0;
            this.lbTitle.Text = "Create a new Rule Group";
            // 
            // panel2
            // 
            this.panel2.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel2.Controls.Add(this.cbDBtbl);
            this.panel2.Controls.Add(this.cbtblKey);
            this.panel2.Controls.Add(this.lbKey);
            this.panel2.Controls.Add(this.cbtbl);
            this.panel2.Controls.Add(this.lblDatabase);
            this.panel2.Controls.Add(this.lbTable);
            this.panel2.Location = new System.Drawing.Point(340, 134);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(301, 227);
            this.panel2.TabIndex = 11;
            // 
            // cbDBtbl
            // 
            this.cbDBtbl.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cbDBtbl.FormattingEnabled = true;
            this.cbDBtbl.Location = new System.Drawing.Point(26, 48);
            this.cbDBtbl.Name = "cbDBtbl";
            this.cbDBtbl.Size = new System.Drawing.Size(256, 24);
            this.cbDBtbl.TabIndex = 4;
            this.cbDBtbl.SelectedIndexChanged += new System.EventHandler(this.cbDBtbl_SelectedIndexChanged);
            // 
            // cbtblKey
            // 
            this.cbtblKey.Enabled = false;
            this.cbtblKey.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cbtblKey.FormattingEnabled = true;
            this.cbtblKey.Location = new System.Drawing.Point(26, 156);
            this.cbtblKey.Name = "cbtblKey";
            this.cbtblKey.Size = new System.Drawing.Size(256, 24);
            this.cbtblKey.TabIndex = 6;
            this.cbtblKey.SelectedIndexChanged += new System.EventHandler(this.cbtblKey_SelectedIndexChanged);
            // 
            // lbKey
            // 
            this.lbKey.AutoSize = true;
            this.lbKey.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbKey.Location = new System.Drawing.Point(110, 133);
            this.lbKey.Name = "lbKey";
            this.lbKey.Size = new System.Drawing.Size(73, 20);
            this.lbKey.TabIndex = 17;
            this.lbKey.Text = "Key Field";
            // 
            // cbtbl
            // 
            this.cbtbl.Enabled = false;
            this.cbtbl.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cbtbl.FormattingEnabled = true;
            this.cbtbl.Location = new System.Drawing.Point(26, 102);
            this.cbtbl.Name = "cbtbl";
            this.cbtbl.Size = new System.Drawing.Size(256, 24);
            this.cbtbl.TabIndex = 5;
            this.cbtbl.SelectedIndexChanged += new System.EventHandler(this.cbtbl_SelectedIndexChanged);
            // 
            // lblDatabase
            // 
            this.lblDatabase.AutoSize = true;
            this.lblDatabase.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDatabase.Location = new System.Drawing.Point(105, 25);
            this.lblDatabase.Name = "lblDatabase";
            this.lblDatabase.Size = new System.Drawing.Size(91, 20);
            this.lblDatabase.TabIndex = 14;
            this.lblDatabase.Text = "Databases ";
            // 
            // lbTable
            // 
            this.lbTable.AutoSize = true;
            this.lbTable.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbTable.Location = new System.Drawing.Point(121, 79);
            this.lbTable.Name = "lbTable";
            this.lbTable.Size = new System.Drawing.Size(48, 20);
            this.lbTable.TabIndex = 15;
            this.lbTable.Text = "Table";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(353, 123);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(156, 17);
            this.label2.TabIndex = 21;
            this.label2.Text = "Select Update Table";
            // 
            // panel3
            // 
            this.panel3.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel3.Controls.Add(this.cbDBView);
            this.panel3.Controls.Add(this.cbViewKey);
            this.panel3.Controls.Add(this.label3);
            this.panel3.Controls.Add(this.cbView);
            this.panel3.Controls.Add(this.label4);
            this.panel3.Controls.Add(this.label5);
            this.panel3.Location = new System.Drawing.Point(17, 134);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(301, 227);
            this.panel3.TabIndex = 19;
            // 
            // cbDBView
            // 
            this.cbDBView.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cbDBView.FormattingEnabled = true;
            this.cbDBView.Location = new System.Drawing.Point(26, 48);
            this.cbDBView.Name = "cbDBView";
            this.cbDBView.Size = new System.Drawing.Size(256, 24);
            this.cbDBView.TabIndex = 1;
            this.cbDBView.SelectedIndexChanged += new System.EventHandler(this.cbDBView_SelectedIndexChanged);
            // 
            // cbViewKey
            // 
            this.cbViewKey.Enabled = false;
            this.cbViewKey.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cbViewKey.FormattingEnabled = true;
            this.cbViewKey.Location = new System.Drawing.Point(26, 156);
            this.cbViewKey.Name = "cbViewKey";
            this.cbViewKey.Size = new System.Drawing.Size(256, 24);
            this.cbViewKey.TabIndex = 3;
            this.cbViewKey.SelectedIndexChanged += new System.EventHandler(this.cbViewKey_SelectedIndexChanged);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(110, 133);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(73, 20);
            this.label3.TabIndex = 17;
            this.label3.Text = "Key Field";
            // 
            // cbView
            // 
            this.cbView.Enabled = false;
            this.cbView.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cbView.FormattingEnabled = true;
            this.cbView.Location = new System.Drawing.Point(26, 102);
            this.cbView.Name = "cbView";
            this.cbView.Size = new System.Drawing.Size(256, 24);
            this.cbView.TabIndex = 2;
            this.cbView.SelectedIndexChanged += new System.EventHandler(this.cbView_SelectedIndexChanged);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(105, 25);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(91, 20);
            this.label4.TabIndex = 14;
            this.label4.Text = "Databases ";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(121, 79);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(43, 20);
            this.label5.TabIndex = 15;
            this.label5.Text = "View";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(36, 123);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(129, 17);
            this.label6.TabIndex = 22;
            this.label6.Text = "Select Rule View";
            // 
            // chkEnable
            // 
            this.chkEnable.AutoSize = true;
            this.chkEnable.Checked = true;
            this.chkEnable.CheckState = System.Windows.Forms.CheckState.Checked;
            this.chkEnable.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkEnable.Location = new System.Drawing.Point(248, 380);
            this.chkEnable.Name = "chkEnable";
            this.chkEnable.Size = new System.Drawing.Size(191, 24);
            this.chkEnable.TabIndex = 7;
            this.chkEnable.Text = "Enabled Rule Group";
            this.chkEnable.UseVisualStyleBackColor = true;
            // 
            // RuleGroupEdit
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(657, 480);
            this.Controls.Add(this.chkEnable);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.panel3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.btnCancel);
            this.Controls.Add(this.btnAdd);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtName);
            this.Controls.Add(this.panel2);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "RuleGroupEdit";
            this.Text = "Add Rule";
            this.Load += new System.EventHandler(this.RuleGroupEdit_Load);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.panel3.ResumeLayout(false);
            this.panel3.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.TextBox txtName;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnAdd;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label lbTitle;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.ComboBox cbDBtbl;
        private System.Windows.Forms.ComboBox cbtblKey;
        private System.Windows.Forms.Label lbKey;
        private System.Windows.Forms.ComboBox cbtbl;
        private System.Windows.Forms.Label lblDatabase;
        private System.Windows.Forms.Label lbTable;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.ComboBox cbDBView;
        private System.Windows.Forms.ComboBox cbViewKey;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ComboBox cbView;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.CheckBox chkEnable;
    }
}