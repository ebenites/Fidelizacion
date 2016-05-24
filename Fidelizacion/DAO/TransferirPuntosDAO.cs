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
            var cuenta = db.t_cuenta.Include(o => o.t_ficha_afiliacion).Single(o => o.id_cuenta == cuentaid);
            return cuenta;
        }

        public void grabar(int idorigen, int iddestino, int puntos, string justificacion)
        {

            /*
            var query = db.Valdkurs
            .Where(vk=> vk.pnr == pnr)   // Filter
            .OrderBy(vk => vk.prioritet) // prioritet is still here - order by it
            .Select(vk => vk.kursnamn); 
            */

            t_cuenta origen = db.t_cuenta.Where(o => o.id_cuenta == idorigen).Single();
            System.Diagnostics.Debug.WriteLine(origen.numero_cuenta);

            origen.puntos = origen.puntos - puntos;

            t_cuenta destino = db.t_cuenta.Where(o => o.id_cuenta == iddestino).Single();
            System.Diagnostics.Debug.WriteLine(destino.numero_cuenta);

            destino.puntos = destino.puntos + puntos;

            t_ticket_transferencia ticket = new t_ticket_transferencia
            {
                puntos_transferidos = puntos,
                fecha_transferencia = DateTime.Now,
                motivo_transferencia = justificacion,
                fk_cuenta = idorigen,
                cuenta_origen = origen.numero_cuenta,
                cuenta_destino = destino.numero_cuenta
            };
            db.t_ticket_transferencia.Add(ticket);

            db.SaveChanges();

            // Actualizando el numero de Ticket

            ticket.numero_ticket = "TRAN-" + ticket.id_transferencia.ToString("D5");
            System.Diagnostics.Debug.WriteLine(ticket.numero_ticket);

            // Grabando cambios

            db.SaveChanges();

        }

    }
}
 