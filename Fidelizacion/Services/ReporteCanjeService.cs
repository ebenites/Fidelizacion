using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Fidelizacion.DAO;
using Fidelizacion.Models;

namespace Fidelizacion.Services
{
    public class ReporteCanjeService : IReporteCanjeService
    {
        private IReporteCanjeDAO reporteCanjeDAO = new ReporteCanjeDAO();

        public List<int> listAnios()
        {
            return reporteCanjeDAO.listAnios();
        }

        public List<ReporteCanje> reporteProductoCanje(int idtienda, int anio, int trimestre, int idcategoria)
        {
            return reporteCanjeDAO.reporteProductoCanje(idtienda, anio, trimestre, idcategoria);
        }

        public List<ReporteCanje> reporteCategoriaCanje(int idtienda, int anio, int trimestre, int idcategoria)
        {
            return reporteCanjeDAO.reporteCategoriaCanje(idtienda, anio, trimestre, idcategoria);
        }

        public List<ReporteCanje> reporteRotacion(int anio, int idcategoria)
        {
            return reporteCanjeDAO.reporteRotacion(anio, idcategoria);
        }
    }
}