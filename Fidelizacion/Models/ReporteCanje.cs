using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Fidelizacion.Models
{
    public class ReporteCanje
    {
        public int cantidad { set; get; }
        public decimal stock_inicial { set; get; }
        public string nombre { set; get; }

        public decimal getRatio()
        {
            if (this.stock_inicial == 0)
                return 0;

            return (this.cantidad / this.stock_inicial);
        }

        public Boolean isMeta()
        {
            return (getRatio() >= (decimal)0.6);
        }
    }
}