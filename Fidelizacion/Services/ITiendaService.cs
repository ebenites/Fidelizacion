using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Fidelizacion.Models;

namespace Fidelizacion.Services
{
    interface ITiendaService
    {
        List<t_tienda> list();

        t_tienda get(int id);
    }
}
