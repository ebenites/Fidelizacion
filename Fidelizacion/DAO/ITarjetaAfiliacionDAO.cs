using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Fidelizacion.Models;

namespace Fidelizacion.DAO
{
    interface ITarjetaAfiliacionDAO
    {

         void Agregar(TarjetaAfiliacionViewModels tarjetaAfiliacion);
         void Eliminar(TarjetaAfiliacionViewModels tarjetaAfiliacion);
         void Modificar(TarjetaAfiliacionViewModels tarjetaAfiliacion);
         List<TarjetaAfiliacionViewModels> Buscar(TarjetaAfiliacionViewModels tarjetaAfiliacion);
    }
}
