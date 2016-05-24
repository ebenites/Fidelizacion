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
                Session["CUENTA_ACTUAL"] = cuenta.id_cuenta;
            }

            // Empty Carrito
            emptyCarrito();

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

            List<t_producto_canje> productos = null;

            if (Request.Params["idcategoria"] != null)
            {
                int idcategoria = int.Parse(Request.Params["idcategoria"]);
                string producto = Request.Params["producto"];
                ViewBag.idcategoria = idcategoria;
                ViewBag.producto = producto;

                productos = transaccionProductoCanjeService.listProductosCanjeByFiltro(idcategoria, producto);
            }
            else
            {
                productos = transaccionProductoCanjeService.listProductosCanje();
            }
            
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

        public ActionResult ListCarrito()
        {
            int idtienda = (int)Session["TIENDA_ACTUAL"];
            t_tienda tienda = tiendaService.get(idtienda);
            ViewBag.tienda = tienda;

            int idcuenta = int.Parse(Request.Params["idcuenta"]);
            t_cuenta cuenta = transaccionProductoCanjeService.getCuenta(idcuenta);
            ViewBag.cuenta = cuenta;

            Carrito carrito = getCarrito();
            ViewBag.carrito = carrito;

            return View();
        }

        public ActionResult AddCarrito()
        {
            int idcuenta = int.Parse(Request.Params["idcuenta"]);
            int idproducto = int.Parse(Request.Params["idproducto"]);
            int idmodalidad = int.Parse(Request.Params["idmodalidad"]);
            int cantidad = int.Parse(Request.Params["cantidad"]);

            System.Diagnostics.Debug.WriteLine("idproducto:" + idproducto);
            System.Diagnostics.Debug.WriteLine("idmodalidad:" + idmodalidad);
            System.Diagnostics.Debug.WriteLine("cantidad:" + cantidad);

            t_cuenta cuenta = transaccionProductoCanjeService.getCuenta(idcuenta);
            System.Diagnostics.Debug.WriteLine("cuenta:" + cuenta);
            t_modalidad_canje modalidad = transaccionProductoCanjeService.getModalidadCanje(idproducto, idmodalidad);
            System.Diagnostics.Debug.WriteLine("modalidad:" + modalidad);
            

            Carrito carrito = getCarrito();


            CarritoItem item = new CarritoItem(modalidad, cantidad);

            // Validaciones
            int puntosRequeridos = carrito.getTotalPuntos() + item.getSubTotalPuntos();
            int puntosDsiponibles = (int)cuenta.puntos;

            System.Diagnostics.Debug.WriteLine("puntosRequeridos:" + puntosRequeridos);
            System.Diagnostics.Debug.WriteLine("puntosDsiponibles:" + puntosDsiponibles);

            if ( puntosRequeridos > puntosDsiponibles)
            {
                return Json(new { Type = "error", Message = "No no cuenta con puntos suficientes para completar la operación." });
            }
            // 
            
            carrito.agregar(item);

            setCarrito(carrito);

            var data = new { Type = "success", Message = "OK" };
            return Json(data);
        }

        public ActionResult RemoveCarrito()
        {
            int idmodalidad = int.Parse(Request.Params["idmodalidad"]);
            System.Diagnostics.Debug.WriteLine("idmodalidad:" + idmodalidad);

            Carrito carrito = getCarrito();
            carrito.eliminar(idmodalidad);
            setCarrito(carrito);

            var data = new { Type = "success", Message = "OK" };
            return Json(data);
        }

        private Carrito getCarrito()
        {
            if(Session["CARRITO_ACTUAL"] == null)
            {
                Session["CARRITO_ACTUAL"] = new Carrito();
            }
            return (Carrito)Session["CARRITO_ACTUAL"];
        }

        private void setCarrito(Carrito carrito)
        {
            Session["CARRITO_ACTUAL"] = carrito;
        }

        private void emptyCarrito()
        {
            Session.Remove("CARRITO_ACTUAL");
        }

        public ActionResult Grabar()
        {
            int idtienda = (int)Session["TIENDA_ACTUAL"];
            t_tienda tienda = tiendaService.get(idtienda);
            ViewBag.tienda = tienda;

            int idcuenta = int.Parse(Request.Params["idcuenta"]);

            Carrito carrito = getCarrito();
            ViewBag.carrito = carrito;

            
            t_ticket_canje ticket = transaccionProductoCanjeService.grabarTicket(idcuenta, tienda.id_tienda, carrito);
            ViewBag.ticket = ticket;
            
            t_cuenta cuenta = transaccionProductoCanjeService.getCuenta(idcuenta);
            ViewBag.cuenta = cuenta;

            /*t_ticket_canje ticket = new t_ticket_canje();
            ticket.fecha_ticket = DateTime.Now;
            ticket.fk_cuenta = idcuenta;
            ticket.fk_tienda = idtienda;
            ticket.puntos = carrito.getTotalPuntos();
            ticket.importe = carrito.getTotalImporte();
            ticket.estado = "C";
            ViewBag.ticket = ticket;*/

            return View();
        }

    }
}