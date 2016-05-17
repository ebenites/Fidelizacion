using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Fidelizacion.Models;

namespace Fidelizacion.Controllers
{
    public class FichaAfiliacionController : Controller
    {
        private plazaveaEntities db = new plazaveaEntities();

        // GET: FichaAfiliacion
        public ActionResult Index()
        {
            //var t_ficha_afiliacion = db.t_ficha_afiliacion.Include(t => t.t_tipo_documento);
            FichaAfiliacionViewModel fichaAfiliacion = new FichaAfiliacionViewModel();
            fichaAfiliacion.fecha_alta = DateTime.Now;
            return View(fichaAfiliacion);
        }

        // GET: FichaAfiliacion/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            t_ficha_afiliacion t_ficha_afiliacion = db.t_ficha_afiliacion.Find(id);
            if (t_ficha_afiliacion == null)
            {
                return HttpNotFound();
            }
            return View(t_ficha_afiliacion);
        }

        // GET: FichaAfiliacion/Create
        public ActionResult Create()
        {
            ViewBag.fk_tipo_documento = new SelectList(db.t_tipo_documento, "pk_tipo_documento", "tipo_documento");
            return View();
        }

        // POST: FichaAfiliacion/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "pk_ficha_afiliacion,apellido_paterno,apellido_materno,nombre,numero_documento,sexo,correo,numero_telefono,fecha_alta,fecha_nacimiento,estado_afiliado,fecha_baja,fk_tipo_documento")] t_ficha_afiliacion t_ficha_afiliacion)
        {
            if (ModelState.IsValid)
            {
                db.t_ficha_afiliacion.Add(t_ficha_afiliacion);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.fk_tipo_documento = new SelectList(db.t_tipo_documento, "pk_tipo_documento", "tipo_documento", t_ficha_afiliacion.fk_tipo_documento);
            return View(t_ficha_afiliacion);
        }

        // GET: FichaAfiliacion/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            t_ficha_afiliacion t_ficha_afiliacion = db.t_ficha_afiliacion.Find(id);
            if (t_ficha_afiliacion == null)
            {
                return HttpNotFound();
            }
            ViewBag.fk_tipo_documento = new SelectList(db.t_tipo_documento, "pk_tipo_documento", "tipo_documento", t_ficha_afiliacion.fk_tipo_documento);
            return View(t_ficha_afiliacion);
        }

        // POST: FichaAfiliacion/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "pk_ficha_afiliacion,apellido_paterno,apellido_materno,nombre,numero_documento,sexo,correo,numero_telefono,fecha_alta,fecha_nacimiento,estado_afiliado,fecha_baja,fk_tipo_documento")] t_ficha_afiliacion t_ficha_afiliacion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(t_ficha_afiliacion).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.fk_tipo_documento = new SelectList(db.t_tipo_documento, "pk_tipo_documento", "tipo_documento", t_ficha_afiliacion.fk_tipo_documento);
            return View(t_ficha_afiliacion);
        }

        // GET: FichaAfiliacion/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            t_ficha_afiliacion t_ficha_afiliacion = db.t_ficha_afiliacion.Find(id);
            if (t_ficha_afiliacion == null)
            {
                return HttpNotFound();
            }
            return View(t_ficha_afiliacion);
        }

        // POST: FichaAfiliacion/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            t_ficha_afiliacion t_ficha_afiliacion = db.t_ficha_afiliacion.Find(id);
            db.t_ficha_afiliacion.Remove(t_ficha_afiliacion);
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
