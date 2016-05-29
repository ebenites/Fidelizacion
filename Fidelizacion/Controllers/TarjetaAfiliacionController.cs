using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Fidelizacion.Models;
using Fidelizacion.Services;
namespace Fidelizacion.Controllers
{
    public class TarjetaAfiliacionController : Controller
    {
        private plazaveaEntities db = new plazaveaEntities();
        private ITarjetaAfiliacionService service = new TarjetaAfiliacionService();
        // GET: TarjetaAfiliacion
        public ActionResult Buscar(String numeroCuenta,String estado)
        {
            var t_tarjeta_afiliacion = (IQueryable<t_tarjeta_afiliacion>)null;
            //if (estado.Equals("-1"))
            //{
                //t_tarjeta_afiliacion = db.t_tarjeta_afiliacion.Where(o => o.numero_tarjeta.Contains(numeroCuenta));
                t_tarjeta_afiliacion = service.Buscar(numeroCuenta, estado);
            //}
            //else {
            //     //t_tarjeta_afiliacion = db.t_tarjeta_afiliacion.Where(o => o.numero_tarjeta.Contains(numeroCuenta) && o.estado.Equals(estado)  );
            //}
            
            return View("Index",t_tarjeta_afiliacion.ToList());
        }


        // GET: TarjetaAfiliacion
        public ActionResult Index()
        {
            var t_tarjeta_afiliacion = new List<t_tarjeta_afiliacion>();
            return View(t_tarjeta_afiliacion.ToList());
        }

        //// GET: TarjetaAfiliacion/Details/5
        //public ActionResult Details(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    t_tarjeta_afiliacion t_tarjeta_afiliacion = db.t_tarjeta_afiliacion.Find(id);
        //    if (t_tarjeta_afiliacion == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(t_tarjeta_afiliacion);
        //}

        // GET: TarjetaAfiliacion/Create
        public ActionResult Create()
        {
            ViewBag.id_tarjeta_afiliacion = new SelectList(db.t_cuenta, "id_cuenta", "numero_cuenta");
            //ViewBag.fechaEmision = DateTime.Now;
            TarjetaAfiliacionViewModels tarjeta = new TarjetaAfiliacionViewModels()
            {
                fechaEmision = DateTime.Now
            };
            return View(tarjeta);
        }

        // POST: TarjetaAfiliacion/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "fechaVencimiento,numeroTarjeta,fechaEmision")] TarjetaAfiliacionViewModels t_tarjeta_afiliacion)
        {
          
            //t_tarjeta_afiliacion models = new t_tarjeta_afiliacion()
            //{
               
            //    fecha_vencimiento = t_tarjeta_afiliacion.fechaVencimiento,
            //    fecha_emision = t_tarjeta_afiliacion.fechaEmision,
            //    numero_tarjeta = t_tarjeta_afiliacion.numeroTarjeta.ToString(),
            //    estado ="A"
            //};
           
            if (ModelState.IsValid)
            {
                // var lista = db.t_tarjeta_afiliacion.Where(o => o.numero_tarjeta == t_tarjeta_afiliacion.numeroTarjeta);
                var lista = service.Buscar(t_tarjeta_afiliacion.numeroTarjeta, "-1");
                if (lista!= null && lista.Count() > 0)
                {
                    ModelState.AddModelError("NUM_CUENTA_EXISTE", "El numero de cuenta " + t_tarjeta_afiliacion.numeroTarjeta + " se encuentra registrado.");
                    return View(t_tarjeta_afiliacion);
                }

                service.insertar(t_tarjeta_afiliacion);
                //db.t_tarjeta_afiliacion.Add(models);
                //db.SaveChanges();

                TempData["Message"] = "Se ha concluído la grabación de la tarjeta.";

                return RedirectToAction("Index");
            }

            //ViewBag.id_tarjeta_afiliacion = new SelectList(db.t_cuenta, "id_cuenta", "numero_cuenta", models.id_tarjeta_afiliacion);

            return View();
        }

        // GET: TarjetaAfiliacion/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            // t_tarjeta_afiliacion t_tarjeta_afiliacion = db.t_tarjeta_afiliacion.Find(id);

            t_tarjeta_afiliacion t_tarjeta_afiliacion = service.getPorId((int)id);

