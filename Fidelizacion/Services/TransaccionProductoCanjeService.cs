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
    }
}