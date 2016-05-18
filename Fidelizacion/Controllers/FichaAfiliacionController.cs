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

        public ActionResult Buscar(String numeroCuenta)
        {


                   var t_afiliado = db.t_ficha_afiliacion .Where(o => o.numero_documento.Contains(numeroCuenta));

            //var t_afiliado = db.t_ficha_afiliacion.Include(t => t.t_tipo_documento);

            List<FichaAfiliacionViewModel> fichaAfiliacion = new List<FichaAfiliacionViewModel>();

            FichaAfiliacionViewModel ficha = null;
            foreach (var item in t_afiliado)
            {
                //t_ficha_afiliacion fichaafiliacion = db.t_ficha_afiliacion.Find(item.fk_ficha_afiliacion); 
                t_cuenta cuenta = db.t_cuenta.Where(o => o.fk_ficha_afiliacion == item.pk_ficha_afiliacion).Single(); 
                ficha = new FichaAfiliacionViewModel() {
                    numero_documento  = item.numero_documento ,
                    nombre = item.nombre + " " + item.apellido_paterno + " " + item.apellido_paterno ,
                    estado_afiliado = item.estado_afiliado ,
                     
                    tipo_afiliado = cuenta.t_tipo_cuenta.tipo_cuenta  
                
                     

                };
                fichaAfiliacion.Add(ficha);
            }

            return View("Index", fichaAfiliacion.ToList());
        }

        // GET: FichaAfiliacion
        public ActionResult Index()
        {
            var t_ficha_afiliacion = db.t_ficha_afiliacion.Include(t => t.t_tipo_documento);
            FichaAfiliacionViewModel fichaAfiliacion = new FichaAfiliacionViewModel();
            fichaAfiliacion.fecha_alta = DateTime.Now;
            return View();
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
            FichaAfiliacionViewModel ficha = new FichaAfiliacionViewModel()
            {
                nombre=t_ficha_afiliacion.nombre
            };
            return View(ficha);
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
