using DoAnMonHoc_CNW.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using PagedList.Mvc;
using System.IO;

namespace DoAnMonHoc_CNW.Controllers
{
    public class AdminController : Controller
    //public class AdminController : SecurityActionController
    {

        //public ActionResult text()
        //{
        //    return View();
        //}
        //
        // GET: /Admin/
        ShoponlineDataContext data = new ShoponlineDataContext();
      
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(FormCollection collection)
        {
            var tendn = collection["username"];
            var matkhau = collection["password"];
            var userSession = new Admin();


            if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi1"] = "Phải nhập tên đăng nhập";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi2"] = "Phải nhập mật khẩu";
            }
            else
            {
                Admin ad = data.Admins.SingleOrDefault(n => n.UserAdmin == tendn && n.PassAdmin == matkhau);
                if (ad != null)
                {

                    Session["Taikhoanadmin"] = ad;
                    //Session.Add(Common.USER_SESSION, userSession);
                    return RedirectToAction("Index", "Admin");
                }
                else
                    ViewBag.Thongbao = "Tên đăng nhập hoặc mật khẩu không đúng";
            }

            return View();
        }
        [HttpGet]
        public ActionResult Index()
        {
            if (Session["Taikhoanadmin"] == null || Session["Taikhoanadmin"].ToString() == "")
            {
                return RedirectToAction("Login", "Admin");
            }

            return View();



        }
        // Quản lý sản phẩm
        public ActionResult SanPham(int? page)
        {
            int pageNumber = (page ?? 1);
            int pageSize = 7;
            return View(data.SanPhams.ToList().OrderBy(n => n.MaSP).ToPagedList(pageNumber, pageSize));
        }

        //THÊM SẢN PHẨM

        [HttpGet]
        [ValidateInput(false)]
        public ActionResult ThemMoiSP()
        {
            ViewBag.MaPL = new SelectList(data.PhanLoais.ToList().OrderBy(n => n.TenPL), "MaPL", "TenPL");
            ViewBag.MaTH = new SelectList(data.ThuongHieus.ToList().OrderBy(n => n.TenTH), "MaTH", "TenTH");
            return View();
        }
        //THÊM SẢN PHẨM

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ThemMoiSP(SanPham sanpham, HttpPostedFileBase fileUpload)
        {
            ViewBag.MaPL = new SelectList(data.PhanLoais.ToList().OrderBy(n => n.TenPL), "MaPL", "TenPL");
            ViewBag.MaTH = new SelectList(data.ThuongHieus.ToList().OrderBy(n => n.TenTH), "MaTH", "TenTH");
            //Lưu đường dẫn của file

            //kt duong dan file
            if (fileUpload == null)
            {
                ViewBag.Thongbao = "Vui lòng chọn ảnh";
                return View();
            }
            //Thêm vào csdl
            else
            {
                if (ModelState.IsValid)
                {
                    var fileName = Path.GetFileName(fileUpload.FileName);
                    var path = Path.Combine(Server.MapPath("~/Content/SanPham/ImageProduct"), fileName);
                    if (System.IO.File.Exists(path))
                    {
                        ViewBag.Thongbao = "Hình ảnh đã tồn tại";

                    }
                    else
                    {
                        //Lưu hình ảnh
                        fileUpload.SaveAs(path);
                    }
                    sanpham.Anh = fileName;
                    //Lưu csdl
                    data.SanPhams.InsertOnSubmit(sanpham);
                    data.SubmitChanges();
                }
                return RedirectToAction("SanPham");
            }

        }

        // SỬA SẢN PHẨM
        [HttpGet]
        public ActionResult Suasp(int id)
        {
            
            SanPham sanPham = data.SanPhams.SingleOrDefault(n => n.MaSP == id);

            if (sanPham == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            //Lưu csdl

            ViewBag.MaPL = new SelectList(data.PhanLoais.ToList().OrderBy(n => n.TenPL), "MaPL", "TenPL", sanPham.MaPL);
            ViewBag.MaTH = new SelectList(data.ThuongHieus.ToList().OrderBy(n => n.TenTH), "MaTH", "TenTH", sanPham.MaTH);
            return View(sanPham);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Suasp(SanPham sanpham, HttpPostedFileBase fileUpload)
        {
            ViewBag.MaTH = new SelectList(data.ThuongHieus.ToList().OrderBy(n => n.TenTH), "MaTH", "TenTH");
            ViewBag.MaPL = new SelectList(data.PhanLoais.ToList().OrderBy(n => n.TenPL), "MaPL", "TenPL");
            //Lưu đường dẫn của file

            //kt duong dan file
            if (fileUpload == null)
            {
                ViewBag.Thongbao = "Vui lòng chọn ảnh";
                return View();
            }
            //Thêm vào csdl
            else
            {
                if (ModelState.IsValid)
                {
                    var fileName = Path.GetFileName(fileUpload.FileName);
                    var path = Path.Combine(Server.MapPath("~/Content/SanPham/ImageProduct"), fileName);
                    if (System.IO.File.Exists(path))
                    {
                        ViewBag.Thongbao = "Hình ảnh đã tồn tại";

                    }
                    else
                    {
                        //Lưu hình ảnh
                        fileUpload.SaveAs(path);
                    }
                    sanpham.Anh = fileName;
                    //Lưu csdl

                    UpdateModel(sanpham);
                    data.SubmitChanges();
                  
                }
                return RedirectToAction("SanPham");
            }

        }






        //HIỂN THỊ SẢN PHẨM
        public ActionResult ChiTietSanPham(int id)
        {
            SanPham sanPham = data.SanPhams.SingleOrDefault(n => n.MaSP == id);
            ViewBag.MaSP = sanPham.MaSP;
            if (sanPham == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(sanPham);
        }
        //chi tiết hóa đơn
        public ActionResult ChiTietHoaDon(int id)
        {
            ChiTietHD chiTietHD = data.ChiTietHDs.SingleOrDefault(n => n.MaHD == id);
            ViewBag.MaSP = chiTietHD.MaHD;
            if (chiTietHD == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(chiTietHD);
        }


        //XÓA SẢN PHẨM

        [HttpGet]
        public ActionResult XoaSanPham(int id)
        {
            SanPham sanPham = data.SanPhams.SingleOrDefault(n => n.MaSP == id);
            ViewBag.MaSp = sanPham.MaSP;
            if (sanPham == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(sanPham);
        }
        [HttpPost, ActionName("XoaSanPham")]
        public ActionResult Xacnhanxoa(int id)
        {

            SanPham sanPham = data.SanPhams.SingleOrDefault(n => n.MaSP == id);
            ViewBag.MaSp = sanPham.MaSP;
            if (sanPham == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            data.SanPhams.DeleteOnSubmit(sanPham);
            data.SubmitChanges();
            return RedirectToAction("SanPham");
        }
        ///////////////////////QLDANHMUC_SP////////////////////////////////////////
        public ActionResult DanhMucSP()
        {
            var all_DanhMuc = from dm in data.PhanLoais select dm;
            return View(all_DanhMuc);
        }
        public ActionResult Details(int id)
        {
            var Detail_DanhMuc = data.PhanLoais.Where(m => m.MaPL == id).First();
            return View(Detail_DanhMuc);
        }
        public ActionResult Create_DanhMuc()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create_DanhMuc(FormCollection collection, PhanLoai pl)
        {
          
            var CB_PhanLoai = collection["TenPL"];
           
            if (string.IsNullOrEmpty(CB_PhanLoai))
            {
                ViewData["Loi"] = " Tên danh mục không được để trống ";
            }
            else
            {
                pl.TenPL = CB_PhanLoai;
                data.PhanLoais.InsertOnSubmit(pl);
               
                data.SubmitChanges();
                return RedirectToAction("DanhMucSP");
            }
            return this.Create_DanhMuc();
        }
        public ActionResult Edit(int id)
        {
            var EB_tin = data.PhanLoais.First(m => m.MaPL == id);
            return View(EB_tin);
        }
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            
            var Ltin = data.PhanLoais.First(m => m.MaPL == id);
            var E_Loaitin = collection["TenPL"];
           
            Ltin.MaPL = id;
          
            if (string.IsNullOrEmpty(E_Loaitin))
            {
                ViewData["Loi"] = "Tên phân loại không được để trống ";
            }
           
            else
            {
                Ltin.TenPL = E_Loaitin;
               
                UpdateModel(Ltin);
                data.SubmitChanges();
                return RedirectToAction("DanhMucSP");
            }
            return this.Edit(id);
        }
        public ActionResult Delete(int id)
        {
            var D_tin = data.PhanLoais.First(m => m.MaPL == id);
            return View(D_tin);
        }
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            
            var D_tin = data.PhanLoais.Where(m => m.MaPL == id).First();
            
            data.PhanLoais.DeleteOnSubmit(D_tin);
            data.SubmitChanges();
            return RedirectToAction("DanhMucSP");
        }
        ///////////////////////QLThuongHieu_SP////////////////////////////////////////

        public ActionResult ThuongHieucSP()
        {
            var all_ThuongHieucSP = from dm in data.ThuongHieus select dm;
            return View(all_ThuongHieucSP);
        }
        public ActionResult Details_ThuongHieu(int id)
        {
            var Details_ThuongHieu = data.ThuongHieus.Where(m => m.MaTH == id).First();
            return View(Details_ThuongHieu);
        }
        public ActionResult Create_ThuongHieu()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create_ThuongHieu(FormCollection collection, ThuongHieu pl)
        {

            var Details_ThuongHieu = collection["TenTH"];

            if (string.IsNullOrEmpty(Details_ThuongHieu))
            {
                ViewData["Loi"] = " Tên danh mục không được để trống ";
            }
            else
            {
                pl.TenTH = Details_ThuongHieu;
                data.ThuongHieus.InsertOnSubmit(pl);

                data.SubmitChanges();
                return RedirectToAction("DanhMucSP");
            }
            return this.Create_ThuongHieu();
        }
        public ActionResult Edit_ThuongHieu(int id)
        {
            var EB_tin = data.ThuongHieus.First(m => m.MaTH == id);
            return View(EB_tin);
        }
        [HttpPost]
        public ActionResult Edit_ThuongHieu(int id, FormCollection collection)
        {

            var Ltin = data.ThuongHieus.First(m => m.MaTH == id);
            var E_Loaitin = collection["TenTH"];

            Ltin.MaTH = id;

            if (string.IsNullOrEmpty(E_Loaitin))
            {
                ViewData["Loi"] = "Tên phân loại không được để trống ";
            }

            else
            {
                Ltin.TenTH = E_Loaitin;

                UpdateModel(Ltin);
                data.SubmitChanges();
                return RedirectToAction("ThuongHieucSP");
            }
            return this.Edit_ThuongHieu(id);
        }
        public ActionResult Delete_ThuongHieu(int id)
        {
            var D_tin = data.ThuongHieus.First(m => m.MaTH == id);
            return View(D_tin);
        }
        [HttpPost]
        public ActionResult Delete_ThuongHieu(int id, FormCollection collection)
        {

            var D_tin = data.ThuongHieus.Where(m => m.MaTH == id).First();

            data.ThuongHieus.DeleteOnSubmit(D_tin);
            data.SubmitChanges();
            return RedirectToAction("ThuongHieucSP");
        }

        public ActionResult DanhMucHD(int? page)
        {
            int pageNumber = (page ?? 1);
            int pageSize = 7;
            return View(data.HoaDons.ToList().OrderBy(n => n.MaHD).ToPagedList(pageNumber, pageSize));
        }


        ///////////////////////////////////////
        // THỐNG KÊ DOANH THU
        public decimal thongKeDoanhThu()
        {
            decimal tongDoanhThu = data.HoaDons.Sum(n => n.TongTien).Value;
            return tongDoanhThu;
        }

        public double thongKeSLDonHang()
        {
            double ddh = data.HoaDons.Count();
            return ddh;
        }

      


        public ActionResult TongDoanhThu()
        {
            ViewBag.tongdoanhthu = thongKeDoanhThu();
            ViewBag.slDon = thongKeSLDonHang();
            
            return View();
        }

       
    }
}
