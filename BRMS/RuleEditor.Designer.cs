
namespace BRMS
{
    partial class RuleEditor
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(RuleEditor));
            this.panel1 = new System.Windows.Forms.Panel();
            this.panel3 = new System.Windows.Forms.Panel();
            this.label5 = new System.Windows.Forms.Label();
            this.dtEnd = new System.Windows.Forms.DateTimePicker();
            this.label4 = new System.Windows.Forms.Label();
            this.dtStart = new System.Windows.Forms.DateTimePicker();
            this.chkEnable = new System.Windows.Forms.CheckBox();
            this.txtName = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.lbTitle = new System.Windows.Forms.Label();
            this.panel5 = new System.Windows.Forms.Panel();
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.RichExpression = new System.Windows.Forms.RichTextBox();
            this.lstCMD = new System.Windows.Forms.ListBox();
            this.lstColumns = new System.Windows.Forms.ListBox();
            this.panel4 = new System.Windows.Forms.Panel();
            this.btnOR = new System.Windows.Forms.Button();
            this.btnAND = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.lblType = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.btnPrev = new System.Windows.Forms.Button();
            this.btnCheck = new System.Windows.Forms.Button();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.panel7 = new System.Windows.Forms.Panel();
            this.RichSet = new System.Windows.Forms.RichTextBox();
            this.panel9 = new System.Windows.Forms.Panel();
            this.lstViewColumns = new System.Windows.Forms.ListBox();
            this.panel8 = new System.Windows.Forms.Panel();
            this.lstTable = new System.Windows.Forms.ListBox();
            this.panel6 = new System.Windows.Forms.Panel();
            this.btnRunRule = new System.Windows.Forms.Button();
            this.lbvset = new System.Windows.Forms.Label();
            this.lbtset = new System.Windows.Forms.Label();
            this.btnUpdateCheck = new System.Windows.Forms.Button();
            this.label8 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.panel2 = new System.Windows.Forms.Panel();
            this.btnAdd = new System.Windows.Forms.Button();
            this.btnCancel = new System.Windows.Forms.Button();
            this.panel1.SuspendLayout();
            this.panel3.SuspendLayout();
            this.panel5.SuspendLayout();
            this.tabControl1.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.panel4.SuspendLayout();
            this.tabPage2.SuspendLayout();
            this.panel7.SuspendLayout();
            this.panel9.SuspendLayout();
            this.panel8.SuspendLayout();
            this.panel6.SuspendLayout();
            this.panel2.SuspendLayout();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.SteelBlue;
            this.panel1.Controls.Add(this.panel3);
            this.panel1.Controls.Add(this.lbTitle);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(759, 128);
            this.panel1.TabIndex = 0;
            // 
            // panel3
            // 
            this.panel3.BackColor = System.Drawing.Color.White;
            this.panel3.Controls.Add(this.label5);
            this.panel3.Controls.Add(this.dtEnd);
            this.panel3.Controls.Add(this.label4);
            this.panel3.Controls.Add(this.dtStart);
            this.panel3.Controls.Add(this.chkEnable);
            this.panel3.Controls.Add(this.txtName);
            this.panel3.Controls.Add(this.label2);
            this.panel3.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.panel3.Location = new System.Drawing.Point(0, 40);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(759, 88);
            this.panel3.TabIndex = 23;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(628, 41);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(77, 13);
            this.label5.TabIndex = 24;
            this.label5.Text = "Rule End Date";
            // 
            // dtEnd
            // 
            this.dtEnd.CalendarFont = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtEnd.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtEnd.Location = new System.Drawing.Point(587, 56);
            this.dtEnd.Margin = new System.Windows.Forms.Padding(0);
            this.dtEnd.Name = "dtEnd";
            this.dtEnd.Size = new System.Drawing.Size(163, 22);
            this.dtEnd.TabIndex = 23;
            this.dtEnd.Value = new System.DateTime(2023, 1, 9, 0, 0, 0, 0);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(452, 41);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(80, 13);
            this.label4.TabIndex = 22;
            this.label4.Text = "Rule Start Date";
            // 
            // dtStart
            // 
            this.dtStart.CalendarFont = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtStart.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtStart.Location = new System.Drawing.Point(412, 56);
            this.dtStart.Margin = new System.Windows.Forms.Padding(0);
            this.dtStart.Name = "dtStart";
            this.dtStart.Size = new System.Drawing.Size(163, 22);
            this.dtStart.TabIndex = 21;
            this.dtStart.Value = new System.DateTime(2023, 1, 9, 0, 0, 0, 0);
            // 
            // chkEnable
            // 
            this.chkEnable.AutoSize = true;
            this.chkEnable.Checked = true;
            this.chkEnable.CheckState = System.Windows.Forms.CheckState.Checked;
            this.chkEnable.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkEnable.Location = new System.Drawing.Point(614, 12);
            this.chkEnable.Name = "chkEnable";
            this.chkEnable.Size = new System.Drawing.Size(136, 24);
            this.chkEnable.TabIndex = 10;
            this.chkEnable.Text = "Enabled Rule";
            this.chkEnable.UseVisualStyleBackColor = true;
            // 
            // txtName
            // 
            this.txtName.Font = new System.Drawing.Font("Microsoft Sans Serif", 16F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtName.Location = new System.Drawing.Point(126, 6);
            this.txtName.MaxLength = 200;
            this.txtName.Name = "txtName";
            this.txtName.Size = new System.Drawing.Size(482, 32);
            this.txtName.TabIndex = 9;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 16F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(5, 12);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(128, 26);
            this.label2.TabIndex = 8;
            this.label2.Text = "Rule Name:";
            // 
            // lbTitle
            // 
            this.lbTitle.AutoSize = true;
            this.lbTitle.Font = new System.Drawing.Font("Microsoft Sans Serif", 16F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbTitle.ForeColor = System.Drawing.Color.White;
            this.lbTitle.Location = new System.Drawing.Point(3, 9);
            this.lbTitle.Name = "lbTitle";
            this.lbTitle.Size = new System.Drawing.Size(209, 26);
            this.lbTitle.TabIndex = 0;
            this.lbTitle.Text = "Create a new Rule";
            // 
            // panel5
            // 
            this.panel5.Controls.Add(this.tabControl1);
            this.panel5.Controls.Add(this.panel2);
            this.panel5.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel5.Location = new System.Drawing.Point(0, 128);
            this.panel5.Name = "panel5";
            this.panel5.Size = new System.Drawing.Size(759, 435);
            this.panel5.TabIndex = 22;
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabPage1);
            this.tabControl1.Controls.Add(this.tabPage2);
            this.tabControl1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tabControl1.Location = new System.Drawing.Point(0, 0);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.Padding = new System.Drawing.Point(6, 6);
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(759, 383);
            this.tabControl1.TabIndex = 23;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.RichExpression);
            this.tabPage1.Controls.Add(this.lstCMD);
            this.tabPage1.Controls.Add(this.lstColumns);
            this.tabPage1.Controls.Add(this.panel4);
            this.tabPage1.Location = new System.Drawing.Point(4, 28);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(751, 351);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "Rule Expression";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // RichExpression
            // 
            this.RichExpression.Dock = System.Windows.Forms.DockStyle.Fill;
            this.RichExpression.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.RichExpression.Location = new System.Drawing.Point(252, 42);
            this.RichExpression.Name = "RichExpression";
            this.RichExpression.Size = new System.Drawing.Size(496, 306);
            this.RichExpression.TabIndex = 27;
            this.RichExpression.Text = "";
            this.RichExpression.TextChanged += new System.EventHandler(this.RichExpression_TextChanged);
            // 
            // lstCMD
            // 
            this.lstCMD.Dock = System.Windows.Forms.DockStyle.Left;
            this.lstCMD.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lstCMD.FormattingEnabled = true;
            this.lstCMD.Location = new System.Drawing.Point(186, 42);
            this.lstCMD.Name = "lstCMD";
            this.lstCMD.Size = new System.Drawing.Size(66, 306);
            this.lstCMD.TabIndex = 26;
            this.lstCMD.DoubleClick += new System.EventHandler(this.lstCMD_DoubleClick);
            // 
            // lstColumns
            // 
            this.lstColumns.Dock = System.Windows.Forms.DockStyle.Left;
            this.lstColumns.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lstColumns.FormattingEnabled = true;
            this.lstColumns.ItemHeight = 16;
            this.lstColumns.Location = new System.Drawing.Point(3, 42);
            this.lstColumns.Name = "lstColumns";
            this.lstColumns.Size = new System.Drawing.Size(183, 306);
            this.lstColumns.TabIndex = 25;
            this.lstColumns.SelectedIndexChanged += new System.EventHandler(this.lstColumns_SelectedIndexChanged);
            this.lstColumns.DoubleClick += new System.EventHandler(this.lstColumns_DoubleClick);
            // 
            // panel4
            // 
            this.panel4.Controls.Add(this.btnOR);
            this.panel4.Controls.Add(this.btnAND);
            this.panel4.Controls.Add(this.label3);
            this.panel4.Controls.Add(this.lblType);
            this.panel4.Controls.Add(this.label1);
            this.panel4.Controls.Add(this.btnPrev);
            this.panel4.Controls.Add(this.btnCheck);
            this.panel4.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel4.Location = new System.Drawing.Point(3, 3);
            this.panel4.Name = "panel4";
            this.panel4.Size = new System.Drawing.Size(745, 39);
            this.panel4.TabIndex = 23;
            // 
            // btnOR
            // 
            this.btnOR.BackColor = System.Drawing.Color.LightBlue;
            this.btnOR.Location = new System.Drawing.Point(377, 11);
            this.btnOR.Name = "btnOR";
            this.btnOR.Size = new System.Drawing.Size(39, 23);
            this.btnOR.TabIndex = 29;
            this.btnOR.TabStop = false;
            this.btnOR.Text = "OR";
            this.btnOR.UseVisualStyleBackColor = false;
            this.btnOR.Click += new System.EventHandler(this.btnOR_Click);
            // 
            // btnAND
            // 
            this.btnAND.BackColor = System.Drawing.Color.LightBlue;
            this.btnAND.Location = new System.Drawing.Point(335, 11);
            this.btnAND.Name = "btnAND";
            this.btnAND.Size = new System.Drawing.Size(39, 23);
            this.btnAND.TabIndex = 28;
            this.btnAND.TabStop = false;
            this.btnAND.Text = "AND";
            this.btnAND.UseVisualStyleBackColor = false;
            this.btnAND.Click += new System.EventHandler(this.btnAND_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(252, 19);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(77, 17);
            this.label3.TabIndex = 27;
            this.label3.Text = "Expression";
            // 
            // lblType
            // 
            this.lblType.AutoSize = true;
            this.lblType.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblType.Location = new System.Drawing.Point(184, 21);
            this.lblType.Name = "lblType";
            this.lblType.Size = new System.Drawing.Size(11, 13);
            this.lblType.TabIndex = 26;
            this.lblType.Text = ".";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(31, 19);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(95, 17);
            this.label1.TabIndex = 25;
            this.label1.Text = "View Columns";
            // 
            // btnPrev
            // 
            this.btnPrev.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnPrev.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnPrev.Location = new System.Drawing.Point(629, 8);
            this.btnPrev.Name = "btnPrev";
            this.btnPrev.Size = new System.Drawing.Size(111, 23);
            this.btnPrev.TabIndex = 24;
            this.btnPrev.Text = "Preview Results";
            this.btnPrev.UseVisualStyleBackColor = true;
            this.btnPrev.Click += new System.EventHandler(this.btnPrev_Click);
            // 
            // btnCheck
            // 
            this.btnCheck.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnCheck.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnCheck.Location = new System.Drawing.Point(535, 8);
            this.btnCheck.Name = "btnCheck";
            this.btnCheck.Size = new System.Drawing.Size(88, 23);
            this.btnCheck.TabIndex = 23;
            this.btnCheck.Text = "Check SQL";
            this.btnCheck.UseVisualStyleBackColor = true;
            this.btnCheck.Click += new System.EventHandler(this.btnCheck_Click);
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.panel7);
            this.tabPage2.Controls.Add(this.panel6);
            this.tabPage2.Location = new System.Drawing.Point(4, 28);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(751, 351);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "Set Values";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // panel7
            // 
            this.panel7.Controls.Add(this.RichSet);
            this.panel7.Controls.Add(this.panel9);
            this.panel7.Controls.Add(this.panel8);
            this.panel7.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel7.Location = new System.Drawing.Point(3, 34);
            this.panel7.Name = "panel7";
            this.panel7.Size = new System.Drawing.Size(745, 314);
            this.panel7.TabIndex = 29;
            // 
            // RichSet
            // 
            this.RichSet.Dock = System.Windows.Forms.DockStyle.Fill;
            this.RichSet.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.RichSet.Location = new System.Drawing.Point(165, 0);
            this.RichSet.Name = "RichSet";
            this.RichSet.Size = new System.Drawing.Size(403, 314);
            this.RichSet.TabIndex = 22;
            this.RichSet.Text = "";
            // 
            // panel9
            // 
            this.panel9.Controls.Add(this.lstViewColumns);
            this.panel9.Dock = System.Windows.Forms.DockStyle.Right;
            this.panel9.Location = new System.Drawing.Point(568, 0);
            this.panel9.Name = "panel9";
            this.panel9.Size = new System.Drawing.Size(177, 314);
            this.panel9.TabIndex = 1;
            // 
            // lstViewColumns
            // 
            this.lstViewColumns.Dock = System.Windows.Forms.DockStyle.Right;
            this.lstViewColumns.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lstViewColumns.FormattingEnabled = true;
            this.lstViewColumns.ItemHeight = 16;
            this.lstViewColumns.Location = new System.Drawing.Point(6, 0);
            this.lstViewColumns.Name = "lstViewColumns";
            this.lstViewColumns.Size = new System.Drawing.Size(171, 314);
            this.lstViewColumns.TabIndex = 28;
            this.lstViewColumns.SelectedIndexChanged += new System.EventHandler(this.lstViewColumns_SelectedIndexChanged);
            this.lstViewColumns.DoubleClick += new System.EventHandler(this.lstViewColumns_DoubleClick);
            // 
            // panel8
            // 
            this.panel8.Controls.Add(this.lstTable);
            this.panel8.Dock = System.Windows.Forms.DockStyle.Left;
            this.panel8.Location = new System.Drawing.Point(0, 0);
            this.panel8.Name = "panel8";
            this.panel8.Size = new System.Drawing.Size(165, 314);
            this.panel8.TabIndex = 0;
            // 
            // lstTable
            // 
            this.lstTable.Dock = System.Windows.Forms.DockStyle.Left;
            this.lstTable.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lstTable.FormattingEnabled = true;
            this.lstTable.ItemHeight = 16;
            this.lstTable.Location = new System.Drawing.Point(0, 0);
            this.lstTable.Name = "lstTable";
            this.lstTable.Size = new System.Drawing.Size(161, 314);
            this.lstTable.TabIndex = 27;
            this.lstTable.SelectedIndexChanged += new System.EventHandler(this.lstTable_SelectedIndexChanged);
            this.lstTable.DoubleClick += new System.EventHandler(this.lstTable_DoubleClick);
            // 
            // panel6
            // 
            this.panel6.Controls.Add(this.btnRunRule);
            this.panel6.Controls.Add(this.lbvset);
            this.panel6.Controls.Add(this.lbtset);
            this.panel6.Controls.Add(this.btnUpdateCheck);
            this.panel6.Controls.Add(this.label8);
            this.panel6.Controls.Add(this.label6);
            this.panel6.Controls.Add(this.label7);
            this.panel6.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel6.Location = new System.Drawing.Point(3, 3);
            this.panel6.Name = "panel6";
            this.panel6.Size = new System.Drawing.Size(745, 31);
            this.panel6.TabIndex = 28;
            // 
            // btnRunRule
            // 
            this.btnRunRule.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnRunRule.Location = new System.Drawing.Point(386, 5);
            this.btnRunRule.Name = "btnRunRule";
            this.btnRunRule.Size = new System.Drawing.Size(88, 23);
            this.btnRunRule.TabIndex = 32;
            this.btnRunRule.Text = "Run Rule";
            this.btnRunRule.UseVisualStyleBackColor = true;
            this.btnRunRule.Click += new System.EventHandler(this.btnRunRule_Click);
            // 
            // lbvset
            // 
            this.lbvset.AutoSize = true;
            this.lbvset.Font = new System.Drawing.Font("Microsoft Sans Serif", 7F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbvset.Location = new System.Drawing.Point(621, 17);
            this.lbvset.Name = "lbvset";
            this.lbvset.Size = new System.Drawing.Size(10, 13);
            this.lbvset.TabIndex = 31;
            this.lbvset.Text = ".";
            // 
            // lbtset
            // 
            this.lbtset.AutoSize = true;
            this.lbtset.Font = new System.Drawing.Font("Microsoft Sans Serif", 7F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbtset.Location = new System.Drawing.Point(35, 15);
            this.lbtset.Name = "lbtset";
            this.lbtset.Size = new System.Drawing.Size(10, 13);
            this.lbtset.TabIndex = 30;
            this.lbtset.Text = ".";
            // 
            // btnUpdateCheck
            // 
            this.btnUpdateCheck.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnUpdateCheck.Location = new System.Drawing.Point(241, 5);
            this.btnUpdateCheck.Name = "btnUpdateCheck";
            this.btnUpdateCheck.Size = new System.Drawing.Size(139, 23);
            this.btnUpdateCheck.TabIndex = 29;
            this.btnUpdateCheck.Text = "Check Update SQL";
            this.btnUpdateCheck.UseVisualStyleBackColor = true;
            this.btnUpdateCheck.Click += new System.EventHandler(this.btnUpdateCheck_Click);
            // 
            // label8
            // 
            this.label8.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.Location = new System.Drawing.Point(604, 1);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(120, 17);
            this.label8.TabIndex = 26;
            this.label8.Text = "View Set Columns";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(172, 8);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(63, 17);
            this.label6.TabIndex = 25;
            this.label6.Text = "Set Data";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(8, 1);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(127, 17);
            this.label7.TabIndex = 24;
            this.label7.Text = "Table Set Columns";
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.btnAdd);
            this.panel2.Controls.Add(this.btnCancel);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.panel2.Location = new System.Drawing.Point(0, 383);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(759, 52);
            this.panel2.TabIndex = 22;
            // 
            // btnAdd
            // 
            this.btnAdd.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.btnAdd.Font = new System.Drawing.Font("Microsoft Sans Serif", 16F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnAdd.Location = new System.Drawing.Point(18, 5);
            this.btnAdd.Name = "btnAdd";
            this.btnAdd.Size = new System.Drawing.Size(160, 39);
            this.btnAdd.TabIndex = 8;
            this.btnAdd.Text = "&Add Rule";
            this.btnAdd.UseVisualStyleBackColor = true;
            this.btnAdd.Click += new System.EventHandler(this.btnAdd_Click);
            // 
            // btnCancel
            // 
            this.btnCancel.Anchor = System.Windows.Forms.AnchorStyles.Right;
            this.btnCancel.Font = new System.Drawing.Font("Microsoft Sans Serif", 16F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnCancel.Location = new System.Drawing.Point(575, 5);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Padding = new System.Windows.Forms.Padding(4);
            this.btnCancel.Size = new System.Drawing.Size(160, 39);
            this.btnCancel.TabIndex = 7;
            this.btnCancel.Text = "&Cancel";
            this.btnCancel.UseVisualStyleBackColor = true;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // RuleEditor
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(759, 563);
            this.Controls.Add(this.panel5);
            this.Controls.Add(this.panel1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "RuleEditor";
            this.Text = "RuleEditor";
            this.Load += new System.EventHandler(this.RuleEditor_Load);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.panel3.ResumeLayout(false);
            this.panel3.PerformLayout();
            this.panel5.ResumeLayout(false);
            this.tabControl1.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.panel4.ResumeLayout(false);
            this.panel4.PerformLayout();
            this.tabPage2.ResumeLayout(false);
            this.panel7.ResumeLayout(false);
            this.panel9.ResumeLayout(false);
            this.panel8.ResumeLayout(false);
            this.panel6.ResumeLayout(false);
            this.panel6.PerformLayout();
            this.panel2.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label lbTitle;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.DateTimePicker dtEnd;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.DateTimePicker dtStart;
        private System.Windows.Forms.CheckBox chkEnable;
        private System.Windows.Forms.TextBox txtName;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Panel panel5;
        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.RichTextBox RichExpression;
        private System.Windows.Forms.ListBox lstCMD;
        private System.Windows.Forms.ListBox lstColumns;
        private System.Windows.Forms.Panel panel4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label lblType;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnPrev;
        private System.Windows.Forms.Button btnCheck;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.Panel panel7;
        private System.Windows.Forms.RichTextBox RichSet;
        private System.Windows.Forms.Panel panel9;
        private System.Windows.Forms.ListBox lstViewColumns;
        private System.Windows.Forms.Panel panel8;
        private System.Windows.Forms.ListBox lstTable;
        private System.Windows.Forms.Panel panel6;
        private System.Windows.Forms.Button btnUpdateCheck;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Button btnAdd;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.Button btnOR;
        private System.Windows.Forms.Button btnAND;
        private System.Windows.Forms.Label lbvset;
        private System.Windows.Forms.Label lbtset;
        private System.Windows.Forms.Button btnRunRule;
    }
}