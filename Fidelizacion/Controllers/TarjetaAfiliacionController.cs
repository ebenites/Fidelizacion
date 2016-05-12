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
    public class TarjetaAfiliacionController : Controller
    {
        private plazaveaEntities db = new plazaveaEntities();

        // GET: TarjetaAfiliacion
        public ActionResult Buscar(String numeroCuenta)
        {
        
            var t_tarjeta_afiliacion = db.t_tarjeta_afiliacion.Where(o => o.numero_tarjeta.Contains(numeroCuenta)   ) ;
            return View("Index",t_tarjeta_afiliacion.ToList());
        }


        // GET: TarjetaAfiliacion
        public ActionResult Index()
        {
            var t_tarjeta_afiliacion = db.t_tarjeta_afiliacion;
            return View(t_tarjeta_afiliacion.ToList());
        }

        // GET: TarjetaAfiliacion/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            t_tarjeta_afiliacion t_tarjeta_afiliacion = db.t_tarjeta_afiliacion.Find(id);
            if (t_tarjeta_afiliacion == null)
            {
                return HttpNotFound();
            }
            return View(t_tarjeta_afiliacion);
        }

        // GET: TarjetaAfiliacion/Create
        public ActionResult Create()
        {
            ViewBag.pk_tarteja_afiliacion = new SelectList(db.t_cuenta, "pk_cuenta", "numero_cuenta");
            return View();
        }

        // POST: TarjetaAfiliacion/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "fechaVencimiento,numeroTarjeta,fechaEmision")] TarjetaAfiliacionViewModels t_tarjeta_afiliacion)
        {
            int c = db.t_tarjeta_afiliacion.Count();
            c++;
            t_tarjeta_afiliacion models = new t_tarjeta_afiliacion()
            {
               pk_tarteja_afiliacion = c,
                fecha_vencimiento = t_tarjeta_afiliacion.fechaVencimiento,
                fecha_emision = t_tarjeta_afiliacion.fechaEmision,
                numero_tarjeta = t_tarjeta_afiliacion.numeroTarjeta.ToString(),
            };
               
            if (ModelState.IsValid)
            {
               

                db.t_tarjeta_afiliacion.Add(models);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.pk_tarteja_afiliacion = new SelectList(db.t_cuenta, "pk_cuenta", "numero_cuenta", models.pk_tarteja_afiliacion);

            return View();
        }

        // GET: TarjetaAfiliacion/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            t_tarjeta_afiliacion t_tarjeta_afiliacion = db.t_tarjeta_afiliacion.Find(id);
            if (t_tarjeta_afiliacion == null)
            {
                return HttpNotFound();
            }
            ViewBag.pk_tarteja_afiliacion = new SelectList(db.t_cuenta, "pk_cuenta", "numero_cuenta", t_tarjeta_afiliacion.pk_tarteja_afiliacion);
            return View(t_tarjeta_afiliacion);
        }

        // POST: TarjetaAfiliacion/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "pk_tarteja_afiliacion,fecha_vencimiento,numero_tarjeta,fk_cuenta,fecha_emision")] t_tarjeta_afiliacion t_tarjeta_afiliacion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(t_tarjeta_afiliacion).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.pk_tarteja_afiliacion = new SelectList(db.t_cuenta, "pk_cuenta", "numero_cuenta", t_tarjeta_afiliacion.pk_tarteja_afiliacion);
            return View(t_tarjeta_afiliacion);
        }

        // GET: TarjetaAfiliacion/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            t_tarjeta_afiliacion t_tarjeta_afiliacion = db.t_tarjeta_afiliacion.Find(id);
            if (t_tarjeta_afiliacion == null)
            {
                return HttpNotFound();
            }
            return View(t_tarjeta_afiliacion);
        }

        // POST: TarjetaAfiliacion/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            t_tarjeta_afiliacion t_tarjeta_afiliacion = db.t_tarjeta_afiliacion.Find(id);
            db.t_tarjeta_afiliacion.Remove(t_tarjeta_afiliacion);
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
