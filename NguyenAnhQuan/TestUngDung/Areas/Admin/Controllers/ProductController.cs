using ModelEF.Dao;
using ModelEF.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TestUngDung.Areas.Admin.Models;

namespace TestUngDung.Areas.Admin.Controllers
{
    public class ProductController : BaseController
    {
        // GET: Admin/Product
        public ActionResult Index(string searchString, int page = 1, int pageSize = 5)
        {
            var dao = new ProductDao();
            var model = dao.ListAllPagingPro(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }

        [HttpGet]
        public ActionResult Create()
        {
            SetViewBag();
            return View();
        }

        [HttpGet]
        public ActionResult Edit(int? id)
        {
            var dao = new ProductDao();
            var content = dao.GetByID(id);

            SetViewBag(content.IDCategory);
            return View(content);
        }

        [HttpPost,ValidateInput(false)]
        public ActionResult Edit(Product model)
        {
            if (ModelState.IsValid)
            {
                var dao = new ProductDao();
                var result = dao.Update(model);
                if (result)
                {
                    return RedirectToAction("Index", "Product");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật thành công");
                }
            }
            SetViewBag(model.IDCategory);
            return View("Index");
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult Create(Product model)
        {
            if (ModelState.IsValid)
            {
                var dao = new ProductDao();

                long id = dao.Insert(model);
                if (id > 0)
                {
                    return RedirectToAction("Index", "Product");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm sản phẩm không thành công");
                }
            }
            SetViewBag();
            return View("Index");
        }

        
        public ActionResult Detail(int? id)
        {
            var delt = new ProductDao().Find(id);
            return View(delt);
        }

        public void SetViewBag(long? selectedId=null)
        {
            var dao = new CategoryDao();
            ViewBag.IDCategory = new SelectList(dao.ListAll(), "ID", "Name", selectedId);
        }

        //[HttpDelete]
        public ActionResult Delete(int id)
        {
            new ProductDao().Delete(id);

            return RedirectToAction("Index");
        }
    }
}