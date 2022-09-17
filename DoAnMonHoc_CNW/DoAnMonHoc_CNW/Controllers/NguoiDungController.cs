using DoAnMonHoc_CNW.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAnMonHoc_CNW.Controllers
{
    public class NguoiDungController : Controller
    {
        //
        // GET: /NguoiDung/
        ShoponlineDataContext data = new ShoponlineDataContext();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult DangKy()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Dangky(FormCollection collection, KhachHang kh)
        {
            var hoten = collection["HotenKH"];
            var tendn = collection["TenDN"];
            var ngaysinh = collection["NgaySinh"];
            var gioitinh = collection["GioiTinh"];
            var diachi = collection["DiaChiK"];
            var matkhau = collection["Matkhau"];
            var matkhaunhaplai = collection["Matkhaunhaplai"];
           
            var email = collection["Email"];
            var dienthoai = collection["Dienthoai"];
            
            if (String.IsNullOrEmpty(hoten))
            {
                ViewData["Loi1"] = "Họ tên khách hàng không được để trống";

            }
            else if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi2"] = "Phải nhập tên đăng nhập";

            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi3"] = "Phải nhập mật khẩu";

            }
            else if (String.IsNullOrEmpty(matkhaunhaplai))
            {
                ViewData["Loi4"] = "Phải nhập lại mật khẩu";

            }
            else if (String.IsNullOrEmpty(diachi))
            {
                ViewData["Loi7"] = "Vui lòng nhập email";

            }
            else if (String.IsNullOrEmpty(diachi))
            {
                ViewData["Loi6"] = "Vui lòng nhập địa chỉ để chúng tôi còn giao hàng";

            }
            else if (String.IsNullOrEmpty(dienthoai))
            {
                ViewData["Loi5"] = "Phải nhập điện thoại";

            }
            else
            {
                kh.HoTenK = hoten;
                kh.TenTKK = tendn;
                kh.PassK = matkhau;
                kh.EmailK = email;
                kh.DiaChiK = diachi;
                kh.SDTK = dienthoai;
                //kh.NgaySinhK = DateTime.Parse(ngaysinh);
                data.KhachHangs.InsertOnSubmit(kh);
                data.SubmitChanges();
                return RedirectToAction("Dangnhap");

            }
            return this.DangKy();
        }
        [HttpGet]
        public ActionResult Dangnhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Dangnhap(FormCollection collection)
        {

            var tendn = collection["TenDN"];
            var matkhau = collection["Matkhau"];
            if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi1"] = "Phải nhập tên đăng nhập";

            }
            else
                if (String.IsNullOrEmpty(matkhau))
                {
                    ViewData["Loi2"] = "Phải nhập mật khẩu";

                }
                else
                {
                    KhachHang kh = data.KhachHangs.SingleOrDefault(n => n.TenTKK == tendn && n.PassK == matkhau);
                if (kh != null)
                    {
                        //ViewBag.Thongbao = "Chúc mừng đăng nhập thành công";
                        Session["Taikhoan"] = kh;
                        return RedirectToAction("GioHang", "GioHang");
                    }
                    else
                        ViewBag.Thongbao = "Tên đăng nhập hoặc mật khẩu không đúng ";
                }
                return View();
        }


    }
}
