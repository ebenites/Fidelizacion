using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Fidelizacion.DAO;
using Fidelizacion.Models;

namespace Fidelizacion.Services
{
    public class TiendaService : ITiendaService
    {
        private ITiendaDAO tiendaDAO = new TiendaDAO();
        
        public List<t_tienda> list()
        {
            return tiendaDAO.list();
        }

        public t_tienda get(int id)
        {
            return tiendaDAO.get(id);
        }
    }
}