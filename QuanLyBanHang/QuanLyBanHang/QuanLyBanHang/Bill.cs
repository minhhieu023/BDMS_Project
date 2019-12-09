using QuanLyBanHang.UserControls;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyBanHang
{
    public partial class Bill : Form
    {
        QuanLyBanHangEntities context = new QuanLyBanHangEntities();
        
       
        public Bill()
        {
            InitializeComponent();
            LoadData();
           
        }
      
        void LoadData()
        {
            var time = context.HoaDons.Find(Const.HoaDonID);
            lbTime.Text = time.NgayBan.ToString();
            dataGridView1.DataSource = context.XemHoaDon(Const.HoaDonID);
            txtMaNV.Text = Const.maNhanVien;
            txtKH.Text = Const.TenKhachHang;
            lbtotal.Text = time.TongTien.ToString();
        }
     
    }
}
