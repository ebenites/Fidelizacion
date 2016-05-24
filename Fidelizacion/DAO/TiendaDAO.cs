using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using Fidelizacion.Models;

namespace Fidelizacion.DAO
{
    public class TiendaDAO : ITiendaDAO
    {
        private plazaveaEntities db = new plazaveaEntities();

        public List<t_tienda> list()
        {
            var tiendas = db.t_tienda.ToList();
            return tiendas;
        }

        public t_tienda get(int id)
        {
            return db.t_tienda.Where(o => o.id_tienda == id).Single();
        }
    }
}