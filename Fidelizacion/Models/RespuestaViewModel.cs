using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Fidelizacion.Models
{
    public class RespuestaViewModel
    {

        public String mensaje { get; set; }
        public Boolean operacion { get; set; }
        public Object objeto { get; set; }
        public Boolean mostrarLink { get; set; }


    }
}