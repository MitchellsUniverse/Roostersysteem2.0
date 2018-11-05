using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Roostersysteem.Controllers
{
    public class RoosterController : Controller
    {
        // GET: Rooster
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult BeschikbaarheidOpvragen()
        {
            return View();
        }
    }
}