using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using Fidelizacion.Models;
using System.Data.Entity.Validation;

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
           
            ViewBag.fecha_alta = DateTime.Now;
            return View();
        }

        // POST: FichaAfiliacion/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "pk_ficha_afiliacion,apellido_paterno,apellido_materno,nombre,numero_documento,sexo,correo,numero_telefono,fecha_nacimiento,fk_tipo_documento,numero_cuenta,puntos,tipo_cuenta")] FichaAfiliacionViewModel t_ficha_afiliacion)
        {
            if (ModelState.IsValid)
            {
                

            try
            {
                //t_ficha_afiliacion t_ficha_afiliacion2 = new t_ficha_afiliacion() {
                    


                //    apellido_materno = t_ficha_afiliacion.apellido_paterno,
                //    apellido_paterno = t_ficha_afiliacion.apellido_paterno,
                //    nombre = t_ficha_afiliacion.nombre,
                //    numero_documento = t_ficha_afiliacion.numero_documento,
                //    sexo = t_ficha_afiliacion.sexo,
                //    correo = t_ficha_afiliacion.correo,
                //    numero_telefono = t_ficha_afiliacion.numero_telefono,
                //    estado_afiliado = "A"

                //    //apellido_materno = "Del Carpio",
                //    //apellido_paterno = "Geldres",
                //    //nombre = "Fabian",
                //    //numero_documento = "123456",
                //    //sexo = "M",
                //    //correo = "fbngeldres@gmail.com",
                //    //numero_telefono = "123456",
                //    //estado_afiliado = "A"

                //};

                    //t_cuenta t_cuenta2 = new t_cuenta()
                    //{
                    //    numero_cuenta = t_ficha_afiliacion.numero_cuenta,
                    //    fecha_alta = DateTime.Now,
                    //    puntos = t_ficha_afiliacion.puntos,
                    //    estado_cuenta = "A",
                    //    //t_ficha_afiliacion = t_ficha_afiliacion2,
                    //    fk_tipo_cuenta = t_ficha_afiliacion.tipo_cuenta

                    //};

                    t_tarjeta_afiliacion t_tajeta_afiliacio2n = db.t_tarjeta_afiliacion.Find(1);


                    t_tarjera_afiliacion_cuenta t_tarjeta = new t_tarjera_afiliacion_cuenta()
                    {

                        t_tarjeta_afiliacion = t_tajeta_afiliacio2n,
                        //fk_cuenta = t_cuenta2.pk_cuenta,
                        t_cuenta = new t_cuenta() {
                            numero_cuenta = t_ficha_afiliacion.numero_cuenta,
                            fecha_alta = DateTime.Now,
                            puntos = t_ficha_afiliacion.puntos,
                            estado_cuenta = "A",
                            t_ficha_afiliacion = new t_ficha_afiliacion() {
                                apellido_materno = t_ficha_afiliacion.apellido_paterno,
                                apellido_paterno = t_ficha_afiliacion.apellido_paterno,
                                nombre = t_ficha_afiliacion.nombre,
                                numero_documento = t_ficha_afiliacion.numero_documento,
                                sexo = t_ficha_afiliacion.sexo,
                                correo = t_ficha_afiliacion.correo,
                                numero_telefono = t_ficha_afiliacion.numero_telefono,
                                estado_afiliado = "A"

                            },
                            fk_tipo_cuenta = t_ficha_afiliacion.tipo_cuenta
                        },
                        fecha_afiliacion = DateTime.Now,
                        estado = "A"


                    };

                    //t_cuenta2.t_tarjera_afiliacion_cuenta.Add(t_tarjeta);
                    //t_ficha_afiliacion2.t_cuenta.Add(t_cuenta2);
                                    db.t_tarjera_afiliacion_cuenta.Add(t_tarjeta);
                    
               
                db.SaveChanges();


                  

                    //db.t_cuenta.Add(t_cuenta2);
                    //db.SaveChanges();


                  
                    //System.Diagnostics.Debug.WriteLine(t_cuenta2.numero_cuenta);
                    

                    //db.t_tarjera_afiliacion_cuenta.Add(t_tarjeta);
                    //db.SaveChanges();
                }
            catch (DbEntityValidationException e)
            {
                foreach (var eve in e.EntityValidationErrors)
                {
                    System.Diagnostics.Debug.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                        eve.Entry.Entity.GetType().Name, eve.Entry.State);
                    foreach (var ve in eve.ValidationErrors)
                    {
                        System.Diagnostics.Debug.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                            ve.PropertyName, ve.ErrorMessage);
                    }
                }
            }
                //db.t_ficha_afiliacion.Add(t_ficha_afiliacion);
                //db.SaveChanges();
                return View(t_ficha_afiliacion);
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