            if (t_tarjeta_afiliacion == null)
            {
                return HttpNotFound();
            }
            //ViewBag.id_tarjeta_afiliacion = new SelectList(db.t_cuenta, "id_cuenta", "numero_cuenta", t_tarjeta_afiliacion.id_tarjeta_afiliacion);
            TarjetaAfiliacionEditViewModels tarjetaView = new TarjetaAfiliacionEditViewModels()
            {
                numeroTarjeta = t_tarjeta_afiliacion.numero_tarjeta,
                fechaEmision = (DateTime) t_tarjeta_afiliacion.fecha_emision ,
                 fechaVencimiento = (DateTime)t_tarjeta_afiliacion.fecha_vencimiento ,
                 Codigo = t_tarjeta_afiliacion.id_tarjeta_afiliacion  ,
                  Estado = t_tarjeta_afiliacion.estado  
            };
            return View(tarjetaView);
        }

        // POST: TarjetaAfiliacion/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Codigo,fechaVencimiento,numeroTarjeta,fechaEmision,Estado,motivo")] TarjetaAfiliacionEditViewModels t_tarjeta_afiliacion_edit)
        {
            TarjetaAfiliacionViewModels t_tarjeta_afiliacion = null;
            if (ModelState.IsValid)
            {

                 t_tarjeta_afiliacion =  new TarjetaAfiliacionViewModels() {

                     Codigo = t_tarjeta_afiliacion_edit.Codigo ,
                     fechaVencimiento = t_tarjeta_afiliacion_edit.fechaVencimiento,
                     numeroTarjeta = t_tarjeta_afiliacion_edit.numeroTarjeta,
                     fechaEmision = t_tarjeta_afiliacion_edit.fechaEmision,
                     Estado = t_tarjeta_afiliacion_edit.Estado,
                     motivo = t_tarjeta_afiliacion_edit.motivo

                 }         ;
                //t_tarjeta_afiliacion t_tarjeta_afiliacion_mo = db.t_tarjeta_afiliacion.Find(t_tarjeta_afiliacion.Codigo);

                //t_tarjeta_afiliacion_mo.estado = t_tarjeta_afiliacion.Estado;
                //t_tarjeta_afiliacion_mo.fecha_emision = t_tarjeta_afiliacion.fechaEmision;
                //t_tarjeta_afiliacion_mo.fecha_vencimiento = t_tarjeta_afiliacion.fechaVencimiento;
                // t_tarjeta_afiliacion_mo.estado = t_tarjeta_afiliacion.Estado;

                t_tarjeta_afiliacion t_tarjeta_afiliacion_mo=    service.modificar(t_tarjeta_afiliacion);

                t_tarjeta_afiliacion = new TarjetaAfiliacionViewModels()
                {
                    numeroTarjeta = t_tarjeta_afiliacion_mo.numero_tarjeta,
                    fechaEmision = (DateTime)t_tarjeta_afiliacion_mo.fecha_emision,
                    fechaVencimiento = (DateTime)t_tarjeta_afiliacion_mo.fecha_vencimiento,
                    Codigo = t_tarjeta_afiliacion_mo.id_tarjeta_afiliacion,
                    Estado = t_tarjeta_afiliacion_mo.estado
                };
                //db.Entry(t_tarjeta_afiliacion_mo).State = EntityState.Modified;
                //db.SaveChanges();
                return RedirectToAction("Index");
            }
           // ViewBag.id_tarjeta_afiliacion = new SelectList(db.t_cuenta, "id_cuenta", "numero_cuenta", t_tarjeta_afiliacion.Codigo);
            return View(t_tarjeta_afiliacion);
        }

        // GET: TarjetaAfiliacion/Delete/5
        //public ActionResult Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    t_tarjeta_afiliacion t_tarjeta_afiliacion = db.t_tarjeta_afiliacion.Find(id);
        //    if (t_tarjeta_afiliacion == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(t_tarjeta_afiliacion);
        //}

        // POST: TarjetaAfiliacion/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    t_tarjeta_afiliacion t_tarjeta_afiliacion = db.t_tarjeta_afiliacion.Find(id);
        //    db.t_tarjeta_afiliacion.Remove(t_tarjeta_afiliacion);
        //    db.SaveChanges();
        //    return RedirectToAction("Index");
        //}

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
