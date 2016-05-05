using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Fidelizacion.Services;
using Fidelizacion.Models;

namespace Fidelizacion.Controllers
{
    public class TransferirPuntosController : Controller
    {

        private ITransferirPuntosService transferirPuntosService = new TransferirPuntosService();


        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetCuentaOrigen()
        {

            string numdocumento = Request.Params["origen"];
            System.Diagnostics.Debug.WriteLine("Num Documento Origen: " + numdocumento);

            List<t_cuenta> cuentas = transferirPuntosService.getCuentaOrigen(numdocumento);
            ViewBag.cuentas = cuentas;

            ViewBag.ncuentas = cuentas.Count;

            foreach (t_cuenta cuenta in cuentas)
            {
                ViewBag.puntos = cuenta.puntos;
                //ViewBag.tipo_cuenta = cuenta.fk_tipo_cuenta;
            }

            return View();
        }

        public ActionResult GetCuentaDestino()
        {

            string numdocumento = Request.Params["destino"];
            System.Diagnostics.Debug.WriteLine("Num Documento Destino: " + numdocumento);

            List<t_cuenta> cuentas = transferirPuntosService.getCuentaDestino(numdocumento);
            ViewBag.cuentas = cuentas;

            ViewBag.ncuentas = cuentas.Count;
            
            return View();
        }

        public ActionResult ViewTransferencia()
        {
            int origeid = int.Parse(Request.Params["origeid"]);
            int destinoid = int.Parse(Request.Params["destinoid"]);

            ViewBag.origen = transferirPuntosService.getCuenta(origeid);

            ViewBag.destino = transferirPuntosService.getCuenta(destinoid);

            return View();
        }

        public ActionResult Grabar()
        {

            int origeid = int.Parse(Request.Params["origeid"]);
            int destinoid = int.Parse(Request.Params["destinoid"]);
            int puntos = int.Parse(Request.Params["puntos"]);
            string justificacion = Request.Params["justificacion"];

            System.Diagnostics.Debug.WriteLine(origeid);
            System.Diagnostics.Debug.WriteLine(destinoid);
            System.Diagnostics.Debug.WriteLine(puntos);
            System.Diagnostics.Debug.WriteLine(justificacion);

            transferirPuntosService.grabar(origeid, destinoid, puntos, justificacion);

            System.Diagnostics.Debug.WriteLine("Registro OK");

            var data = new { Type = "success", Message = "Registro grabado satisfactoriamente" };

            return Json(data);
        }

    }
}