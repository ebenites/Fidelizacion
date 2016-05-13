using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Fidelizacion.Models;
using Fidelizacion.DAO; 
namespace Fidelizacion.Services
{
    public class TarjetaAfiliacionService : ITarjetaAfiliacionService
    {

        ITarjetaAfiliacionDAO dao = new TarjetaAfiliacionDAO();
        public IQueryable<t_tarjeta_afiliacion> Buscar(string numero, string estado)
        {
         return   dao.Buscar(numero, estado);
        }

        public t_tarjeta_afiliacion getPorId(int codigo)
        {
            return dao.getPorId(codigo);
        }

        public t_tarjeta_afiliacion insertar(TarjetaAfiliacionViewModels tarjeta)
        {
            return dao.insertar(tarjeta);
        }

        public t_tarjeta_afiliacion modificar(TarjetaAfiliacionViewModels tarjeta)
        {
            return dao.modificar(tarjeta);
        }
    }
}