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
    public partial class HoaDonUC : UserControl
    {
        QuanLyBanHangEntities context = new QuanLyBanHangEntities();
        private static HoaDonUC _instance;
        public static HoaDonUC Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new HoaDonUC();
                return _instance;
            }
        }
        public HoaDonUC()
        {
            InitializeComponent();
            LoadData();
        }

        
        void LoadData()
        {
            dgvHoaDon.DataSource = context.View_HoaDon.ToList();
            dgvDetail.Rows.Clear();
            dgvDetail.Refresh();
            dgvDetail.Visible = false;
            DissableProperties();

        }
        void DissableProperties()
        {
            txtTenNV.Enabled = false;
            txtTenKhachHang.Enabled = false;
            txtMaHoaDon.Enabled = false;
            txtNgayBan.Enabled = false;
            txtTongTien.Enabled = false;
            txtSDT.Enabled = false;

        }

        private void dgvHoaDon_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int r = dgvHoaDon.CurrentCell.RowIndex;
            txtMaHoaDon.Text = dgvHoaDon.Rows[r].Cells[0].Value.ToString();
            txtTenNV.Text = dgvHoaDon.Rows[r].Cells[1].Value.ToString();
            txtTenKhachHang.Text = dgvHoaDon.Rows[r].Cells[3].Value.ToString();
            txtSDT.Text = dgvHoaDon.Rows[r].Cells[4].Value.ToString();
            txtNgayBan.Text = dgvHoaDon.Rows[r].Cells[5].Value.ToString();
            txtTongTien.Text = dgvHoaDon.Rows[r].Cells[6].Value.ToString();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            dgvDetail.Visible = true;
            dgvDetail.DataSource = context.View_tb_HoaDon(txtMaHoaDon.Text).ToList();
        }
        private void txtTimKiem_TextChanged(object sender, EventArgs e)
        {
            var finSDT = context.TimKiemSDT(txtTimKiem.Text);
             dgvHoaDon.DataSource = finSDT;
            if (txtTimKiem.Text == "")
                {
                    dgvHoaDon.DataSource = context.View_HoaDon.ToList();
                }
          
        }

        private void btnReload_Click(object sender, EventArgs e)
        {
            LoadData();
        }
    }
}
