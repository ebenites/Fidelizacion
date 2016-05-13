using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Fidelizacion.DAO;
using Fidelizacion.Models;

namespace Fidelizacion.Services
{
    public class TransaccionProductoCanjeService : ITransaccionProductoCanjeService
    {
        private ITransaccionProductoCanjeDAO transaccionProductoCanjeDAO = new TransaccionProductoCanjeDAO();

        public List<t_cuenta> getCuenta(string numdocumento)
        {
            return transaccionProductoCanjeDAO.getCuenta(numdocumento);
        }

        public t_cuenta getCuenta(int idcuenta)
        {
            return transaccionProductoCanjeDAO.getCuenta(idcuenta);
        }

        public List<t_categoria_producto_canje> listCategorias()
        {
            return transaccionProductoCanjeDAO.listCategorias(); ;
        }

        public List<t_producto_canje> listProductosCanje()
        {
            return transaccionProductoCanjeDAO.listProductosCanje();
        }

        public t_producto_canje getProductoCanje(int idproducto)
        {
            return transaccionProductoCanjeDAO.getProductoCanje(idproducto);
        }

        public t_modalidad_canje getModalidadCanje(int idproducto, int idmodalidad)
        {
            return transaccionProductoCanjeDAO.getModalidadCanje(idproducto, idmodalidad);
        }

        public List<t_producto_canje> listProductosCanjeByFiltro(int idcategoria, string producto)
        {
            return transaccionProductoCanjeDAO.listProductosCanjeByFiltro(idcategoria, producto);
        }

        public t_ticket_canje grabarTicket(int idcuenta, int idtienda, Carrito carrito)
        {
            return transaccionProductoCanjeDAO.grabarTicket(idcuenta, idtienda, carrito);
        }
    }
}