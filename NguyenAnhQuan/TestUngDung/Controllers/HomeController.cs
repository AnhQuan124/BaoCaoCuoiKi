using ModelEF.Dao;
using System.Web.Mvc;

namespace TestUngDung.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        [HttpGet]
        public ActionResult Index()
        {
            var model = new CategoryDao().ListGroupId();
            return PartialView(model);
        }

        [HttpGet]
        public ActionResult MainMenu()
        {
            var model = new CategoryDao().ListGroupId();
            return PartialView(model);
        }
    }
}