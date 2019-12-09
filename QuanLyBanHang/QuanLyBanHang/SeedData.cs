using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace QuanLyBanHang
{
    class SeedData
    {
        QuanLyBanHangEntities context = new QuanLyBanHangEntities();
        static Random random = new Random();
        List<string> listDanhMuc = new List<string>() ;
        List<String> listNH = new List<string>();
        byte[] b = new byte[20];

       
        public static string RandomString(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            return new string(Enumerable.Repeat(chars, length)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }
       
        public static string RandomInt(int length)
        {
            const string chars = "0123456789";
            return new string(Enumerable.Repeat(chars, length)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }
        public void InsertDanhMUc()
        {
            try
            {
                for (int i = 0; i < 200; i++)
                {
                    string rd =RandomString(4);
                    listDanhMuc.Add( rd);
                    context.InsertDanhMuc(listDanhMuc[i], RandomString(5));
                    listNH.Add(RandomString(4));
                    context.InsertNhanHieu(listNH[i], RandomString(8));
                }
                for (int i = 0; i < 200; i++)
                {
                    random.NextBytes(b);
                    context.InsertSP(Int32.Parse(RandomInt(6)), RandomString(10), "Ten" + RandomString(5), Int32.Parse(RandomInt(3)), Int32.Parse(RandomInt(4)), Int32.Parse(RandomInt(4) + 100)
                        , RandomString(4), listNH[random.Next(0, 199)], listDanhMuc[random.Next(0, 199)], b);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            
        }
    }
}
