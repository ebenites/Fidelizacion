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

        public List<t_cuenta> getCuentaDestino(string numdocumento)
        {
            var cuentas = db.t_cuenta.Include(o => o.t_ficha_afiliacion).Where(
                o => o.t_ficha_afiliacion.numero_documento == numdocumento
                && o.t_ficha_afiliacion.estado_afiliado == "A"
                && o.estado_cuenta == "A").ToList();
            return cuentas;
        }

        public t_cuenta getCuenta(int cuentaid)
        {
            var cuenta = db.t_cuenta.Include(o => o.t_ficha_afiliacion).Single(o => o.pk_cuenta == cuentaid);
            return cuenta;
        }

        public void grabar(int idorigen, int iddestino, int puntos, string justificacion)
        {
            /*t_ticket_transferencia ticket = new t_ticket_transferencia
            {
                codigo_tecnico = vtecnico,
                anio = detalle.Cronograma.anio,
                semana = detalle.semana
            };
            db.t_ticket_transferencia.Add(ticket);

            db.SaveChanges();*/
        }

    }
}