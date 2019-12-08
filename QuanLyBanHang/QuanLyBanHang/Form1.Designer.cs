namespace QuanLyBanHang
{
    partial class Form1
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
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.hệThốngToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.chiNhánhToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.sảnPhẩmToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.nhãnHiệuToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.danhMụcToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.panel = new System.Windows.Forms.Panel();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.menuStrip1.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.hệThốngToolStripMenuItem,
            this.chiNhánhToolStripMenuItem,
            this.sảnPhẩmToolStripMenuItem1,
            this.nhãnHiệuToolStripMenuItem,
            this.danhMụcToolStripMenuItem1});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Padding = new System.Windows.Forms.Padding(4, 2, 0, 2);
            this.menuStrip1.Size = new System.Drawing.Size(1790, 29);
            this.menuStrip1.TabIndex = 0;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // hệThốngToolStripMenuItem
            // 
            this.hệThốngToolStripMenuItem.Name = "hệThốngToolStripMenuItem";
            this.hệThốngToolStripMenuItem.Size = new System.Drawing.Size(89, 25);
            this.hệThốngToolStripMenuItem.Text = "Hệ Thống";
            // 
            // chiNhánhToolStripMenuItem
            // 
            this.chiNhánhToolStripMenuItem.Name = "chiNhánhToolStripMenuItem";
            this.chiNhánhToolStripMenuItem.Size = new System.Drawing.Size(96, 25);
            this.chiNhánhToolStripMenuItem.Text = "Chi Nhánh";
            this.chiNhánhToolStripMenuItem.Click += new System.EventHandler(this.chiNhánhToolStripMenuItem_Click);
            // 
            // sảnPhẩmToolStripMenuItem1
            // 
            this.sảnPhẩmToolStripMenuItem1.Name = "sảnPhẩmToolStripMenuItem1";
            this.sảnPhẩmToolStripMenuItem1.Size = new System.Drawing.Size(92, 25);
            this.sảnPhẩmToolStripMenuItem1.Text = "Sản Phẩm";
            this.sảnPhẩmToolStripMenuItem1.Click += new System.EventHandler(this.sảnPhẩmToolStripMenuItem1_Click);
            // 
            // nhãnHiệuToolStripMenuItem
            // 
            this.nhãnHiệuToolStripMenuItem.Name = "nhãnHiệuToolStripMenuItem";
            this.nhãnHiệuToolStripMenuItem.Size = new System.Drawing.Size(96, 25);
            this.nhãnHiệuToolStripMenuItem.Text = "Nhãn Hiệu";
            this.nhãnHiệuToolStripMenuItem.Click += new System.EventHandler(this.nhãnHiệuToolStripMenuItem_Click);
            // 
            // danhMụcToolStripMenuItem1
            // 
            this.danhMụcToolStripMenuItem1.Name = "danhMụcToolStripMenuItem1";
            this.danhMụcToolStripMenuItem1.Size = new System.Drawing.Size(93, 25);
            this.danhMụcToolStripMenuItem1.Text = "Danh Mục";
            this.danhMụcToolStripMenuItem1.Click += new System.EventHandler(this.danhMụcToolStripMenuItem1_Click);
            // 
            // panel
            // 
            this.panel.Location = new System.Drawing.Point(34, 53);
            this.panel.Name = "panel";
            this.panel.Size = new System.Drawing.Size(1737, 917);
            this.panel.TabIndex = 1;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1790, 978);
            this.Controls.Add(this.panel);
            this.Controls.Add(this.menuStrip1);
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem hệThốngToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem chiNhánhToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem sảnPhẩmToolStripMenuItem1;
        private System.Windows.Forms.Panel panel;
        private System.Windows.Forms.ToolStripMenuItem nhãnHiệuToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem danhMụcToolStripMenuItem1;
    }
}