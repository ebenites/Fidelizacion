using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Fidelizacion.Models;

namespace Fidelizacion.Services
{
    interface ITransferirPuntosService
    {

        List<t_cuenta> getCuentaOrigen(string numdocumento);

        List<t_cuenta> getCuentaDestino(string numdocumento);

        t_cuenta getCuenta(int cuentaid);

        void grabar(int idorigen, int iddestino, int puntos, string justificacion);

    }
}
