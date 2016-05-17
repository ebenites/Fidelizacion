using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Fidelizacion.Models;

namespace Fidelizacion.Services
{
    interface IReporteCanjeService
    {
        List<int> listAnios();

        List<ReporteCanje> reporteProductoCanje(int idtienda, int anio, int trimestre, int idcategoria);

        List<ReporteCanje> reporteCategoriaCanje(int idtienda, int anio, int trimestre, int idcategoria);
    }
}
