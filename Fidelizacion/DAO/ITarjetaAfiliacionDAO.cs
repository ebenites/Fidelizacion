﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Fidelizacion.Models;

namespace Fidelizacion.DAO
{
    interface ITarjetaAfiliacionDAO
    {

        IQueryable<t_tarjeta_afiliacion> Buscar(string numero, string estado);
        t_tarjeta_afiliacion insertar(TarjetaAfiliacionViewModels tarjeta);
        t_tarjeta_afiliacion modificar(TarjetaAfiliacionViewModels tarjeta);
        t_tarjeta_afiliacion getPorId(int tarjeta);

    }
}
