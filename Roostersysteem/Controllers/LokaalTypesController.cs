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
    public class LokaalTypesController : Controller
    {
        private RoosterDB db = new RoosterDB();

        // GET: LokaalTypes
        public ActionResult Index()
        {
            return View(db.LokaalTypes.ToList());
        }

        // GET: LokaalTypes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LokaalType lokaalType = db.LokaalTypes.Find(id);
            if (lokaalType == null)
            {
                return HttpNotFound();
            }
            return View(lokaalType);
        }

        // GET: LokaalTypes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: LokaalTypes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "LokaalTypeId,LokaalTypeNaam")] LokaalType lokaalType)
        {
            if (ModelState.IsValid)
            {
                db.LokaalTypes.Add(lokaalType);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(lokaalType);
        }

        // GET: LokaalTypes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LokaalType lokaalType = db.LokaalTypes.Find(id);
            if (lokaalType == null)
            {
                return HttpNotFound();
            }
            return View(lokaalType);
        }

        // POST: LokaalTypes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "LokaalTypeId,LokaalTypeNaam")] LokaalType lokaalType)
        {
            if (ModelState.IsValid)
            {
                db.Entry(lokaalType).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(lokaalType);
        }

        // GET: LokaalTypes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LokaalType lokaalType = db.LokaalTypes.Find(id);
            if (lokaalType == null)
            {
                return HttpNotFound();
            }
            return View(lokaalType);
        }

        // POST: LokaalTypes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            LokaalType lokaalType = db.LokaalTypes.Find(id);
            db.LokaalTypes.Remove(lokaalType);
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
