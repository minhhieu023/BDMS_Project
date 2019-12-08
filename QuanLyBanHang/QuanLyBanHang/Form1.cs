using QuanLyBanHang.Controllers;
using QuanLyBanHang.UserControls;
using System.Windows.Forms;

namespace QuanLyBanHang
{
    public partial class Form1 : Form
    {
      
        public Form1()
        {
            InitializeComponent();
            LoadForm();
          //  FormBorderStyle = FormBorderStyle.None;
            WindowState = FormWindowState.Maximized;
        }
        public void LoadForm()
        {
            if (!panel.Controls.Contains(SanPhamUC.Instance))
            {
                panel.Controls.Add(SanPhamUC.Instance);
                SanPhamUC.Instance.Dock = DockStyle.Fill;
                SanPhamUC.Instance.BringToFront();
            }
            else
                SanPhamUC.Instance.BringToFront();
        }

        private void nhãnHiệuToolStripMenuItem_Click(object sender, System.EventArgs e)
        {
            if (!panel.Controls.Contains(NhanHieuUC.Instance))
            {
                panel.Controls.Add(NhanHieuUC.Instance);
                NhanHieuUC.Instance.Dock = DockStyle.Fill;
                NhanHieuUC.Instance.BringToFront();
            }
            else
                NhanHieuUC.Instance.BringToFront();
        }

        private void sảnPhẩmToolStripMenuItem1_Click(object sender, System.EventArgs e)
        {
            if (!panel.Controls.Contains(SanPhamUC.Instance))
            {
                panel.Controls.Add(SanPhamUC.Instance);
                SanPhamUC.Instance.Dock = DockStyle.Fill;
                SanPhamUC.Instance.BringToFront();
            }
            else
                SanPhamUC.Instance.BringToFront();
        }

        private void Form1_Load(object sender, System.EventArgs e)
        {

        }

        private void danhMụcToolStripMenuItem1_Click(object sender, System.EventArgs e)
        {
            if (!panel.Controls.Contains(DanhMucUC.Instance))
            {
                panel.Controls.Add(DanhMucUC.Instance);
               DanhMucUC.Instance.Dock = DockStyle.Fill;
               DanhMucUC.Instance.BringToFront();
            }
            else
               DanhMucUC.Instance.BringToFront();
        }

        private void chiNhánhToolStripMenuItem_Click(object sender, System.EventArgs e)
        {
            if (!panel.Controls.Contains(ChiNhanhUC.Instance))
            {
                panel.Controls.Add(ChiNhanhUC.Instance);
              ChiNhanhUC.Instance.Dock = DockStyle.Fill;
                ChiNhanhUC.Instance.BringToFront();
            }
            else
                ChiNhanhUC.Instance.BringToFront();
        }
    }

}
