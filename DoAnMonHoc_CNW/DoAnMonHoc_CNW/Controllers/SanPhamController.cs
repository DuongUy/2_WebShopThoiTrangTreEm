using DoAnMonHoc_CNW.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using PagedList.Mvc;

namespace DoAnMonHoc_CNW.Controllers
{
    public class SanPhamController : Controller
    {
        //
        // GET: /SanPham/
        ShoponlineDataContext data = new ShoponlineDataContext();
        private List<SanPham> LaysanphamMoi(int count)
        {
            return data.SanPhams.OrderByDescending(a => a.NgayCapNhat).Take(count).ToList();
        }

        public ActionResult Index(int ? page)
        {
            int pageSize = 6;
            int pageNum = (page ?? 1);

            var sanphammoi = LaysanphamMoi(12);
            // ToPagedList tạo phân trang
            return View(sanphammoi.ToPagedList(pageNum, pageSize));
            //return View(sanphammoi);
        }
        public ActionResult PhanLoai()
        {
            var PhanLoai = from pl in data.PhanLoais select pl;
            return PartialView(PhanLoai);
        }
      

        public ActionResult Details(int id)
        {
            var Details_SanPham = data.SanPhams.Where(m => m.MaSP == id).First();
            return View(Details_SanPham);
        }
       
        public ActionResult Search(String key)
        {


            int pageSize = 6;
            var sanphammoi = LaysanphamMoi(1);

            return View(sanphammoi);
        }
        public ActionResult SPTheoPhanLoai(int id)
        {

            //   var sanpham = from sp in data.SanPhams where sp.MaPL == id select sp;
            List<SanPham> sanpham = data.SanPhams.Where(t => t.MaPL == id).ToList();
            return View(sanpham);


        }
        public ActionResult ThuongHieu()
        {
            //  var thuonghieu = from pl in data.ThuongHieus select pl;
            List<ThuongHieu> thuonghieu = data.ThuongHieus.ToList();
            return PartialView(thuonghieu);
        }
        public ActionResult SPThuongHieu(int id)
        {

            //  var sanpham = from sp in data.SanPhams where sp.MaTH == id select sp;

            List<SanPham> sanpham = data.SanPhams.Where(t => t.MaTH == id).ToList();
            return View(sanpham);

        }
        public ActionResult GioiThieu()
        {

            return View();
        }
        public ActionResult LienHe()
        {

            return View();
        }
       
         
    }
}
