using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Fidelizacion.Services;
using Fidelizacion.Models;

namespace Fidelizacion.Controllers
{
    public class TransaccionProductoCanjeController : Controller
    {

        private ITransaccionProductoCanjeService transaccionProductoCanjeService = new TransaccionProductoCanjeService();

        private ITiendaService tiendaService = new TiendaService();

        public ActionResult Index()
        {

            // Set Tienda Hardcode
            Session["TIENDA_ACTUAL"] = 1;   // Plaza Vea Risso

            return View();
        }

        public ActionResult GetCuenta()
        {
            string numdocumento = Request.Params["afiliado"];
            System.Diagnostics.Debug.WriteLine("Num Documento Origen: " + numdocumento);

            List<t_cuenta> cuentas = transaccionProductoCanjeService.getCuenta(numdocumento);
            ViewBag.cuentas = cuentas;

            ViewBag.ncuentas = cuentas.Count;

            foreach (t_cuenta cuenta in cuentas)
            {
                ViewBag.puntos = cuenta.puntos;
                ViewBag.tipo_cuenta = cuenta.fk_tipo_cuenta;
                Session["CUENTA_ACTUAL"] = cuenta.pk_cuenta;
            }

            return View();
        }

        public ActionResult GetProductos()
        {
            int idtienda = (int)Session["TIENDA_ACTUAL"];
            t_tienda tienda = tiendaService.get(idtienda);
            ViewBag.tienda = tienda;

            List<t_categoria_producto_canje> categorias = transaccionProductoCanjeService.listCategorias();
            ViewBag.categorias = categorias;
            ViewBag.ncategorias = categorias.Count;

            List<t_producto_canje> productos = transaccionProductoCanjeService.listProductosCanje();
            ViewBag.productos = productos;
            ViewBag.nproductos = productos.Count;

            return View();
        }

        public ActionResult GetModalidades()
        {
            int idproducto = int.Parse(Request.Params["idproducto"]);
            System.Diagnostics.Debug.WriteLine("ID Producto: " + idproducto);

            int idtienda = (int)Session["TIENDA_ACTUAL"];
            t_tienda tienda = tiendaService.get(idtienda);
            ViewBag.tienda = tienda;

            t_producto_canje producto = transaccionProductoCanjeService.getProductoCanje(idproducto);
            ViewBag.producto = producto;
            ViewBag.nmodalidades = producto.t_modalidad_canje.Count;

            return View();
        }
    }
}