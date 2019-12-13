using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyBanHang.UserControls
{
    public partial class KhachHangUC : UserControl
    {
        private bool isInsert = false;
        static Random random = new Random();
        QuanLyBanHangEntities context = new QuanLyBanHangEntities();
        private static KhachHangUC _instance;
        public static KhachHangUC Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new KhachHangUC();
                return _instance;
            }
        }
        public KhachHangUC()
        {

            InitializeComponent();
        }
        void LoadData()
        {
            dgvKhachHang.DataSource = context.SelectKhachHang();
            btnLuu.Enabled = false;
            btnHuy.Enabled = false;
            DisabledProperties();
        }
        private void KhachHangUC_Load(object sender, EventArgs e)
        {
            LoadData();
        }
        public static string RandomString(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            return new string(Enumerable.Repeat(chars, length)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }
        void DisabledProperties()
        {
            txtMaKH.Enabled = false;
            txtHoKH.Enabled = false;
            txtTenKH.Enabled = false;
            txtSoDT.Enabled = false;
        }
        void EnabledProperties()
        {
           // txtMaKH.Enabled = true;
            txtHoKH.Enabled = true;
            txtSoDT.Enabled = true;
            txtTenKH.Enabled = true;
            btnLuu.Enabled = true;
            btnHuy.Enabled = true;
        }
        private void lbtimkiem_Click(object sender, EventArgs e)
        {

        }
        private void btnThem_Click(object sender, System.EventArgs e)
        {
            isInsert = true;
            EnabledProperties();
        }
        private void btnSua_Click(object sender, System.EventArgs e)
        {
            isInsert = false;
            EnabledProperties();
            txtMaKH.Enabled = false;
        }
        private void btnLuu_Click(object sender, EventArgs e)
        {
            if (isInsert)
            {
                try
                {
                    var KhachHang = context.InsertKhachHang(RandomString(5), txtHoKH.Text, txtTenKH.Text, txtSoDT.Text);
                    MessageBox.Show("Inserted");
                }
                catch (Exception)
                {
                    MessageBox.Show("Something Wrong");
                }
                LoadData();
            }
            else
            {
                try
                {

                    var KhachHang = context.UpdateKhachHang(txtMaKH.Text.Trim(), txtHoKH.Text, txtTenKH.Text, txtSoDT.Text);
                    MessageBox.Show("Edited");
                }
                catch (Exception)
                {
                    MessageBox.Show("Something Wrong");
                }
                LoadData();
            }
        }
        private void dgvKhachHang_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int r = dgvKhachHang.CurrentCell.RowIndex;
            txtMaKH.Text = dgvKhachHang.Rows[r].Cells[0].Value.ToString();
            txtHoKH.Text = dgvKhachHang.Rows[r].Cells[1].Value.ToString();
            txtTenKH.Text = dgvKhachHang.Rows[r].Cells[2].Value.ToString();
            txtSoDT.Text = dgvKhachHang.Rows[r].Cells[3].Value.ToString();
        }
        private void btnHuy_Click(object sender, EventArgs e)
        {
            btnThem.BackColor = Color.White;
            btnSua.BackColor = Color.White;
            btnThem.Enabled = true;
            LoadData();
        }
        private void btnReload_Click(object sender, EventArgs e)
        {
            LoadData();
        }
        private void txtTimKiem_KeyUp(object sender, KeyEventArgs e)
        {
            var findKH = context.KhachHangs.Find(txtMaKH.Text);
            dgvKhachHang.DataSource = findKH;
            if (txtTimKiem.Text == "")
            {
                dgvKhachHang.DataSource = context.SelectKhachHang();
            }
        }
    }
}
