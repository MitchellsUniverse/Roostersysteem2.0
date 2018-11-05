using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Roostersysteem.Models;

namespace Roostersysteem.Controllers
{
    public class VakController : Controller
    {
        private RoosterDB db = new RoosterDB();

        // GET: Vak
        public ActionResult Contacturen()
        {
            return View(db.Vaks.ToList());
        }

        // GET: Vak/Details/5
        public ActionResult ContacturenDetails(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Vak vak = db.Vaks.Find(id);
            if (vak == null)
            {
                return HttpNotFound();
            }
            return View(vak);
        }

        // GET: Vak/Create
        public ActionResult ContacturenCreate()
        {
            return View();
        }

        // POST: Vak/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ContacturenCreate([Bind(Include = "VakId,VakNaam,VakCode")] Vak vak)
        {
            if (ModelState.IsValid)
            {
                db.Vaks.Add(vak);
                db.SaveChanges();
                return RedirectToAction("Contacturen");
            }

            return View(vak);
        }

        // GET: Vak/Edit/5
        public ActionResult ContacturenEdit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Vak vak = db.Vaks.Find(id);
            if (vak == null)
            {
                return HttpNotFound();
            }
            return View(vak);
        }

        // POST: Vak/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ContacturenEdit([Bind(Include = "VakId,VakNaam,VakCode")] Vak vak)
        {
            if (ModelState.IsValid)
            {
                db.Entry(vak).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Contacturen");
            }
            return View(vak);
        }

        // GET: Vak/Delete/5
        public ActionResult ContacturenDelete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Vak vak = db.Vaks.Find(id);
            if (vak == null)
            {
                return HttpNotFound();
            }
            return View(vak);
        }

        // POST: Vak/Delete/5
        [HttpPost, ActionName("ContacturenDelete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Vak vak = db.Vaks.Find(id);
            db.Vaks.Remove(vak);
            db.SaveChanges();
            return RedirectToAction("Contacturen");
        }


        // VAKKEN KOPPELEN


        // GET: Vak
        public ActionResult VakkenKoppelen()
        {
            return View(db.Vaks.ToList());
        }

        // GET: Vak/Details/5
        public ActionResult VakkenKoppelenDetails(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Vak vak = db.Vaks.Find(id);
            if (vak == null)
            {
                return HttpNotFound();
            }
            return View(vak);
        }

        // GET: Vak/Create
        public ActionResult VakkenKoppelenCreate()
        {
            return View();
        }

        // POST: Vak/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult VakkenKoppelenCreate([Bind(Include = "VakId,VakNaam,VakCode")] Vak vak)
        {
            if (ModelState.IsValid)
            {
                db.Vaks.Add(vak);
                db.SaveChanges();
                return RedirectToAction("VakkenKoppelen");
            }

            return View(vak);
        }

        // GET: Vak/Edit/5
        public ActionResult VakkenKoppelenEdit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Vak vak = db.Vaks.Find(id);
            if (vak == null)
            {
                return HttpNotFound();
            }
            return View(vak);
        }

        // POST: Vak/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult VakkenKoppelenEdit([Bind(Include = "VakId,VakNaam,VakCode")] Vak vak)
        {
            if (ModelState.IsValid)
            {
                db.Entry(vak).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("VakkenKoppelen");
            }
            return View(vak);
        }

        // GET: Vak/Delete/5
        public ActionResult VakkenKoppelenDelete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Vak vak = db.Vaks.Find(id);
            if (vak == null)
            {
                return HttpNotFound();
            }
            return View(vak);
        }

        // commented om error te voorkomen. Kan aangepast worden met de juiste waarden.

        // POST: Vak/Delete/5
        //[HttpPost, ActionName("VakkenKoppelenDelete")]
        //[ValidateAntiForgeryToken]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    Vak vak = db.Vaks.Find(id);
        //    db.Vaks.Remove(vak);
        //    db.SaveChanges();
        //    return RedirectToAction("VakkenKoppelen");
        //}






            // overig

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
