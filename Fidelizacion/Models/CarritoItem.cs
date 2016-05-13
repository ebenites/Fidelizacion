using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Fidelizacion.Models
{
    public class CarritoItem
    {
        private int cantidad;

        private t_modalidad_canje modalidad;
        
        public CarritoItem(t_modalidad_canje modalidad, int cantidad)
        {
            this.modalidad = modalidad;
            this.cantidad = cantidad;
        }

        public int getCantidad()
        {
            return this.cantidad;
        }

        public void setCantidad(int cantidad)
        {
            this.cantidad = cantidad;
        }

        public t_modalidad_canje getModalidad()
        {
            return this.modalidad;
        }

        public int getSubTotalPuntos()
        {
            if(this.modalidad != null)
            {
                return (int)this.modalidad.punto_canje * this.cantidad;
            }
            return 0;
        }

        public decimal getSubTotalImporte()
        {
            if (this.modalidad != null)
            {
                return this.modalidad.importe_canje * this.cantidad;
            }
            return 0;
        }
        
    }
}