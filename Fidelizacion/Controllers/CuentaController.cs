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
    public class CuentaController : Controller
    {
        private plazaveaEntities db = new plazaveaEntities();

        // GET: Cuenta
        public ActionResult Index()
        {
            var t_cuenta = db.t_cuenta.Include(t => t.t_cuenta2).Include(t => t.t_ficha_afiliacion).Include(t => t.t_tipo_cuenta).Include(t => t.t_contrato);
            return View(t_cuenta.ToList());
        }

        // GET: Cuenta/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            t_cuenta t_cuenta = db.t_cuenta.Find(id);
            if (t_cuenta == null)
            {
                return HttpNotFound();
            }
            return View(t_cuenta);
        }

        // GET: Cuenta/Create
        public ActionResult Create()
        {
            ViewBag.fk_cuenta = new SelectList(db.t_cuenta, "id_cuenta", "numero_cuenta");
            ViewBag.fk_ficha_afiliacion = new SelectList(db.t_ficha_afiliacion, "id_ficha_afiliacion", "apellidos");
            ViewBag.fk_tipo_cuenta = new SelectList(db.t_tipo_cuenta, "id_tipo_cuenta", "tipo_cuenta");
            ViewBag.id_cuenta = new SelectList(db.t_contrato, "id_contrato", "condiciones");
            return View();
        }

        // POST: Cuenta/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id_cuenta,numero_cuenta,fecha_alta,fecha_baja,puntos,estado_cuenta,fk_tipo_cuenta,fk_cuenta,fk_ficha_afiliacion")] t_cuenta t_cuenta)
        {
            if (ModelState.IsValid)
            {
                db.t_cuenta.Add(t_cuenta);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.fk_cuenta = new SelectList(db.t_cuenta, "id_cuenta", "numero_cuenta", t_cuenta.fk_cuenta);
            ViewBag.fk_ficha_afiliacion = new SelectList(db.t_ficha_afiliacion, "id_ficha_afiliacion", "apellidos", t_cuenta.fk_ficha_afiliacion);
            ViewBag.fk_tipo_cuenta = new SelectList(db.t_tipo_cuenta, "id_tipo_cuenta", "tipo_cuenta", t_cuenta.fk_tipo_cuenta);
            ViewBag.id_cuenta = new SelectList(db.t_contrato, "id_contrato", "condiciones", t_cuenta.id_cuenta);
            return View(t_cuenta);
        }

        // GET: Cuenta/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            t_cuenta t_cuenta = db.t_cuenta.Find(id);
            if (t_cuenta == null)
            {
                return HttpNotFound();
            }
            ViewBag.fk_cuenta = new SelectList(db.t_cuenta, "id_cuenta", "numero_cuenta", t_cuenta.fk_cuenta);
            ViewBag.fk_ficha_afiliacion = new SelectList(db.t_ficha_afiliacion, "id_ficha_afiliacion", "apellidos", t_cuenta.fk_ficha_afiliacion);
            ViewBag.fk_tipo_cuenta = new SelectList(db.t_tipo_cuenta, "id_tipo_cuenta", "tipo_cuenta", t_cuenta.fk_tipo_cuenta);
            ViewBag.id_cuenta = new SelectList(db.t_contrato, "id_contrato", "condiciones", t_cuenta.id_cuenta);
            return View(t_cuenta);
        }

        // POST: Cuenta/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id_cuenta,numero_cuenta,fecha_alta,fecha_baja,puntos,estado_cuenta,fk_tipo_cuenta,fk_cuenta,fk_ficha_afiliacion")] t_cuenta t_cuenta)
        {
            if (ModelState.IsValid)
            {
                db.Entry(t_cuenta).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.fk_cuenta = new SelectList(db.t_cuenta, "id_cuenta", "numero_cuenta", t_cuenta.fk_cuenta);
            ViewBag.fk_ficha_afiliacion = new SelectList(db.t_ficha_afiliacion, "id_ficha_afiliacion", "apellidos", t_cuenta.fk_ficha_afiliacion);
            ViewBag.fk_tipo_cuenta = new SelectList(db.t_tipo_cuenta, "id_tipo_cuenta", "tipo_cuenta", t_cuenta.fk_tipo_cuenta);
            ViewBag.id_cuenta = new SelectList(db.t_contrato, "id_contrato", "condiciones", t_cuenta.id_cuenta);
            return View(t_cuenta);
        }

        // GET: Cuenta/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            t_cuenta t_cuenta = db.t_cuenta.Find(id);
            if (t_cuenta == null)
            {
                return HttpNotFound();
            }
            return View(t_cuenta);
        }

        // POST: Cuenta/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            t_cuenta t_cuenta = db.t_cuenta.Find(id);
            db.t_cuenta.Remove(t_cuenta);
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
