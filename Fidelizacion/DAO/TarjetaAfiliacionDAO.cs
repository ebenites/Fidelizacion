using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Fidelizacion.Models;

namespace Fidelizacion.DAO
{
    public class TarjetaAfiliacionDAO : ITarjetaAfiliacionDAO
    {
        private plazaveaEntities db = new plazaveaEntities();


        public void Agregar(TarjetaAfiliacionViewModels tarjetaAfiliacion)
        {

            t_tarjeta_afiliacion tarjetaAfiliacionModel = new t_tarjeta_afiliacion
            {
                numero_tarjeta = tarjetaAfiliacion.numeroTarjeta.ToString(),
                fecha_vencimiento = tarjetaAfiliacion.fechaVencimiento,
                fecha_emision = tarjetaAfiliacion.fechaEmision

            };
            db.t_tarjeta_afiliacion.Add(tarjetaAfiliacionModel);
            db.SaveChanges();
        }

        public List<TarjetaAfiliacionViewModels> Buscar(TarjetaAfiliacionViewModels tarjetaAfiliacion)
        {
            //var cuentas = db.t_cuenta.Include(o => o.t_ficha_afiliacion).Where(
            //   o => o.t_ficha_afiliacion.numero_documento == numdocumento
            //   && o.t_ficha_afiliacion.estado_afiliado == "A"
            //   && o.estado_cuenta == "A").ToList();

           // var tarjetas = db.t_tarjeta_afiliacion.Where(o=> o.t_tarjeta_afiliacion. );
            return null;
        }

        public void Eliminar(TarjetaAfiliacionViewModels tarjetaAfiliacion)
        {
            throw new NotImplementedException();
        }

        public void Modificar(TarjetaAfiliacionViewModels tarjetaAfiliacion)
        {
            throw new NotImplementedException();
        }
    }
}