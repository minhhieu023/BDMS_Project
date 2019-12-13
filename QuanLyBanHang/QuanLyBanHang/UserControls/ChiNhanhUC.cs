using QuanLyBanHang.UserControls;
using System;
using System.Drawing;
using System.Windows.Forms;

namespace QuanLyBanHang
{
    public partial class ChiNhanhUC : UserControl
    {
        private bool isInsert = false;
        
        QuanLyBanHangEntities context = new QuanLyBanHangEntities();
        private static ChiNhanhUC _instance;
        public static ChiNhanhUC Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new ChiNhanhUC();
                return _instance;
            }
        }
        public ChiNhanhUC()
        {
           
            InitializeComponent();
          

        }
        private void dgvChiNhanh_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int r = dgvChiNhanh.CurrentCell.RowIndex;
            txtMaCN.Text = dgvChiNhanh.Rows[r].Cells[0].Value.ToString();
            txtTenCN.Text = dgvChiNhanh.Rows[r].Cells[1].Value.ToString();
          
        }
        private void ChiNhanhUC_Load(object sender, System.EventArgs e)
        {
            if (Const.isNQL == false || Const.maNhanVien != "admin")
            {
                btnThem.Visible = false;
                btnSua.Visible = false;
                btnXoa.Visible = false;
                btnLuu.Visible = false;
            }
            var ChiNhanh = context.SelectChiNhanh();
            dgvChiNhanh.DataSource = ChiNhanh;
            DisabledProperties();
            btnLuu.Enabled = false;
            btnHuy.Enabled = false;
        }
        void DisabledProperties()
        {
            txtMaCN.Enabled = false;
            txtTenCN.Enabled = false;        
        }
        void EnabledProperties()
        {
            txtMaCN.Enabled = true;
            txtTenCN.Enabled = true;
            btnLuu.Enabled = true;
            btnHuy.Enabled = true;
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
            txtMaCN.Enabled = false;
        }
        private void btnXoa_Click(object sender, System.EventArgs e)
        {
            try
            {
                DialogResult dialogResult = MessageBox.Show("Bạn có chắc muốn xoá không?", "Cảnh báo", MessageBoxButtons.YesNo, MessageBoxIcon.Information);
                if (dialogResult == DialogResult.Yes)
                {
                    var NhanHieu = context.DeleteChiNhanh(txtMaCN.Text.Trim());
                    ChiNhanhUC_Load(sender, e);
                }
            }
            catch
            {
                MessageBox.Show("Không thể xoá ID này");
            }
        }
        private void btnLuu_Click(object sender, EventArgs e)
        {  
            if (isInsert)
            {
                try
                {
                    var ChiNhanh = context.InsertChiNhanh(txtMaCN.Text.Trim(), txtTenCN.Text);
                    MessageBox.Show("Inserted");
                }
                catch (Exception)
                {
                    MessageBox.Show("Something Wrong");
                }
                ChiNhanhUC_Load(sender, e);
            }
            else
            {
                try
                {             
                    var NhanHieu = context.UpdateChiNhanh(txtMaCN.Text.Trim(), txtTenCN.Text);
                    MessageBox.Show("Edited");
                }
                catch (Exception)
                {
                    MessageBox.Show("Something Wrong");
                }
                ChiNhanhUC_Load(sender, e);
            }
        }
        private void btnHuy_Click(object sender, EventArgs e)
        {
            btnThem.BackColor = Color.White;
            btnSua.BackColor = Color.White;
            btnThem.Enabled = true; btnXoa.Enabled = true;
            btnXoa.Enabled = true;
            ChiNhanhUC_Load(sender, e);
        }
        private void btnReload_Click(object sender, EventArgs e)
        {
            ChiNhanhUC_Load(sender, e);
        }
        private void txtTimKiem_KeyUp(object sender, KeyEventArgs e)
        {
            var findCN = context.TimChiNhanh(txtTimKiem.Text);
            dgvChiNhanh.DataSource = findCN;
            if (txtTimKiem.Text == "")
            {
                dgvChiNhanh.DataSource = context.SelectChiNhanh();
            }
        }
    }
}
