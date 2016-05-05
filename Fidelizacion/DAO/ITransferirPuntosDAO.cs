using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Fidelizacion.Models;

namespace Fidelizacion.DAO
{
    interface ITransferirPuntosDAO
    {

        List<t_cuenta> getCuentaOrigen(string numdocumento);

    }
}
