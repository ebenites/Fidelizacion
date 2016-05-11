using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using Fidelizacion.Models;

namespace Fidelizacion.DAO
{
    public class TransaccionProductoCanjeDAO : ITransaccionProductoCanjeDAO
    {
        private plazaveaEntities db = new plazaveaEntities();

        public List<t_cuenta> getCuenta(string numdocumento)
        {
            var cuentas = db.t_cuenta.Include(o => o.t_ficha_afiliacion).Include(o => o.t_tipo_cuenta)
                .Where(o => o.t_ficha_afiliacion.numero_documento == numdocumento
                  && o.t_ficha_afiliacion.estado_afiliado == "A"
                  && o.estado_cuenta == "A")
                .ToList();
            return cuentas;
        }

        public List<t_categoria_producto_canje> listCategorias()
        {
            var categorias = db.t_categoria_producto_canje.ToList();
            return categorias;
        }

        public List<t_producto_canje> listProductosCanje()
        {
            /*t_cuenta cuenta = db.t_cuenta.Where(
                o => o.t_ficha_afiliacion.numero_documento == numdocumento
                && o.t_ficha_afiliacion.estado_afiliado == "A"
                && o.estado_cuenta == "A"
                && o.fk_tipo_cuenta == 1).Single();*/

            List<t_producto_canje> productos = db.t_producto_canje
                .Include(o => o.t_categoria_producto_canje)
                .Include(o => o.t_modalidad_canje)
                .Include(o => o.t_reporte_stock_producto_canje)
                .Where(o => o.estado == "A" && o.t_modalidad_canje.Count > 0)   // Solo los que presentan alguna modalidad??
                .ToList();

            /*foreach (t_producto_canje producto in productos)
            {
                
                System.Diagnostics.Debug.WriteLine("XXXXXXXXXXX: " + producto.t_modalidad_canje.Count);
            }*/

            return productos;
        }

        public t_producto_canje getProductoCanje(int idproducto)
        {
            t_producto_canje producto = db.t_producto_canje
                .Include(o => o.t_categoria_producto_canje)
                .Include(o => o.t_reporte_stock_producto_canje)
                .Where(o => o.pk_producto_canje == idproducto)
                .Single();

            List<t_modalidad_canje> modalidades = db.t_modalidad_canje.Where(o => o.estado == "A" && o.fk_producto_canje == producto.pk_producto_canje).ToList();
            producto.t_modalidad_canje = modalidades;

            return producto;
        }

    }
}