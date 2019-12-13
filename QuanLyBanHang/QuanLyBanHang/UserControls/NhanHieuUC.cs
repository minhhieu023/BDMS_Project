using QuanLyBanHang.UserControls;
using System;
using System.Drawing;
using System.Windows.Forms;

namespace QuanLyBanHang
{
    public partial class NhanHieuUC : UserControl
    {
        private bool isInsert = false;
        
        QuanLyBanHangEntities context = new QuanLyBanHangEntities();
        private static NhanHieuUC _instance;
        public static NhanHieuUC Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new NhanHieuUC();
                return _instance;
            }
        }
        public NhanHieuUC()
        {
           
            InitializeComponent();

        }
        private void dgvNhanHieu_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int r = dgvNhanHieu.CurrentCell.RowIndex;

            txtMaNH.Text = dgvNhanHieu.Rows[r].Cells[0].Value.ToString();
            txtTenNH.Text = dgvNhanHieu.Rows[r].Cells[1].Value.ToString();
          
        }       
        private void NhanHieuUC_Load(object sender, System.EventArgs e)
        {
            if (Const.isNQL == false)
            {
                btnThem.Visible = false;
                btnSua.Visible = false;
               // btnXoa.Visible = false;
                btnLuu.Visible = false;
            }
            var NhanHieu = context.SelectNhanHieu(null);
            dgvNhanHieu.DataSource = NhanHieu;
            DisabledProperties();
            btnLuu.Enabled = false;
            btnHuy.Enabled = false;
        }
        void DisabledProperties()
        {
            txtMaNH.Enabled = false;
            txtTenNH.Enabled = false;        
        }
        void EnabledProperties()
        {
            txtMaNH.Enabled = true;
            txtTenNH.Enabled = true;
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
            txtMaNH.Enabled = false;
        }
        private void btnXoa_Click(object sender, System.EventArgs e)
        {
            try
            {
                DialogResult dialogResult = MessageBox.Show("Bạn có chắc muốn xoá không?", "Cảnh báo", MessageBoxButtons.YesNo, MessageBoxIcon.Information);
                if (dialogResult == DialogResult.Yes)
                {
                    var NhanHieu = context.DeleteNhanHieu(txtMaNH.Text.Trim());
                    NhanHieuUC_Load(sender, e);
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
                    var NhanHieu = context.InsertNhanHieu(txtMaNH.Text.Trim(), txtTenNH.Text);
                    MessageBox.Show("Inserted");
                }
                catch (Exception)
                {
                    MessageBox.Show("Something Wrong");
                }
                NhanHieuUC_Load(sender, e);
            }
            else
            {
                try
                {             
                    var NhanHieu = context.UpdateNhanHieu(txtMaNH.Text.Trim(), txtTenNH.Text);
                    MessageBox.Show("Edited");
                }
                catch (Exception)
                {
                    MessageBox.Show("Something Wrong");
                }
                NhanHieuUC_Load(sender, e);
            }
        }
        private void btnHuy_Click(object sender, EventArgs e)
        {
            btnThem.BackColor = Color.White;
            btnSua.BackColor = Color.White;
            btnThem.Enabled = true; btnXoa.Enabled = true;
            btnXoa.Enabled = true;
            NhanHieuUC_Load(sender, e);
        }
        private void btnReload_Click(object sender, EventArgs e)
        {
            NhanHieuUC_Load(sender, e);
        }
        private void txtTimKiem_KeyUp(object sender, KeyEventArgs e)
        {
            var findCN = context.TimNhanHieu(txtTimKiem.Text);
            dgvNhanHieu.DataSource = findCN;
            if (txtTimKiem.Text == "")
            {
                dgvNhanHieu.DataSource = context.SelectNhanHieu(null);
            }
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void dgvNhanHieu_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
