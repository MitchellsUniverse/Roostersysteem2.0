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
    public class VakLokaalTypesController : Controller
    {
        private RoosterDB db = new RoosterDB();

        // GET: VakLokaalTypes
        public ActionResult Index()
        {
            var vakLokaalTypes = db.VakLokaalTypes.Include(v => v.LokaalType).Include(v => v.Vak);
            return View(vakLokaalTypes.ToList());
        }

        // GET: VakLokaalTypes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            VakLokaalType vakLokaalType = db.VakLokaalTypes.Find(id);
            if (vakLokaalType == null)
            {
                return HttpNotFound();
            }
            return View(vakLokaalType);
        }

        // GET: VakLokaalTypes/Create
        public ActionResult Create()
        {
            ViewBag.LokaalType_Id = new SelectList(db.LokaalTypes, "LokaalTypeId", "LokaalTypeNaam");
            ViewBag.Vak_Id = new SelectList(db.Vaks, "VakId", "VakNaam");
            return View();
        }

        // POST: VakLokaalTypes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "LokaalType_Id,Vak_Id,VakLokaalType_Id")] VakLokaalType vakLokaalType)
        {
            if (ModelState.IsValid)
            {
                db.VakLokaalTypes.Add(vakLokaalType);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.LokaalType_Id = new SelectList(db.LokaalTypes, "LokaalTypeId", "LokaalTypeNaam", vakLokaalType.LokaalType_Id);
            ViewBag.Vak_Id = new SelectList(db.Vaks, "VakId", "VakNaam", vakLokaalType.Vak_Id);
            return View(vakLokaalType);
        }

        // GET: VakLokaalTypes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            VakLokaalType vakLokaalType = db.VakLokaalTypes.Find(id);
            if (vakLokaalType == null)
            {
                return HttpNotFound();
            }
            ViewBag.LokaalType_Id = new SelectList(db.LokaalTypes, "LokaalTypeId", "LokaalTypeNaam", vakLokaalType.LokaalType_Id);
            ViewBag.Vak_Id = new SelectList(db.Vaks, "VakId", "VakNaam", vakLokaalType.Vak_Id);
            return View(vakLokaalType);
        }

        // POST: VakLokaalTypes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "LokaalType_Id,Vak_Id,VakLokaalType_Id")] VakLokaalType vakLokaalType)
        {
            if (ModelState.IsValid)
            {
                db.Entry(vakLokaalType).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.LokaalType_Id = new SelectList(db.LokaalTypes, "LokaalTypeId", "LokaalTypeNaam", vakLokaalType.LokaalType_Id);
            ViewBag.Vak_Id = new SelectList(db.Vaks, "VakId", "VakNaam", vakLokaalType.Vak_Id);
            return View(vakLokaalType);
        }

        // GET: VakLokaalTypes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            VakLokaalType vakLokaalType = db.VakLokaalTypes.Find(id);
            if (vakLokaalType == null)
            {
                return HttpNotFound();
            }
            return View(vakLokaalType);
        }

        // POST: VakLokaalTypes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            VakLokaalType vakLokaalType = db.VakLokaalTypes.Find(id);
            db.VakLokaalTypes.Remove(vakLokaalType);
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
