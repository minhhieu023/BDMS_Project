using QuanLyBanHang.UserControls;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyBanHang
{
    public partial class FrmLogIn : Form
    {
        QuanLyBanHangEntities context = new QuanLyBanHangEntities();

        SeedData SeedData = new SeedData();
        public FrmLogIn()
        {
            InitializeComponent();
          //  SeedData.InsertDanhMUc();
            
        }
        private void btnLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-F3VTH4B\SQLEXPRESS;Initial Catalog=QuanLyBanHang;Integrated Security=True"))
            {
                //try
                //{
                    conn.Open();
                    string tk = txtMaNV.Text;
                    string mk = txtMatKhau.Text;
                    string sql = "select * from NhanVien where MaNV='" + tk + "' and MatKhau='" + mk + "'";
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    SqlDataReader dta = cmd.ExecuteReader();
                    if (dta.Read() == true)
                    {
                        var findNQL = context.NhanViens.Find(tk);
                        if (findNQL.ChucVu.Contains("QL"))
                        {
                            Const.isNQL = true;
                            MessageBox.Show("Login successfuly", $"Hi! Manager ");
                        }
                        else
                        {
                            MessageBox.Show("Login successfuly");
                        }
                        Const.isLogIn = true;
                        Const.maNhanVien = tk;
                        Const.tenNhanVien = context.NhanViens.Find(tk).TenNV;
                        this.Hide();
                        Form1 form = new Form1();
                        form.ShowDialog();
                        this.Close();
                    }
                    else
                    {
                        MessageBox.Show("Login failed");
                }
                //}
                //catch (Exception)
                //{
                //    MessageBox.Show("Something wrong");
                //}
            }
            }
        private void Login_Load(object sender, EventArgs e)
        {
            txtMatKhau.PasswordChar = '*';
        }
    
        private void btnShow_Click(object sender, EventArgs e)
        {
            if (txtMatKhau.PasswordChar == '*')
            {
                txtMatKhau.PasswordChar = '\0';
                btnShow.Text = "Ẩn";
            }
            else
            {
                txtMatKhau.PasswordChar = '*';
                btnShow.Text = "Hiện";
            }
        }

    
    }
}
