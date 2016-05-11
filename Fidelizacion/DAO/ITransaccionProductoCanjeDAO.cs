using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Fidelizacion.Models;

namespace Fidelizacion.DAO
{
    interface ITransaccionProductoCanjeDAO
    {
        List<t_cuenta> getCuenta(string numdocumento);

        List<t_categoria_producto_canje> listCategorias();

        List<t_producto_canje> listProductosCanje();

        t_producto_canje getProductoCanje(int idproducto);
    }
}
