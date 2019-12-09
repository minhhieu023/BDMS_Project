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
        public HoaDonUC()
        {
            InitializeComponent();
        }

        private void HoaDonUC_Load(object sender, EventArgs e)
        {

        }
        void LoadData()
        {
            dgvHoaDon.DataSource = context.SelectHoaDon();


        }
    }
}
