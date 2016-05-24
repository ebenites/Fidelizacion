using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Fidelizacion.Models;
using System.Data;
using System.Data.Entity;

namespace Fidelizacion.DAO
{
    public class TarjetaAfiliacionDAO : ITarjetaAfiliacionDAO
    {
        private plazaveaEntities db = new plazaveaEntities();

        public IQueryable<t_tarjeta_afiliacion> Buscar(string numeroCuenta, string estado)
        {
            var t_tarjeta_afiliacion = (IQueryable<t_tarjeta_afiliacion>)null; 

            if (estado.Equals("-1"))
            {
                t_tarjeta_afiliacion = db.t_tarjeta_afiliacion.Where(o => o.numero_tarjeta.Contains(numeroCuenta));
            }
            else {
                t_tarjeta_afiliacion = db.t_tarjeta_afiliacion.Where(o => o.numero_tarjeta.Contains(numeroCuenta) && o.estado.Equals(estado));
            }
            return t_tarjeta_afiliacion;

        }

        public t_tarjeta_afiliacion getPorId(int id)
        {
            t_tarjeta_afiliacion t_tarjeta_afiliacion = db.t_tarjeta_afiliacion.Find(id);
            return t_tarjeta_afiliacion;
        }

        public t_tarjeta_afiliacion insertar(TarjetaAfiliacionViewModels t_tarjeta_afiliacion)
        {
            t_tarjeta_afiliacion models = new t_tarjeta_afiliacion()
            {

                fecha_vencimiento = t_tarjeta_afiliacion.fechaVencimiento,
                fecha_emision = t_tarjeta_afiliacion.fechaEmision,
                numero_tarjeta = t_tarjeta_afiliacion.numeroTarjeta.ToString(),
                estado = "A"
            };

            db.t_tarjeta_afiliacion.Add(models);
            db.SaveChanges();

            return getPorId(models.id_tarteja_afiliacion);
        }

        public t_tarjeta_afiliacion modificar(TarjetaAfiliacionViewModels t_tarjeta_afiliacion)
        {

            t_tarjeta_afiliacion t_tarjeta_afiliacion_mo = db.t_tarjeta_afiliacion.Find(t_tarjeta_afiliacion.Codigo);

            t_tarjeta_afiliacion_mo.estado = t_tarjeta_afiliacion.Estado;
            t_tarjeta_afiliacion_mo.fecha_emision = t_tarjeta_afiliacion.fechaEmision;
            t_tarjeta_afiliacion_mo.fecha_vencimiento = t_tarjeta_afiliacion.fechaVencimiento;
            t_tarjeta_afiliacion_mo.motivo = t_tarjeta_afiliacion.motivo;
            // t_tarjeta_afiliacion_mo.estado = t_tarjeta_afiliacion.Estado;


            db.Entry(t_tarjeta_afiliacion_mo).State = EntityState.Modified;
            db.SaveChanges();
            t_tarjeta_afiliacion_mo = db.t_tarjeta_afiliacion.Find(t_tarjeta_afiliacion.Codigo);

            return t_tarjeta_afiliacion_mo;
        }
    }
}