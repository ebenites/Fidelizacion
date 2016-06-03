using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using Fidelizacion.Models;
using System.Data.Entity.Validation;
using Fidelizacion.Services;
using System.Diagnostics;

namespace Fidelizacion.Controllers
{
    public class FichaAfiliacionController : Controller
    {
        private plazaveaEntities db = new plazaveaEntities();

        private ITarjetaAfiliacionService tarjetaAfiliacionService = new TarjetaAfiliacionService();

        public ActionResult Buscar(String numeroCuenta)
        {


                   var t_afiliado = db.t_ficha_afiliacion .Where(o => o.numero_documento.Contains(numeroCuenta)).ToList();

            ViewBag.numeroCuenta = numeroCuenta;

            //var t_afiliado = db.t_ficha_afiliacion.Include(t => t.t_tipo_documento);

            List<FichaAfiliacionViewModel> fichaAfiliacion = new List<FichaAfiliacionViewModel>();

            FichaAfiliacionViewModel ficha = null;
            foreach (var item in t_afiliado)
            {
                //t_ficha_afiliacion fichaafiliacion = db.t_ficha_afiliacion.Find(item.fk_ficha_afiliacion); 
                t_cuenta cuenta = db.t_cuenta.Where(o => o.fk_ficha_afiliacion == item.id_ficha_afiliacion).SingleOrDefault(); 
                if(cuenta != null)
                {
                    ficha = new FichaAfiliacionViewModel()
                    {
                        numero_documento = item.numero_documento,
                        nombre = item.nombre + " " + item.apellidos,
                        estado_afiliado = item.estado_afiliado,

                        tipo_cuenta = (int)cuenta.fk_tipo_cuenta,
                        tipo_afiliado = cuenta.t_tipo_cuenta.tipo_cuenta,
                        id_ficha_afiliacion = item.id_ficha_afiliacion



                    };
                    fichaAfiliacion.Add(ficha);
                }
                
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
            t_ficha_afiliacion fichaAfiliacion = db.t_ficha_afiliacion.Find(id);
            if (fichaAfiliacion == null)
            {
                return HttpNotFound();
            }

            t_cuenta cuenta = db.t_cuenta.Where(o => o.fk_ficha_afiliacion == fichaAfiliacion.id_ficha_afiliacion).SingleOrDefault();  
            FichaAfiliacionViewModel ficha = new FichaAfiliacionViewModel()
            {
                nombre=fichaAfiliacion.nombre,
                numero_documento =fichaAfiliacion .numero_documento ,
                fk_tipo_documento = (int)fichaAfiliacion.fk_tipo_documento ,
                apellidos = fichaAfiliacion.apellidos ,
                fecha_nacimiento = (DateTime)fichaAfiliacion.fecha_nacimiento ,
                sexo = fichaAfiliacion.sexo ,
                estado_civil = "Soltero",
                correo = fichaAfiliacion.correo ,
                numero_telefono = fichaAfiliacion.numero_telefono ,
                celular = fichaAfiliacion.numero_telefono ,
                direccion = fichaAfiliacion.numero_telefono ,
                provincia = "Lima",
                distrito = "Lima",
                //estado_afiliado = fichaAfiliacion.estado_afiliado ,
                fecha_alta = (DateTime)fichaAfiliacion.fecha_alta ,
                
            };

            if (fichaAfiliacion.estado_afiliado.Equals("I"))
            {
                ficha.estado_afiliado = "Inactivo";
            }
            else {
                ficha.estado_afiliado = "Activo";
            }

            if (cuenta != null) {
                ficha.numero_cuenta = cuenta.numero_cuenta;
                ficha.puntos = (int)cuenta.puntos;
                ficha.tipo_cuenta = (int)cuenta.fk_tipo_cuenta;

                if (cuenta.estado_cuenta.Equals("I")) {
                    ficha.estado = "Inactivo";
                }
                else {
                    ficha.estado = "Activo";
                }

                t_tarjera_afiliacion_cuenta tarjetaAfiliacionCuenta = db.t_tarjera_afiliacion_cuenta.Where(o => o.fk_cuenta == cuenta.id_cuenta && o.estado == "A" && o.t_tarjeta_afiliacion.estado == "A").SingleOrDefault();

                if (tarjetaAfiliacionCuenta!= null) {
                    t_tarjeta_afiliacion tarjeta = tarjetaAfiliacionCuenta.t_tarjeta_afiliacion;
                    if (tarjeta!= null) {
                        ficha.numero_tarjeta = tarjeta.numero_tarjeta;
                        ficha.fecha_asignacion =  (DateTime)tarjetaAfiliacionCuenta.fecha_afiliacion;

                        if (tarjeta.estado.Equals("I"))
                        {
                            ficha.estado_tarjeta = "Inactivo";
                        }
                        else {
                            ficha.estado_tarjeta = "Activo";
                        }
                        ficha.motivo = "prueba";
                    } 
                }


                if (cuenta.fk_cuenta != null) {
                    t_cuenta cuentaTitular = db.t_cuenta.Find(cuenta.fk_cuenta);
                    if (cuentaTitular!= null)
                    {
                        ficha.cuenta_titular = cuentaTitular.numero_cuenta;
                    } 
                }

                
                List<t_cuenta> asociados = db.t_cuenta.Where(o => o.fk_cuenta == cuenta.id_cuenta && o.estado_cuenta == "A").ToList();
                List<DesasociarFichaAfiliacionViewModel> lista = new List<DesasociarFichaAfiliacionViewModel>();
                foreach (t_cuenta item in asociados)
                {
                    t_tarjera_afiliacion_cuenta tarjetaAsociadoCuenta = db.t_tarjera_afiliacion_cuenta.Where(o => o.fk_cuenta == item.id_cuenta).SingleOrDefault();

                    t_tarjeta_afiliacion tarjetaAsociado = null;

                    if (tarjetaAsociadoCuenta != null)
                    {
                        tarjetaAsociado = tarjetaAsociadoCuenta.t_tarjeta_afiliacion;
                    }
                    String numeroTarjeta = "<NINGUNO>";

                    if (tarjetaAsociado != null)
                    {
                        numeroTarjeta = tarjetaAsociado.numero_tarjeta;
                    }
                    DesasociarFichaAfiliacionViewModel asociado = new DesasociarFichaAfiliacionViewModel()
                    {
                        numero_documento = item.t_ficha_afiliacion.numero_documento,
                        numero_cuenta = item.numero_cuenta,
                        tipo_cuenta = item.t_tipo_cuenta.tipo_cuenta,
                        id_numero_cuenta = item.id_cuenta,
                        nombre = item.t_ficha_afiliacion.nombre + " " + item.t_ficha_afiliacion.apellidos,
                        numero_tarjeta = numeroTarjeta,
                        estado_afiliado = item.t_ficha_afiliacion.estado_afiliado

                    };
                    lista.Add(asociado);
                }
                ficha.Asociados = lista;

            }
            
            return View(ficha);
        }

        // GET: FichaAfiliacion/Create
        public ActionResult Create()
        {
            //ViewBag.fk_tipo_documento = new SelectList(db.t_tipo_documento, "id_tipo_documento", "tipo_documento");
           
            ViewBag.fecha_alta = DateTime.Now;
            return View();
        }

        public ActionResult ValidarCuentaAsociado(int? id_cuenta)
        {
            RespuestaViewModel respuesta = new RespuestaViewModel()
            {
                operacion = false,
                mensaje = "No se proceso la solicitud, Intentelo más tarde."
            };
            try
            {

                t_cuenta t_cuenta = db.t_cuenta.Find(id_cuenta);
                if (t_cuenta != null)
                {

                    t_cuenta cuentaJson = new t_cuenta()
                    {
                        id_cuenta = t_cuenta.id_cuenta,
                        numero_cuenta = t_cuenta.numero_cuenta
                    };
                    if (t_cuenta.t_ficha_afiliacion.estado_afiliado.Equals("I"))
                    {
                        if (t_cuenta.puntos > 0)
                        {
                            respuesta.operacion = false;
                            respuesta.mensaje = "La cuenta con número " + t_cuenta.numero_cuenta + " posee " + t_cuenta.puntos + " puntos";
                        }
                        else {
                            respuesta.operacion = true;
                            respuesta.objeto = cuentaJson;
                        }
                        
                    }
                    else {
                        respuesta.operacion = false;
                        respuesta.objeto = cuentaJson;
                        respuesta.mensaje = "La ficha afiliacion de " + t_cuenta.t_ficha_afiliacion.nombre + " " + t_cuenta.t_ficha_afiliacion.apellidos + " se encuentra activa.";
                    }
                }
            }
            catch (
         Exception e)
            {
                respuesta.operacion = false;
                respuesta.mensaje = e.Message;
            }
            return Json(respuesta, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GrabarDesafiliacion(String desasociados) {
            RespuestaViewModel respuesta = new RespuestaViewModel()
            {
                operacion = false,
                mensaje = "No se proceso la solicitud, Intentelo más tarde."
            };

            try
            {
                String[] listaDesasociados = null;

                if (desasociados != null && !desasociados.Trim().Equals(""))
                {
                    listaDesasociados = desasociados.Split(',');
                }
               
                if (listaDesasociados != null && listaDesasociados.Length > 0)
                {
                    foreach (var item in listaDesasociados)
                    {

                        t_cuenta cuenta = db.t_cuenta.Find(Int32.Parse(item));

                        if (cuenta != null)
                        {

                            cuenta.estado_cuenta = "I";
                            db.Entry(cuenta).State = EntityState.Modified;

                            db.SaveChanges();

                           
                        }
                        

                    }
                    respuesta.operacion = true;
                }
                else {
                    respuesta.operacion = false;
                    respuesta.mensaje = "No se encontró los registros a desasociar.";
                }
            }
            catch (Exception e) {

                respuesta.operacion = false;
                respuesta.mensaje = e.Message;
            }

          
           
            return Json(respuesta, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Desasociar(int id) {

            t_ficha_afiliacion fichaAfiliacion = db.t_ficha_afiliacion.Find(id);

            t_cuenta cuenta = db.t_cuenta.Where(o => o.fk_ficha_afiliacion == fichaAfiliacion.id_ficha_afiliacion).Single();
            t_tarjera_afiliacion_cuenta tarjeta_cuenta =  db.t_tarjera_afiliacion_cuenta.Where(o => o.fk_cuenta == cuenta.id_cuenta && o.estado.Equals("A")).SingleOrDefault();

            String numero_tarjeta = "<NINGUNO>";

            if(tarjeta_cuenta != null)
            {
                numero_tarjeta = tarjeta_cuenta.t_tarjeta_afiliacion.numero_tarjeta;
            }

            DesasociarFichaAfiliacionViewModel desasociarFicha = new DesasociarFichaAfiliacionViewModel() {
                numero_documento = fichaAfiliacion.numero_documento,
                numero_cuenta = cuenta.numero_cuenta ,
                nombre = fichaAfiliacion.nombre + " " +fichaAfiliacion.apellidos,
                sexo = fichaAfiliacion.sexo ,
                estado_afiliado = fichaAfiliacion.estado_afiliado ,
                numero_tarjeta = numero_tarjeta,
                puntos = (int)cuenta.puntos ,
                fecha_alta = (DateTime)fichaAfiliacion.fecha_alta  ,
                tipo_documento = fichaAfiliacion.t_tipo_documento.tipo_documento   
                 

            };

            List<t_cuenta> asociados = db.t_cuenta.Where(o => o.fk_cuenta == cuenta.id_cuenta && o.estado_cuenta == "A").ToList();
            List<DesasociarFichaAfiliacionViewModel> lista = new List<DesasociarFichaAfiliacionViewModel>();
            foreach (t_cuenta item in asociados) {
                t_tarjera_afiliacion_cuenta tarjetaAsociadoCuenta = db.t_tarjera_afiliacion_cuenta.Where(o => o.fk_cuenta == item.id_cuenta).SingleOrDefault();

                t_tarjeta_afiliacion tarjetaAsociado = null;

                if (tarjetaAsociadoCuenta != null ) {
                    tarjetaAsociado = tarjetaAsociadoCuenta.t_tarjeta_afiliacion;
                }
                String numeroTarjeta = "<NINGUNO>";

                if (tarjetaAsociado!=null)
                {
                    numeroTarjeta = tarjetaAsociado.numero_tarjeta;
                }
                DesasociarFichaAfiliacionViewModel asociado = new DesasociarFichaAfiliacionViewModel() {
                    numero_documento = item.t_ficha_afiliacion.numero_documento ,
                    numero_cuenta = item.numero_cuenta ,
                    tipo_cuenta = item.t_tipo_cuenta.tipo_cuenta ,
                    id_numero_cuenta = item.id_cuenta ,
                    nombre = item.t_ficha_afiliacion.nombre + " " + item.t_ficha_afiliacion.apellidos    ,
                    numero_tarjeta = numeroTarjeta,
                    estado_afiliado = item.t_ficha_afiliacion.estado_afiliado

                };
                lista.Add(asociado);
            }
            desasociarFicha.Asociados = lista;
            ViewBag.fecha_alta = DateTime.Now;
            return View(desasociarFicha);
        }


        [HttpGet]
        public ActionResult GetCuentaTitular(String cuenta_titular) {

            //var obj = "{mensaje:\" no te lo puedo creer\"}"+ cuenta_titular;
            String mensaje = "";
            Boolean exitoOperacion = false;
            //Object cuenta = null;
            t_cuenta cuenta = null;

            try
            {

          
            if (cuenta_titular != null && !cuenta_titular.Trim().Equals(""))
            {


                IQueryable<t_cuenta> cuentaTitular = db.t_cuenta.Where(o => o.numero_cuenta == cuenta_titular);
                    Debug.WriteLine(cuentaTitular.Count());

                if (cuentaTitular != null && cuentaTitular.Count() > 0)
                {

                    if (cuentaTitular.Count() > 1)
                    {
                        mensaje = "Se encontro más de un registro con el número de cuenta " + cuenta_titular;
                        exitoOperacion = false;
                    }
                    else if (cuentaTitular.Count() == 1)
                    {
                        
                            var cuentaLista = cuentaTitular.ToList().ElementAt(0);

                            if(cuentaLista.fk_tipo_cuenta != 1)
                            {
                                mensaje = "El número de cuenta " + cuenta_titular + " no pertenece a una cuenta titular.";
                                exitoOperacion = false;
                            }
                            else
                            {

                                if(cuentaLista.t_cuenta1.Count() >= 5)
                                {
                                    mensaje = "El número de cuenta " + cuenta_titular + " ya cuenta con una cantidad límite de 5 asociados.";
                                    exitoOperacion = false;
                                }
                                else
                                {
                                    exitoOperacion = true;
                                    cuenta = new t_cuenta()
                                    {

                                        numero_cuenta = cuentaLista.numero_cuenta,
                                        id_cuenta = cuentaLista.id_cuenta
                                    };
                                }
                                
                            }
                            
                    }
                }
                else {
                    mensaje = "No se encontro registros con el número de cuenta  " + cuenta_titular;
                    exitoOperacion = false;
                }


            }
            else {
                mensaje = "No se ingreso número de cuenta  ";
                exitoOperacion = false;
            }
            }
            catch (Exception e)
            {
                mensaje = e.Message;
                exitoOperacion = false;
            }
            RespuestaViewModel respuesta = new RespuestaViewModel()
            {
                mensaje = mensaje ,
                operacion = exitoOperacion,
                objeto = cuenta
            };

            return Json(respuesta, JsonRequestBehavior.AllowGet);
        }



        [HttpGet]
        public ActionResult GetTarjetaAfiliacion(String numero_tarjeta)
        {

            var obj = "{mensaje:\" no te lo puedo creer\"}" + numero_tarjeta;
            String mensaje = "sin setear " + numero_tarjeta;
            Boolean exitoOperacion = false;
            Boolean mostrarLink = false;
            //Object cuenta = null;
            t_tarjeta_afiliacion cuenta = null;

            try
            {


                if (numero_tarjeta != null && !numero_tarjeta.Trim().Equals(""))
                {


                    IQueryable<t_tarjeta_afiliacion> listaTarjetaAfiliacion = db.t_tarjeta_afiliacion.Where(o => o.numero_tarjeta == numero_tarjeta);


                    if (listaTarjetaAfiliacion != null && listaTarjetaAfiliacion.Count() > 0)
                    {

                        if (listaTarjetaAfiliacion.Count() > 1)
                        {
                            mensaje = "Se encontro más de un registro con el número de cuenta " + numero_tarjeta;
                            exitoOperacion = false;
                            
                        }
                        else if (listaTarjetaAfiliacion.Count() == 1)
                        {
                            var cuentaLista = listaTarjetaAfiliacion.ToList().ElementAt(0);

                            if(cuentaLista.t_tarjera_afiliacion_cuenta.Count() != 0)
                            {
                                mensaje = "Este número de tarjeta ya se encuentra asignada a la cuenta " + cuentaLista.t_tarjera_afiliacion_cuenta.ToList().ElementAt(0).t_cuenta.numero_cuenta;
                                exitoOperacion = false;
                            }else
                            {
                                exitoOperacion = true;
                                cuenta = new t_tarjeta_afiliacion()
                                {

                                    numero_tarjeta = cuentaLista.numero_tarjeta,
                                    id_tarjeta_afiliacion = cuentaLista.id_tarjeta_afiliacion
                                };
                            }
                            
                        }
                    }
                    else {
                        mensaje = "No se encontro registros con el número de cuenta  " + numero_tarjeta;
                        exitoOperacion = false;
                        mostrarLink = true;
                    }


                }
                else {
                    mensaje = "No se ingreso número de cuenta  ";
                    exitoOperacion = false;
                }
            }
            catch (Exception e)
            {
                mensaje = e.Message;
                exitoOperacion = false;

                Debug.WriteLine(e.Message);
                Debug.WriteLine(e.StackTrace);
            }
            RespuestaViewModel respuesta = new RespuestaViewModel()
            {
                mensaje = mensaje,
                operacion = exitoOperacion,
                objeto = cuenta,
                mostrarLink = mostrarLink
            };

            return Json(respuesta, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetTarjetas(String numero)
        {
            List<t_tarjeta_afiliacion> tarjetas = null;

            if (numero != null)
            {
                tarjetas = db.t_tarjeta_afiliacion.Where(o => o.numero_tarjeta.Contains(numero) && o.estado == "A" && o.fecha_vencimiento > DateTime.Now && o.t_tarjera_afiliacion_cuenta.Count() == 0).ToList();
            }
            else
            {
                tarjetas = db.t_tarjeta_afiliacion.Where(o => o.estado == "A" && o.fecha_vencimiento > DateTime.Now && o.t_tarjera_afiliacion_cuenta.Count() == 0).ToList();
            }
            
            return View(tarjetas);
        }

        [HttpPost]
        public ActionResult AddTarjeta(String numeroTarjeta)
        {

            if (numeroTarjeta == null || numeroTarjeta == "")
            {
                return Json(new { Type = "error", Message = "Error en la validación de los campos." });
            }

            var lista = tarjetaAfiliacionService.Buscar(numeroTarjeta, "-1");
            if (lista != null && lista.Count() > 0)
            {
                return Json(new { Type = "error", Message = "El numero de cuenta " + numeroTarjeta + " se encuentra registrado." });
            }

            TarjetaAfiliacionViewModels tarjeta = new TarjetaAfiliacionViewModels();
            tarjeta.numeroTarjeta = numeroTarjeta;
            tarjeta.fechaEmision = DateTime.Now;
            tarjeta.fechaVencimiento = DateTime.Now.AddYears(5);

            tarjetaAfiliacionService.insertar(tarjeta);
            
            var data = new { Type = "success", Message = "Se ha concluído la grabación de la tarjeta." };
            return Json(data);
        }


        public ActionResult GetTitulares(string dni)
        {
            //string dni = Request.Params["dni"];

            List<t_cuenta> titulares = null;

            if (dni != null)
            {
                titulares = db.t_cuenta.Where(o => o.estado_cuenta == "A" && o.fk_tipo_cuenta == 1 && o.t_ficha_afiliacion.numero_documento == dni).ToList();
            }
            else
            {
                titulares = db.t_cuenta.Where(o => o.estado_cuenta == "A" && o.fk_tipo_cuenta == 1).ToList();
            }
            
            return View(titulares);
        }

        // GET: FichaAfiliacion/Details/5
        public ActionResult GetContrato(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            
            ViewBag.contrato = db.t_contrato.Find(id);

            return View();
        }


        // POST: FichaAfiliacion/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "apellidos,nombre,numero_documento,sexo,correo,numero_telefono,estado_civil,fecha_nacimiento,fk_tipo_documento,numero_cuenta,puntos,tipo_cuenta,fk_tarjeta_afiliacion,fk_cuenta_titular,numero_tarjeta,celular,direccion,departamento,provincia,distrito")] FichaAfiliacionViewModel fichaAfiliacionView)
        {
            if (ModelState.IsValid)
            {
                

            try
            {
                    // Validar que no exista
                    t_ficha_afiliacion afiliado = db.t_ficha_afiliacion.Where(o => o.numero_documento == fichaAfiliacionView.numero_documento).SingleOrDefault();

                    if (afiliado != null)
                    {
                        ModelState.AddModelError("ERROR_MESSAGE", "El número de documento " + afiliado.numero_documento + " ya se encuentra regiatrado para " + afiliado.nombre + " " + afiliado.apellidos + ".");
                        return View(fichaAfiliacionView);
                    }

                    // Validar otras cosas
                    t_tarjeta_afiliacion tarjetaAfiliacion = db.t_tarjeta_afiliacion.Find(fichaAfiliacionView.fk_tarjeta_afiliacion);

                    if (tarjetaAfiliacion!= null ) {
                       
                        t_cuenta cuentaAfiliado = null;
                        Debug.WriteLine("tipo:" + fichaAfiliacionView.tipo_cuenta);
                        Debug.WriteLine("fk_cuenta_titular:" + fichaAfiliacionView.fk_cuenta_titular);
                        if (fichaAfiliacionView.tipo_cuenta == 2) {
                           
                            cuentaAfiliado = db.t_cuenta.Where(o => o.id_cuenta == fichaAfiliacionView.fk_cuenta_titular).Single();
                            Debug.WriteLine("cuentaAfiliado:" + cuentaAfiliado);
                            if (cuentaAfiliado != null)
                            {
                                if (cuentaAfiliado.t_tipo_cuenta.id_tipo_cuenta.CompareTo(2)==0) {
                                    ModelState.AddModelError("ERROR_MESSAGE", "El número de tarjeta " + fichaAfiliacionView.numero_tarjeta + " es Asociado.");
                                    return View(fichaAfiliacionView);
                                }
                                
                            }
                            else {
                                ModelState.AddModelError("ERROR_MESSAGE", "No se encontro el titular con la cuenta " + fichaAfiliacionView.cuenta_titular + ".");
                                return View(fichaAfiliacionView);
                            }
                        }

                        int? fk_cuenta_afiliado = null;
                        if (cuentaAfiliado!= null) {
                            fk_cuenta_afiliado = cuentaAfiliado.id_cuenta;

                            // Subir puntos a la cuenta titular
                            cuentaAfiliado.puntos += 10;
                            db.SaveChanges();
                        }

                        // Registrar cuenta

                        Debug.WriteLine("cuenta:" + fk_cuenta_afiliado);

                        t_tarjera_afiliacion_cuenta t_tarjeta = new t_tarjera_afiliacion_cuenta()  {

                            t_tarjeta_afiliacion = tarjetaAfiliacion,
                        
                            t_cuenta = new t_cuenta() {
                                numero_cuenta = fichaAfiliacionView.numero_cuenta,
                                fecha_alta = DateTime.Now,
                                puntos = fichaAfiliacionView.puntos,
                                estado_cuenta = "A",
                                t_ficha_afiliacion = new t_ficha_afiliacion() {
                                    apellidos = fichaAfiliacionView.apellidos,
                                    nombre = fichaAfiliacionView.nombre,
                                    numero_documento = fichaAfiliacionView.numero_documento,
                                    sexo = fichaAfiliacionView.sexo,
                                    correo = fichaAfiliacionView.correo,
                                    numero_telefono = fichaAfiliacionView.numero_telefono,
                                    estado_civil = fichaAfiliacionView.estado_civil,

                                    direccion = fichaAfiliacionView.direccion,
                                    celular = fichaAfiliacionView.celular,
                                    distrito = fichaAfiliacionView.distrito,
                                    provincia= fichaAfiliacionView.provincia,
                                    departamento = fichaAfiliacionView.departamento,

                                    fecha_alta = DateTime.Now ,
                                    fecha_nacimiento = fichaAfiliacionView.fecha_nacimiento ,
                                    fk_tipo_documento = fichaAfiliacionView .fk_tipo_documento ,  
                                    estado_afiliado = "A"

                                },
                                fk_tipo_cuenta = fichaAfiliacionView.tipo_cuenta,
                                fk_cuenta = fk_cuenta_afiliado
                            },
                            fecha_afiliacion = DateTime.Now,
                            estado = "A"


                        };

                        db.t_tarjera_afiliacion_cuenta.Add(t_tarjeta);
                    
                        db.SaveChanges();


                        // Insert contrato

                        t_contrato contrato = new t_contrato();
                        contrato.fecha_contrato = DateTime.Now;
                        contrato.fecha_firma = DateTime.Now;
                        contrato.condiciones = "XYZ";
                        contrato.fk_cuenta = t_tarjeta.t_cuenta.id_cuenta;

                        db.t_contrato.Add(contrato);

                        db.SaveChanges();

                        TempData["idContrato"] = contrato.id_contrato.ToString();
                        //TempData["idContrato"] = "5";

                        TempData["Message"] = "Se ha concluído la grabación de la Ficha de Afiliación.";
                        
                        return RedirectToAction("Details/"+ t_tarjeta.t_cuenta.t_ficha_afiliacion.id_ficha_afiliacion);

                    }
                    else
                    {

                        ModelState.AddModelError("ERROR_MESSAGE", "El numero de tarjeta " + fichaAfiliacionView.numero_tarjeta + " no fue encontrado.");
                        return View(fichaAfiliacionView);
                    }


                    //System.Diagnostics.Debug.WriteLine(t_cuenta2.numero_cuenta);


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
               
              
            }
            ViewBag.fk_tipo_documento = new SelectList(db.t_tipo_documento, "id_tipo_documento", "tipo_documento", fichaAfiliacionView.fk_tipo_documento);
            return View(fichaAfiliacionView);
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
            ViewBag.fk_tipo_documento = new SelectList(db.t_tipo_documento, "id_tipo_documento", "tipo_documento", t_ficha_afiliacion.fk_tipo_documento);
            return View(t_ficha_afiliacion);
        }

        // POST: FichaAfiliacion/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id_ficha_afiliacion,apellidos,nombre,numero_documento,sexo,correo,numero_telefono,fecha_alta,fecha_nacimiento,estado_afiliado,fecha_baja,fk_tipo_documento")] t_ficha_afiliacion t_ficha_afiliacion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(t_ficha_afiliacion).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.fk_tipo_documento = new SelectList(db.t_tipo_documento, "id_tipo_documento", "tipo_documento", t_ficha_afiliacion.fk_tipo_documento);
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
