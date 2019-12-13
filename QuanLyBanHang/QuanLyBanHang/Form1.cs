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
            //if (Const.tenNhanVien != "Super Admin" && Const.isNQL == false)
            //{
            //    nhãnHiệuToolStripMenuItem.Visible = false;
            //    sảnPhẩmToolStripMenuItem1.Visible = false;
            //    danhMụcToolStripMenuItem1.Visible = false;
            //    nhânViênToolStripMenuItem.Visible = false;
            //    chiNhánhToolStripMenuItem.Visible = false;
            //}
            //else if (Const.isNQL == true && Const.tenNhanVien != "Super Admin")
            //{
            //    chiNhánhToolStripMenuItem.Visible = false;
            //    nhãnHiệuToolStripMenuItem.Visible = false;
            //    sảnPhẩmToolStripMenuItem1.Visible = false;
            //    danhMụcToolStripMenuItem1.Visible = false;
            //    nhânViênToolStripMenuItem.Visible = false;
            //}
            //else if (Const.isNQL == false && Const.tenNhanVien != "Super Admin")
            //{
            //    nhãnHiệuToolStripMenuItem.Visible = false;
            //    sảnPhẩmToolStripMenuItem1.Visible = false;
            //    danhMụcToolStripMenuItem1.Visible = false;
            //    nhânViênToolStripMenuItem.Visible = false;
            //    chiNhánhToolStripMenuItem.Visible = false;
            //}

            WindowState = FormWindowState.Maximized;
            menuStrip1.Visible = true;
            if (!panel.Controls.Contains(DashBoard.Instance))
            {
                panel.Controls.Add(DashBoard.Instance);
                DashBoard.Instance.Dock = DockStyle.Fill;
                DashBoard.Instance.BringToFront();
            }
            else
                DashBoard.Instance.BringToFront();
            //label1.Text = "DASHBOARD";
        }
        public void LoadForm()
        {
            if (Const.isLogIn == true)
                menuStrip1.Visible = true;
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
             //    label1.Text = "NHÃN HIỆU";
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
           // label1.Text = "SẢN PHẨM";
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
          //  label1.Text = "DANH MỤC";
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
           // label1.Text = "CHI NHANH";
        }

        private void button1_Click(object sender, System.EventArgs e)
        {
            FrmLogIn frmLogIn = new FrmLogIn();
            frmLogIn.ShowDialog();
                
        }

        private void toolStripMenuItem1_Click(object sender, System.EventArgs e)
        {
            if (!panel.Controls.Contains(DashBoard.Instance))
            {
                panel.Controls.Add(DashBoard.Instance);
                DashBoard.Instance.Dock = DockStyle.Fill;
                DashBoard.Instance.BringToFront();
            }
            else
                DashBoard.Instance.BringToFront();
           // label1.Text = "DASHBOARD";
        }

        private void nhânViênToolStripMenuItem_Click(object sender, System.EventArgs e)
        {
            if (!panel.Controls.Contains(NhanVienUC.Instance))
            {
                panel.Controls.Add(NhanVienUC.Instance);
                NhanVienUC.Instance.Dock = DockStyle.Fill;
                NhanVienUC.Instance.BringToFront();
            }
            else
                NhanVienUC.Instance.BringToFront();
        }

        private void hóaĐơnToolStripMenuItem_Click(object sender, System.EventArgs e)
        {
            if (!panel.Controls.Contains(HoaDonUC.Instance))
            {
                panel.Controls.Add(HoaDonUC.Instance);
                HoaDonUC.Instance.Dock = DockStyle.Fill;
                HoaDonUC.Instance.BringToFront();
            }
            else
                HoaDonUC.Instance.BringToFront();
        }

        private void kháchHàngToolStripMenuItem_Click(object sender, System.EventArgs e)
        {
            if (!panel.Controls.Contains(KhachHangUC.Instance))
            {
                panel.Controls.Add(KhachHangUC.Instance);
                KhachHangUC.Instance.Dock = DockStyle.Fill;
                KhachHangUC.Instance.BringToFront();
            }
            else
                KhachHangUC.Instance.BringToFront();
        }

        private void button2_Click(object sender, System.EventArgs e)
        {
            if (!panel.Controls.Contains(KhachHangUC.Instance))
            {
                panel.Controls.Add(KhachHangUC.Instance);
                KhachHangUC.Instance.Dock = DockStyle.Fill;
                KhachHangUC.Instance.BringToFront();
            }
            else
                KhachHangUC.Instance.BringToFront();
        }

        private void switchAccountToolStripMenuItem_Click(object sender, System.EventArgs e)
        {
            FrmLogIn frm = new FrmLogIn();
            frm.ShowDialog();
        }
    }

}
