using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AzureCdnMe.Sample.Web.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        public ActionResult Index()
        {
        	ViewBag.Title = "Home";
            return View();
        }

		public ActionResult About()
		{
			ViewBag.Title = "About";
			return View();
		}

    }
}
