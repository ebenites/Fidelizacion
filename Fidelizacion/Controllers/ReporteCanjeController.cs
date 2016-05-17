using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Fidelizacion.Services;
using Fidelizacion.Models;

namespace Fidelizacion.Controllers
{
    public class ReporteCanjeController : Controller
    {
        private IReporteCanjeService reporteCanjeService = new ReporteCanjeService();

        private ITransaccionProductoCanjeService transaccionProductoCanjeService = new TransaccionProductoCanjeService();

        private ITiendaService tiendaService = new TiendaService();

        public ActionResult Index()
        {
            List<t_tienda> tiendas = tiendaService.list();
            ViewBag.tiendas = tiendas;

            List<int> anios = reporteCanjeService.listAnios();
            ViewBag.anios = anios;

            List<t_categoria_producto_canje> categorias = transaccionProductoCanjeService.listCategorias();
            ViewBag.categorias = categorias;

            return View();
        }

        public ActionResult ReporteProductos()
        {
            int idtienda = int.Parse(Request.Params["idtienda"]);
            int anio = int.Parse(Request.Params["anio"]);
            int trimestre = int.Parse(Request.Params["trimestre"]);
            int idcategoria = int.Parse(Request.Params["idcategoria"]);

            System.Diagnostics.Debug.WriteLine("idtienda:" + idtienda);
            System.Diagnostics.Debug.WriteLine("anio:" + anio);
            System.Diagnostics.Debug.WriteLine("trimestre:" + trimestre);
            System.Diagnostics.Debug.WriteLine("idcategoria:" + idcategoria);

            List<ReporteCanje> reporte = reporteCanjeService.reporteProductoCanje(idtienda, anio, trimestre, idcategoria);
            ViewBag.reporte = reporte;
            
            return View();
        }

        public ActionResult ReporteCategorias()
        {
            int idtienda = int.Parse(Request.Params["idtienda"]);
            int anio = int.Parse(Request.Params["anio"]);
            int trimestre = int.Parse(Request.Params["trimestre"]);
            int idcategoria = int.Parse(Request.Params["idcategoria"]);

            System.Diagnostics.Debug.WriteLine("idtienda:" + idtienda);
            System.Diagnostics.Debug.WriteLine("anio:" + anio);
            System.Diagnostics.Debug.WriteLine("trimestre:" + trimestre);
            System.Diagnostics.Debug.WriteLine("idcategoria:" + idcategoria);

            List<ReporteCanje> reporte = reporteCanjeService.reporteCategoriaCanje(idtienda, anio, trimestre, idcategoria);
            ViewBag.reporte = reporte;

            return View();
        }
    }
}