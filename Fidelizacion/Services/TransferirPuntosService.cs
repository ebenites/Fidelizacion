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
    }
}