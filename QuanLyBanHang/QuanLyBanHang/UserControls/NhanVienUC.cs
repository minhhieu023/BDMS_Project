using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using System.Windows.Media.Imaging;

namespace QuanLyBanHang.UserControls
{
    public partial class NhanVienUC : UserControl
    {
        private bool isInsert = false;
        
        QuanLyBanHangEntities context = new QuanLyBanHangEntities();
        private static NhanVienUC _instance;
        public static NhanVienUC Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new NhanVienUC();
                return _instance;
            }
        }

        public NhanVienUC()
        {
            InitializeComponent();
        }
     
        private void NhanVienUC_Load(object sender, EventArgs e)
        {

            LoadData();
        }
        void LoadData()
        {
            dgvNhanVien.DataSource = context.SelectNhanVien();
          
            if (Const.isNQL == false)
            {
                btnThem.Visible = false;
                btnXoa.Visible = false;
                btnShow.Visible = false;
                btnSua.Visible = false;
                btnLuu.Visible = false;
                btnHuy.Visible = false;
                for (int i = 0; i < dgvNhanVien.Columns.Count; i++)
                {
                    if (dgvNhanVien.Columns[i].Name.Contains("MatKhau"))
                    {

                        dgvNhanVien.Columns[i].Visible = false;

                    }

                }
            }
            btnLuu.Enabled = false;
            btnHuy.Enabled = false;
            txtMatKhau.PasswordChar = '*';
            this.cbbMaNQL.DataSource = context.NhanViens.ToList();
            this.cbbMaNQL.DisplayMember = "MaNV";
            this.cbbMaNQL.ValueMember = "MaNV";
            this.cbbMaNQL.Refresh();

            DisabledProperties();
            this.cbbChiNhanhID.DataSource = context.ChiNhanhs.ToList();
            this.cbbChiNhanhID.DisplayMember = "ChiNhanhID";
            this.cbbChiNhanhID.ValueMember = "ChiNhanhID";
            this.cbbChiNhanhID.Refresh();
        }
        void DisabledProperties()
        {
            txtMaNV.Enabled = false;
            txtTenNV.Enabled = false;
            txtMatKhau.Enabled = false;
            txtLuong.Enabled = false;
            txtChucVu.Enabled = false;
            cbbMaNQL.Enabled = false;
            cbbChiNhanhID.Enabled = false;
        }
        void EnabledProperties()
        {
            txtMaNV.Enabled = true;
            txtTenNV.Enabled = true;
            txtMatKhau.Enabled = true;
            txtLuong.Enabled = true;
            txtChucVu.Enabled = true;
            cbbMaNQL.Enabled =true;
            cbbChiNhanhID.Enabled = true;
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
            txtMaNV.Enabled = false;
        }
        private void btnXoa_Click(object sender, System.EventArgs e)
        {
            try
            {
                DialogResult dialogResult = MessageBox.Show("Bạn có chắc muốn xoá không?", "Cảnh báo", MessageBoxButtons.YesNo, MessageBoxIcon.Information);
                if (dialogResult == DialogResult.Yes)
                {
                    var NhanHieu = context.DeleteNhanVien(txtMaNV.Text.Trim());
                    NhanVienUC_Load(sender, e);
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
                    var NhanVien=0;
                    if (cbbMaNQL.Text == " ")
                    {
                        NhanVien = context.InsertNhanVien(txtMaNV.Text.Trim(), txtTenNV.Text, txtMatKhau.Text, txtChucVu.Text,
                         null, cbbChiNhanhID.Text.Trim(), txtLuong.Text);
                    }
                    else
                    {
                        NhanVien = context.InsertNhanVien(txtMaNV.Text.Trim(), txtTenNV.Text, txtMatKhau.Text, txtChucVu.Text,
                                          cbbMaNQL.Text.Trim(), cbbChiNhanhID.Text.Trim(), txtLuong.Text);
                    }
                    MessageBox.Show("Inserted");
                }
                catch (Exception)
                {
                    MessageBox.Show("Something Wrong");
                }
                NhanVienUC_Load(sender, e);
            }
            else
            {
                try
                {
                    var NhanVien = 0;
                    if (cbbMaNQL.Text == "ADMIN")
                    {
                        NhanVien = context.UpdateNhanVien(txtMaNV.Text.Trim(), txtTenNV.Text, txtMatKhau.Text, txtChucVu.Text,
                         null, cbbChiNhanhID.Text.Trim(), txtLuong.Text);
                    }
                    else
                    {
                        NhanVien = context.UpdateNhanVien(txtMaNV.Text.Trim(), txtTenNV.Text, txtMatKhau.Text, txtChucVu.Text,
                                          cbbMaNQL.Text.Trim(), cbbChiNhanhID.Text.Trim(), txtLuong.Text);
                        MessageBox.Show("Edited");
                    }
                }
                catch (Exception)
                {
                    MessageBox.Show("Something Wrong");
                }
                NhanVienUC_Load(sender, e);
            }
        }
        private void btnHuy_Click(object sender, EventArgs e)
        {
            btnThem.BackColor = Color.White;
            btnSua.BackColor = Color.White;
            btnThem.Enabled = true; btnXoa.Enabled = true;
            btnXoa.Enabled = true;
            NhanVienUC_Load(sender, e);
        }
        private void btnReload_Click(object sender, EventArgs e)
        {
            NhanVienUC_Load(sender, e);
        }
        private void dgvNhanVien_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
             
                int r = dgvNhanVien.CurrentCell.RowIndex;
                txtMaNV.Text = dgvNhanVien.Rows[r].Cells[0].Value.ToString();
                txtTenNV.Text = dgvNhanVien.Rows[r].Cells[1].Value.ToString();
                txtMatKhau.Text = dgvNhanVien.Rows[r].Cells[2].Value.ToString();
                txtChucVu.Text = dgvNhanVien.Rows[r].Cells[3].Value.ToString();
                if (dgvNhanVien.Rows[r].Cells[4].Value == null)
                    cbbMaNQL.Text = "ADMIN";
                else
                    cbbMaNQL.Text = dgvNhanVien.Rows[r].Cells[4].Value.ToString();

                if (dgvNhanVien.Rows[r].Cells[5].Value.ToString() == "")
                    cbbChiNhanhID.Text = dgvNhanVien.Rows[r].Cells[5].Value.ToString();
                else
                {
                    cbbChiNhanhID.Text = "Admin";
                }
                txtLuong.Text = dgvNhanVien.Rows[r].Cells[6].Value.ToString();
                txtLuong.Text = dgvNhanVien.Rows[r].Cells[6].Value.ToString();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
}
        private void txtTimKiem_KeyUp(object sender, KeyEventArgs e)
        {
            var findDM = context.NhanViens.Find(txtMaNV.Text);
            dgvNhanVien.DataSource = findDM;
            if (txtTimKiem.Text == "")
            {
                dgvNhanVien.DataSource = context.SelectDanhMuc();
            }
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
