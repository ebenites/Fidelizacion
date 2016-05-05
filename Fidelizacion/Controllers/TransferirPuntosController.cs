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
            
            return View();
        }
    }
}