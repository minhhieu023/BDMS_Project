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
    public partial class TimKhachHang : Form
    {
        QuanLyBanHangEntities context = new QuanLyBanHangEntities();
        public TimKhachHang()
        {
            InitializeComponent();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            if(checkBox1.Checked == true)
            {
                var find = context.TimKiemSDT(textBox1.Text);
                dataGridView1.DataSource = find.ToList();
            }
            else
            {
                var find = context.TimKHTenKH(textBox1.Text);
                dataGridView1.DataSource = find.ToList();
            }
            if(textBox1.Text=="")
            {
                dataGridView1.Rows.Clear();
                dataGridView1.Refresh();

            }
        }
    }
}
