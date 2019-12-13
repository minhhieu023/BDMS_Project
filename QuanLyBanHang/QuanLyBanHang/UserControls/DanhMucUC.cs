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
    public partial class DanhMucUC : UserControl
    {
        private bool isInsert = false;

        QuanLyBanHangEntities context = new QuanLyBanHangEntities();
        private static DanhMucUC _instance;
        public static DanhMucUC Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new DanhMucUC();
                return _instance;
            }
        }
        public DanhMucUC()
        {
            InitializeComponent();
            LoadData();
        }

        private void dgvDanhMuc_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int r = dgvDanhMuc.CurrentCell.RowIndex;
            txtMaDM.Text = dgvDanhMuc.Rows[r].Cells[0].Value.ToString();
            txtTenDM.Text = dgvDanhMuc.Rows[r].Cells[1].Value.ToString();
            
        }
        private void txtTimKiem_KeyUp(object sender, KeyEventArgs e)
        {
            var findDM = context.TimDanhMuc(txtTimKiem.Text);
            dgvDanhMuc.DataSource = findDM;
            if (txtTimKiem.Text == "")
            {
                dgvDanhMuc.DataSource = context.SelectDanhMuc();
            }
        }
        void LoadData()
        {
            if(Const.isNQL == false)
            {
                btnThem.Visible = false;
                btnSua.Visible = false;
                btnXoa.Visible = false;
                btnLuu.Visible = false;
            }
            var DanhMuc = context.SelectDanhMuc();
            dgvDanhMuc.DataSource = DanhMuc;
            DisabledProperties();
            btnLuu.Enabled = false;
            btnHuy.Enabled = false;
          //  dataGridView1.DataSource = context
            this.cbbChiNhanhID.DataSource = context.SelectChiNhanh();
            this.cbbChiNhanhID.DisplayMember = "TenChiNhanh";
            this.cbbChiNhanhID.ValueMember = "ChiNhanhID";
            this.cbbChiNhanhID.Refresh();
        }
        private void DanhMucUC_Load(object sender, EventArgs e)
        {
            LoadData();
        }
        void DisabledProperties()
        {
            txtMaDM.Enabled = false;
            txtTenDM.Enabled = false;
            cbbChiNhanhID.Enabled = false;
        }
        void EnabledProperties()
        {
            txtMaDM.Enabled = true;
            txtTenDM.Enabled = true;
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
            txtMaDM.Enabled = false;
        }
        private void btnXoa_Click(object sender, System.EventArgs e)
        {
            try
            {
                DialogResult dialogResult = MessageBox.Show("Bạn có chắc muốn xoá không?", "Cảnh báo", MessageBoxButtons.YesNo, MessageBoxIcon.Information);
                if (dialogResult == DialogResult.Yes)
                {
                    var NhanHieu = context.DeleteDanhMuc(txtMaDM.Text.Trim());
                    LoadData();
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
                    var DanhMuc = context.InsertDanhMuc(txtMaDM.Text.Trim(), txtTenDM.Text);
                    MessageBox.Show("Inserted");
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
                DanhMucUC_Load(sender, e);
            }
            else
            {
                try
                {
                    var NhanHieu = context.UpdateDanhMuc(txtMaDM.Text.Trim(), txtTenDM.Text);
                    MessageBox.Show("Edited");
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
                LoadData();
            }
        }
        private void btnHuy_Click(object sender, EventArgs e)
        {
            btnThem.BackColor = Color.White;
            btnSua.BackColor = Color.White;
            btnThem.Enabled = true; btnXoa.Enabled = true;
            btnXoa.Enabled = true;
            LoadData();
        }
        private void btnReload_Click(object sender, EventArgs e)
        {
            LoadData();
        }
    }
}
