using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Fidelizacion.Models
{
    public class Carrito
    {
        private List<CarritoItem> items;


        public Carrito()
        {
            items = new List<CarritoItem>();
        }

        public List<CarritoItem> getItems()
        {
            return this.items;
        }

        public void agregar(CarritoItem item)
        {
            bool contains = this.items.Any(o => o.getModalidad().id_modalidad_canje == item.getModalidad().id_modalidad_canje);
            if (contains)
            {
                CarritoItem current = this.items.Single(o => o.getModalidad().id_modalidad_canje == item.getModalidad().id_modalidad_canje);
                current.setCantidad(current.getCantidad() + item.getCantidad());
            }
            else
            {
                items.Add(item);
            }
        }

        public CarritoItem obtener(int idmodalidad)
        {
            return this.items.Single(o => o.getModalidad().id_modalidad_canje == idmodalidad);
        }

        public void eliminar(int idmodalidad)
        {
            CarritoItem item = this.items.Single(o => o.getModalidad().id_modalidad_canje == idmodalidad);
            this.items.Remove(item);
        }

        public int getTotal()
        {
            int total = 0;
            foreach(CarritoItem item in this.items)
            {
                total += item.getCantidad();
            }
            return total;
        }

        public int getTotalPuntos()
        {
            int total = 0;
            foreach (CarritoItem item in this.items)
            {
                total += item.getSubTotalPuntos();
            }
            return total;
        }

        public decimal getTotalImporte()
        {
            decimal total = 0;
            foreach (CarritoItem item in this.items)
            {
                total += item.getSubTotalImporte();
            }
            return total;
        }

        public int getTotalPorProducto(int idproducto)
        {
            int total = 0;
            foreach (CarritoItem item in this.items)
            {
                if(item.getModalidad().fk_producto_canje == idproducto)
                {
                    total += item.getCantidad();
                }
            }
            return total;
        }

    }
}