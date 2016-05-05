using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using Fidelizacion.Models;

namespace Fidelizacion.DAO
{
    public class TransferirPuntosDAO : ITransferirPuntosDAO
    {

        private plazaveaEntities db = new plazaveaEntities();

        public List<t_cuenta> getCuentaOrigen(string numdocumento)
        {
            var cuentas = db.t_cuenta.Include(o => o.t_ficha_afiliacion).Where(
                o => o.t_ficha_afiliacion.numero_documento == numdocumento 
                && o.t_ficha_afiliacion.estado_afiliado == "A" 
                && o.estado_cuenta == "A").ToList();
            return cuentas;
        }
    }
}