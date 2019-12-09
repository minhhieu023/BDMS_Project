using QuanLyBanHang.UserControls;
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
                var find = context.TimKHSDT(textBox1.Text);
                dataGridView1.DataSource = find.ToList();
            }
            else
            {
                var find = context.TimKHTenKH(textBox1.Text);
                dataGridView1.DataSource = find.ToList();
            }
            if(textBox1.Text=="")
            {
                return;
            }
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int r = dataGridView1.CurrentCell.RowIndex;

            Const.KhachHangID = dataGridView1.Rows[r].Cells[0].Value.ToString();
            Const.TenKhachHang = dataGridView1.Rows[r].Cells[1].Value.ToString();


        }

        private void button1_Click(object sender, EventArgs e)
        {
            int r = dataGridView1.CurrentCell.RowIndex;

            Const.KhachHangID = dataGridView1.Rows[r].Cells[0].Value.ToString();
            Const.TenKhachHang = dataGridView1.Rows[r].Cells[1].Value.ToString();
        }
    }
}
