using ModelEF.Dao;
using System.Web.Mvc;

namespace TestUngDung.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult Index()
        {
            return View();
        }

        [ChildActionOnly]
        public PartialViewResult ProductList()
        {
            var model = new ProductDao().ListAll();
            return PartialView(model);
        }
    }
}