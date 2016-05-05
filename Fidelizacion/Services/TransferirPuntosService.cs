using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Fidelizacion.DAO;
using Fidelizacion.Models;

namespace Fidelizacion.Services
{
    public class TransferirPuntosService : ITransferirPuntosService
    {

        private ITransferirPuntosDAO transferirPuntosDAO = new TransferirPuntosDAO();

        public List<t_cuenta> getCuentaOrigen(string numdocumento)
        {
            return transferirPuntosDAO.getCuentaOrigen(numdocumento);
        }

        public List<t_cuenta> getCuentaDestino(string numdocumento)
        {
            return transferirPuntosDAO.getCuentaDestino(numdocumento);
        }

        public t_cuenta getCuenta(int cuentaid)
        {
            return transferirPuntosDAO.getCuenta(cuentaid);
        }

        public void grabar(int idorigen, int iddestino, int puntos, string justificacion)
        {
            transferirPuntosDAO.grabar(idorigen, iddestino, puntos, justificacion);
        }
    }
}