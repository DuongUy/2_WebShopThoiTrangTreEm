using DoAnMonHoc_CNW.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAnMonHoc_CNW.Models
{
    public class GioHang
    {
        ShoponlineDataContext data = new ShoponlineDataContext();
        public int iMaSP { get; set; }

        public string sTenSP { get; set; }
        

        public string sAnh { get; set; }

        public double dDonGia { get; set; }

        public int iSoluong { get; set; }
        

        public double dThanhTien
        {
            get { return iSoluong * dDonGia; }
        }

        public GioHang(int maSanPham)
        {
            iMaSP = maSanPham;
            SanPham sanpham = data.SanPhams.Single(m => m.MaSP == maSanPham);
            sTenSP = sanpham.TenSP;
            sAnh = sanpham.Anh;
          
            dDonGia = double.Parse(sanpham.GiaBan.ToString());
            iSoluong = 1;
        }
    }
}