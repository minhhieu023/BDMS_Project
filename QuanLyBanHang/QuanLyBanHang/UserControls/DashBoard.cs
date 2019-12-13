using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;

namespace QuanLyBanHang.UserControls
{
    public partial class DashBoard : UserControl
    {
        QuanLyBanHangEntities context = new QuanLyBanHangEntities();
        public static DataTable dataTable = new DataTable();
        byte[] ap;
        // private static bool isInsert = false;

        // QuanLyBanHangEntities context = new QuanLyBanHangEntities();
        int tamtinh=0;
        private static Random random = new Random();
        private static DashBoard _instance;
       // C dataTime = new DataTime();
        public static DashBoard Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new DashBoard();
                return _instance;
            }
        }
    
        public DashBoard()
        {
            InitializeComponent();
            LoadData();
        }
        void LoadData()
        {
            dgvSanPham.Refresh();
            dgvSanPham.DataSource = context.DASHBOARDs.ToList();
            for (int i = 0; i < dgvSanPham.Columns.Count; i++)
            {
                if (dgvSanPham.Columns[i] is DataGridViewImageColumn)
                {
                    dgvSanPham.RowTemplate.Height = 120;
                    ((DataGridViewImageColumn)dgvSanPham.Columns[i]).ImageLayout = DataGridViewImageCellLayout.Stretch;

                }
                if (dgvSanPham.Columns[i] is DataGridViewButtonColumn)
                {

                    dgvSanPham.Columns[i].DisplayIndex = 7;

                }
            }
            button3.Enabled = false;
            tamtinh = 0;
            txtMaNV.Text = Const.maNhanVien;
            lbTenNhanVien.Text = Const.tenNhanVien;
            lbCart.Text = "0";
            lbTongTien.ResetText();
            context.DeleteTempSP();
            dgvLog.DataSource = context.SelectTemptSP();
            DisabledProperties();

         
        }
        void DisabledProperties()
        {
            txtMaSP.Enabled = false;
            cbbDanhMuc.Enabled = false;
            cbbNhanHieu.Enabled = false;
            txtGiaBan.Enabled = false;
            //txtGiaNhap.Enabled = false;
            //  txtMaSP.Enabled = true;
            txtSoLuong.Enabled = false;
            txtTenSP.Enabled = false;
        
        }
        private void dgvSanPham_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int r = dgvSanPham.CurrentCell.RowIndex;

            txtMaSP.Text = dgvSanPham.Rows[r].Cells[1].Value.ToString();
           // txtChiTiet.Text = dgvSanPham.Rows[r].Cells[2].Value.ToString();
            txtTenSP.Text = dgvSanPham.Rows[r].Cells[2].Value.ToString();
            txtSoLuong.Text = dgvSanPham.Rows[r].Cells[3].Value.ToString();
          //  txtGiaNhap.Text = dgvSanPham.Rows[r].Cells[5].Value.ToString();
            txtGiaBan.Text = dgvSanPham.Rows[r].Cells[4].Value.ToString();
            cbbDanhMuc.Text = dgvSanPham.Rows[r].Cells[5].Value.ToString();
            //txtNCC.Text = dgvSanPham.Rows[r].Cells[7].Value.ToString();
          //  var tenNhanHieu = context.NhanHieux.Find(dgvSanPham.Rows[r].Cells[8].Value.ToString());
            cbbNhanHieu.Text = dgvSanPham.Rows[r].Cells[6].Value.ToString();

            //  var tendanhMuc = context.DanhMucs.Find(dgvSanPham.Rows[r].Cells[9].Value.ToString());
            if (dgvSanPham.Rows[r].Cells[7].Value != null)
            {
                ap = (byte[])(dgvSanPham.Rows[r].Cells[7].Value);
                MemoryStream ms = new MemoryStream(ap);
                pictureBox1.Image = Image.FromStream(ms);
            }
           
            var senderGrid = (DataGridView)sender;

            if (senderGrid.Columns[e.ColumnIndex] is DataGridViewButtonColumn &&
                e.RowIndex >= 0 && Int32.Parse(dgvSanPham.Rows[r].Cells[3].Value.ToString()) > 0)
            {
                button3.Enabled = true;
                try
                {
                    var Insert = context.InsertTempSP(Int32.Parse(txtMaSP.Text), 1, txtTenSP.Text, Int32.Parse(txtGiaBan.Text));

                    dgvLog.DataSource = context.SelectTemptSP();
                }
                catch
                {
                    var Update = context.updateUTempSP(Int32.Parse(txtMaSP.Text));
                    dgvLog.DataSource = context.SelectTemptSP();
                }
               // if(lbCart.Text != "")
                lbCart.Text = (Int32.Parse(lbCart.Text) + 1).ToString();
                tamtinh += Int32.Parse(txtGiaBan.Text);
                lbTongTien.Text = tamtinh.ToString();
            }
        }
        public static string RandomString(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            return new string(Enumerable.Repeat(chars, length)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }
        private void button3_Click(object sender, EventArgs e)
        {
            
            //try
            //{
                 Const.HoaDonID = RandomString(7);
                context.InsertHoaDon(Const.KhachHangID, Const.HoaDonID, txtMaNV.Text, DateTime.Now, Int32.Parse(lbTongTien.Text));
                for (int i = 0; i < dgvLog.Rows.Count; i++)
                {
                    string ThanhTien = context.Database.SqlQuery<int>($"Select dbo.Calculate_TinhTien({Int32.Parse(dgvLog[2, i].Value.ToString())},{Int32.Parse(dgvLog[3, i].Value.ToString())},0)").Single().ToString();
                   
                    context.InsertChiTietHoaDon(Const.HoaDonID, Int32.Parse(dgvLog[0, i].Value.ToString()), Int32.Parse(dgvLog[2, i].Value.ToString()), Int32.Parse(dgvLog[3, i].Value.ToString()), 0, Int32.Parse(ThanhTien));

                }
                Bill bill = new Bill();
                bill.ShowDialog();
            //}
            //catch(Exception ex)
            //{
            //    MessageBox.Show(ex.Message);
            //}
        }

        private void button1_Click(object sender, EventArgs e)
        {
            DashBoard_Load(sender, e);

        }

        private void button4_Click(object sender, EventArgs e)
        {
            TimKhachHang timKhachHang = new TimKhachHang();
            timKhachHang.ShowDialog();
        }

     

        private void button2_Click(object sender, EventArgs e)
        {
           
               
          
        }

        private void button5_Click(object sender, EventArgs e)
        {
            txtTenKhachHang.Text = Const.TenKhachHang;
        }

        private void txtTimKiem_TextChanged(object sender, EventArgs e)
        {
            var find = from m in context.DASHBOARDs
                       where m.Tên_Sản_Phẩm.Contains(txtTimKiem.Text)
                       select m;
            dgvSanPham.DataSource = find.ToList();
            if(txtTimKiem.Text == "")
            {
                dgvSanPham.DataSource = context.DASHBOARDs.ToList();
            }
        }

        private void DashBoard_Load(object sender, EventArgs e)
        {
            LoadData();
        }
    }
}
