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
    public class VaksController : Controller
    {
        private RoosterDB db = new RoosterDB();

        // GET: Vaks
        public ActionResult Index()
        {
            return View(db.Vaks.ToList());
        }

        // GET: Vaks/Details/5
        public ActionResult Details(int? id)
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

        // GET: Vaks/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Vaks/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "VakId,VakNaam,VakCode")] Vak vak)
        {
            if (ModelState.IsValid)
            {
                db.Vaks.Add(vak);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(vak);
        }

        // GET: Vaks/Edit/5
        public ActionResult Edit(int? id)
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

        // POST: Vaks/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "VakId,VakNaam,VakCode")] Vak vak)
        {
            if (ModelState.IsValid)
            {
                db.Entry(vak).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(vak);
        }

        // GET: Vaks/Delete/5
        public ActionResult Delete(int? id)
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

        // POST: Vaks/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Vak vak = db.Vaks.Find(id);
            db.Vaks.Remove(vak);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

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
