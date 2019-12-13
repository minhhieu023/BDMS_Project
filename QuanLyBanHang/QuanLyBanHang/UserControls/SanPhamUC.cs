using QuanLyBanHang.UserControls;
using System;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Windows.Forms;

namespace QuanLyBanHang.Controllers
{
    public partial class SanPhamUC : UserControl
    {
        public static DataTable dataTable = new DataTable();
        byte[] ap;
        private static bool isInsert = false;
        private string MaDM= "";
        private string MaNH= "";
        QuanLyBanHangEntities context = new QuanLyBanHangEntities();
        private static Random random = new Random();
        private static SanPhamUC _instance;
        public static SanPhamUC Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new SanPhamUC();
                return _instance;
            }
        }

     
        public SanPhamUC()
        {
            InitializeComponent();  
            txtMaSP.Enabled = false;
        }
        private void SanPhamUC_Load(object sender, EventArgs e)
        {

            LoadData();

        }
        void LoadData()
        {
            if (Const.isNQL == false )
            {
                //btnThem.Visible = false;
                //btnSua.Visible = false;
                  btnXoa.Visible = false;
                //btnLuu.Visible = false;
            }

            dgvSanPham.DataSource = context.SelectSanPham();
            for (int i = 0; i < dgvSanPham.Columns.Count; i++)
            {
                if (dgvSanPham.Columns[i] is DataGridViewImageColumn )
                {
                    dgvSanPham.RowTemplate.Height = 120;
                    ((DataGridViewImageColumn)dgvSanPham.Columns[i]).ImageLayout = DataGridViewImageCellLayout.Stretch;
                 
                }
             
            }

            context.DeleteTempSP();
            //dgvLog.DataSource = context.SelectTemptSP();

            btnLuu.Enabled = false;
            btnHuy.Enabled = false;
            btnThem.Enabled = true;
            btnXoa.Enabled = true;
            btnSua.Enabled = true;
            DisabledProperties();

            this.cbbNhanHieu.DataSource = context.NhanHieux.ToList();
            this.cbbNhanHieu.DisplayMember = "TenNhanHieu";
            this.cbbNhanHieu.ValueMember = "TenNhanHieu";
            this.cbbNhanHieu.Refresh();

            this.cbbDanhMuc.DataSource = context.DanhMucs.ToList();
            this.cbbDanhMuc.DisplayMember = "TenDanhMuc";
            this.cbbDanhMuc.ValueMember = "TenDanhMuc";
            this.cbbDanhMuc.Refresh();
        }
        void DisabledProperties()
        {
            txtChiTiet.Enabled = false;
            cbbDanhMuc.Enabled = false;
            txtGiaBan.Enabled = false;
            txtGiaNhap.Enabled = false;
            //  txtMaSP.Enabled = true;
            txtNCC.Enabled = false;
            cbbNhanHieu.Enabled = false;
            txtSoLuong.Enabled = false;
            txtTenSP.Enabled = false;
            btnThayDoi.Enabled = false;
        }
        void EnabledProperties()
        {
            txtChiTiet.Enabled = true;
            cbbDanhMuc.Enabled = true;
            txtGiaBan.Enabled = true;
            txtGiaNhap.Enabled = true;
          //  txtMaSP.Enabled = true;
            txtNCC.Enabled = true;
            cbbNhanHieu.Enabled = true;
            txtSoLuong.Enabled = true;
            txtTenSP.Enabled = true;
            btnThayDoi.Enabled = true;
            
        }
        private void btnBrowse_Click(object sender, EventArgs e)
        {
            OpenFileDialog open = new OpenFileDialog();
            open.Filter = "select image(*.jpg;*.png;*.gif)|*.jpg;*.png;*.gif";
            if (open.ShowDialog() == DialogResult.OK)
            {
                pictureBox1.Image = Image.FromFile(open.FileName);
            }

        }
        private void dgv_PHIM_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int r = dgvSanPham.CurrentCell.RowIndex;

            txtMaSP.Text = dgvSanPham.Rows[r].Cells[0].Value.ToString();
            txtChiTiet.Text = dgvSanPham.Rows[r].Cells[1].Value.ToString();
            txtTenSP.Text = dgvSanPham.Rows[r].Cells[2].Value.ToString();
            txtSoLuong.Text = dgvSanPham.Rows[r].Cells[3].Value.ToString();
            txtGiaNhap.Text = dgvSanPham.Rows[r].Cells[4].Value.ToString();
            txtGiaBan.Text = dgvSanPham.Rows[r].Cells[5].Value.ToString();
            txtNCC.Text = dgvSanPham.Rows[r].Cells[6].Value.ToString();
            var tenNhanHieu = context.NhanHieux.Find(dgvSanPham.Rows[r].Cells[7].Value.ToString());
            cbbNhanHieu.Text = tenNhanHieu.TenNhanHieu;
           
            var tendanhMuc = context.DanhMucs.Find(dgvSanPham.Rows[r].Cells[8].Value.ToString());
            if (dgvSanPham.Rows[r].Cells[9].Value != null)
            {
                ap = (byte[])(dgvSanPham.Rows[r].Cells[9].Value);
                MemoryStream ms = new MemoryStream(ap);
                pictureBox1.Image = Image.FromStream(ms);
            }
            if (tendanhMuc.TenDanhMuc == null)
            {
                cbbDanhMuc.Text = tendanhMuc.TenDanhMuc.ToString();
            }

        
        }
        public static string RandomString(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            return new string(Enumerable.Repeat(chars, length)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            EnabledProperties();
            btnThem.BackColor = Color.White;
            btnSua.BackColor = Color.Azure;
            isInsert = false;
            btnThem.Enabled = false;
            btnXoa.Enabled = false;
            btnLuu.Enabled = true;
            btnHuy.Enabled = true;
            btnThem.Visible = false;
            btnXoa.Visible = false;
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            DialogResult dialogResult= MessageBox.Show("Bạn có chắc muốn xoá không?", "Cảnh báo", MessageBoxButtons.YesNo, MessageBoxIcon.Information);
            if (dialogResult == DialogResult.Yes)
            {
                try
                {
                    var SanPham = context.DeleteSanPham(Int32.Parse(txtMaSP.Text.Trim()));
                }
                catch (Exception)
                {
                    MessageBox.Show("Deleted");
                }
                
            }
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            txtChiTiet.ResetText();
            cbbNhanHieu.ResetText();
            txtGiaBan.ResetText();
            txtGiaNhap.ResetText();
            txtMaSP.Text = "Tự động thêm";
            txtNCC.ResetText();
            cbbDanhMuc.ResetText();
            txtSoLuong.ResetText();
            txtTenSP.ResetText();
            EnabledProperties();
            btnSua.Visible = false;
            btnXoa.Visible = false;
            btnThem.BackColor = Color.Azure;
            btnSua.BackColor = Color.White;
            isInsert = true;
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
            btnLuu.Enabled = true;
            btnHuy.Enabled = true;
        }
        private void txtTimKiem_KeyUp(object sender, KeyEventArgs e)
        {
            var findSP = context.TimSP(txtTimKiem.Text);
            dgvSanPham.DataSource = findSP;
            if (txtTimKiem.Text == "")
            {
                dgvSanPham.DataSource = context.SelectSanPham();
            }
        }
        private void btnLuu_Click(object sender, EventArgs e)
        {
            btnThem.Visible = true;
            btnSua.Visible = true;
            btnXoa.Visible = true;
            int r = dgvSanPham.CurrentCell.RowIndex;
            if ( isInsert)
            {
                try
                {
                    MemoryStream pic = new MemoryStream();
                    pictureBox1.Image.Save(pic, pictureBox1.Image.RawFormat);
                    var findRow = context.SanPhams.Max(s => s.SanPhamID);
                    var SanPham = context.InsertSP((Int32.Parse(findRow.ToString()) + 1), txtChiTiet.Text, txtTenSP.Text.Trim(), Int32.Parse(txtSoLuong.Text), Int32.Parse(txtGiaNhap.Text), Int32.Parse(txtGiaBan.Text),
                     txtNCC.Text, MaNH, MaDM, pic.ToArray());
                        MessageBox.Show("Inserted");
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
                LoadData();
            }
            else
            {
                try
                {
                    try
                    {
                        MemoryStream pic = new MemoryStream();
                        pictureBox1.Image.Save(pic, pictureBox1.Image.RawFormat);
                        if (MaDM == "" && MaNH == "")
                        {
                            var SanPham = context.UpdateSP((Int32.Parse(txtMaSP.Text.ToString())), txtChiTiet.Text, txtTenSP.Text.Trim(), Int32.Parse(txtSoLuong.Text), Int32.Parse(txtGiaNhap.Text), Int32.Parse(txtGiaBan.Text),
                                 txtNCC.Text, dgvSanPham.Rows[r].Cells[7].Value.ToString(), dgvSanPham.Rows[r].Cells[8].Value.ToString(), pic.ToArray());

                        }
                        else if (MaDM == "")
                        {
                            var SanPham = context.UpdateSP((Int32.Parse(txtMaSP.Text.ToString())), txtChiTiet.Text, txtTenSP.Text.Trim(), Int32.Parse(txtSoLuong.Text), Int32.Parse(txtGiaNhap.Text), Int32.Parse(txtGiaBan.Text),
                                 txtNCC.Text, MaNH, dgvSanPham.Rows[r].Cells[8].Value.ToString(), pic.ToArray());
                        }
                        else if (MaNH == "")
                        {
                            var SanPham = context.UpdateSP((Int32.Parse(txtMaSP.Text.ToString())), txtChiTiet.Text, txtTenSP.Text.Trim(), Int32.Parse(txtSoLuong.Text), Int32.Parse(txtGiaNhap.Text), Int32.Parse(txtGiaBan.Text),
                                txtNCC.Text, dgvSanPham.Rows[r].Cells[7].Value.ToString(), MaDM, pic.ToArray());
                        }
                        else
                        {
                            var SanPham = context.UpdateSP((Int32.Parse(txtMaSP.Text.ToString())), txtChiTiet.Text, txtTenSP.Text.Trim(), Int32.Parse(txtSoLuong.Text), Int32.Parse(txtGiaNhap.Text), Int32.Parse(txtGiaBan.Text),
                                txtNCC.Text, MaNH, MaDM, pic.ToArray());
                        }

                        LoadData();
                        MessageBox.Show("Updated");
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                    }
                    
                }
                catch (Exception)
                {
                    MessageBox.Show("Something Wrong");
                }
            }
        }
        private void btnHuy_Click(object sender, EventArgs e)
        {
            btnSua.Visible = true;
            btnThem.Visible = true;
            btnXoa.Visible = true;
            btnThem.BackColor = Color.White;
            btnSua.BackColor = Color.White;
            btnThem.Enabled = true; btnXoa.Enabled = true;
            btnXoa.Enabled = true;
            LoadData();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            LoadData();
        }

        private void cbbNhanHieu_SelectedIndexChanged(object sender, EventArgs e)
        {
            var nhanHieus = context.NhanHieux.ToList();
            if (cbbNhanHieu.ValueMember.ToString() == "") return;
            for (int i = 0; i < nhanHieus.Count; i++)
            {
                if (cbbNhanHieu.Text == nhanHieus[i].TenNhanHieu)
                {
                    MaNH = nhanHieus[i].NhanHieuID.ToString();
                }
            }

        }
        private void cbbDanhMuc_SelectedIndexChanged(object sender, EventArgs e)
        {
            var danhMucs = context.DanhMucs.ToList();
            if (cbbDanhMuc.ValueMember.ToString() == "") return;
            for (int i = 0; i < danhMucs.Count; i++)
            {
                if (cbbDanhMuc.Text == danhMucs[i].TenDanhMuc)
                {
                    MaDM = danhMucs[i].DanhMucID.ToString();
                }
            }
        }

        private void label9_Click(object sender, EventArgs e)
        {

        }
    }

}
