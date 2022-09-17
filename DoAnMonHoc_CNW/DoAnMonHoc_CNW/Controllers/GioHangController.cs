using DoAnMonHoc_CNW.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAnMonHoc_CNW.Controllers
{
    public class GioHangController : Controller
    {
        //
        // GET: /GioHang/
        ShoponlineDataContext data = new ShoponlineDataContext();

        public List<GioHang> Laygiohang()
        {
            List<GioHang> lstGiohang = Session["Giohang"] as List<GioHang>;
            if (lstGiohang == null)
            {
                lstGiohang = new List<GioHang>();
                Session["Giohang"] = lstGiohang;
            }
            return lstGiohang;
        }
        public ActionResult ThemGioHang(int iMaSP, string strURL)
        {
            List<GioHang> lstGiohang = Laygiohang();
            GioHang sanpham = lstGiohang.Find(n => n.iMaSP == iMaSP);
            if (sanpham == null)
            {
                sanpham = new GioHang(iMaSP);
                lstGiohang.Add(sanpham);
                return Redirect(strURL);
            }
            else
            {
                sanpham.iSoluong++;
                return Redirect(strURL);
            }
        }

        private int TongSoLuong()
        {
            int iTongSoLuong = 0;
            List<GioHang> lstGiohang = Session["GioHang"] as List<GioHang>;
            if (lstGiohang != null)
            {
                iTongSoLuong = lstGiohang.Sum(n => n.iSoluong);
            }
            return iTongSoLuong;
        }

        private double tinhTongTien()
        {
            double iTongTien = 0;
            List<GioHang> lstGiohang = Session["GioHang"] as List<GioHang>;
            if (lstGiohang != null)
            {
                iTongTien = lstGiohang.Sum(n => n.dThanhTien);
            }
            return iTongTien;
        }

        public ActionResult GioHang()
        {
            List<GioHang> lstGiohang = Laygiohang();
            if (lstGiohang.Count == 0)
            {
                return RedirectToAction("Index", "SanPham");
            }
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = tinhTongTien();
            return View(lstGiohang);
        }

        public ActionResult GioHangPartial()
        {
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = tinhTongTien();
            return PartialView();
        }
        [HttpGet]
        public ActionResult DatHang()
        {
            if (Session["Taikhoan"] == null || Session["TaiKhoan"].ToString() == "")
            {
                return RedirectToAction("DangNhap", "NguoiDung");
            }
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("Index", "SanPham");
            }
            List<GioHang> lstGioHang = Laygiohang();
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = tinhTongTien();
            return View(lstGioHang);
        }

        public ActionResult DatHang(FormCollection collection)
        {
            HoaDon ddh = new HoaDon();
            KhachHang kh = (KhachHang)Session["Taikhoan"];
            List<GioHang> gh = Laygiohang();
            ddh.MaKH = kh.MaKH;
            ddh.NgayMua = DateTime.Now;
            var ngaygiao = String.Format(" {0:MM/ddh/yyyy}", collection["NgayGiao"]);
            ddh.GhiChu = kh.DiaChiK;
            //ddh.NgayGiao = DateTime.Parse(ngaygiao);
            ////ddh.TinhTrangGiaoHang = false;
            ////ddh.DaThanhToan = false;
            data.HoaDons.InsertOnSubmit(ddh);

            data.SubmitChanges();
            foreach (var item in gh)
            {
                ChiTietHD ctdh = new ChiTietHD();
                ctdh.MaHD = ddh.MaHD;
                ctdh.MaSP = item.iMaSP;
                ctdh.SoLuong = item.iSoluong;
                ctdh.ThanhTien = (decimal)item.dThanhTien;
                data.ChiTietHDs.InsertOnSubmit(ctdh);

            }
            data.SubmitChanges();
            Session["GioHang"] = null;
            return RedirectToAction("Xacnhandonhang", "GioHang");
        }
        public ActionResult Xacnhandonhang()
        {
            return View();
        }
        public ActionResult XoaGioHang(int iMasp)
        {
            List<GioHang> lstGioHang = Laygiohang();
            GioHang sanpham = lstGioHang.SingleOrDefault(n => n.iMaSP == iMasp);
            if(sanpham != null)
            {
                lstGioHang.RemoveAll(n => n.iMaSP == iMasp);
                return RedirectToAction("GioHang");
            }
            if (lstGioHang.Count==0)
            {
                
                return RedirectToAction("Index","GioHang");
            }
            return RedirectToAction("GioHang");
            
        }
        public ActionResult XoaTatCaGioHang()
        {
            List<GioHang> lstGioHang = Laygiohang();
            lstGioHang.Clear();
            return RedirectToAction("Index", "SanPham");
        }
        public ActionResult CapNhatGioHang(int iMasp,FormCollection f)
        {
            List<GioHang> lstGioHang = Laygiohang();
            GioHang sanpham = lstGioHang.SingleOrDefault(n => n.iMaSP == iMasp);
            if(sanpham != null)
            {
                sanpham.iSoluong = int.Parse(f["txtSoluong"].ToString());
            }
            return RedirectToAction("GioHang");        }

    }
}
