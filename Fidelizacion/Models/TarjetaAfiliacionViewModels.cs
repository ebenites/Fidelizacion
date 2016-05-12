using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace Fidelizacion.Models
{
    public class TarjetaAfiliacionViewModels
    {

  

        [Required]
        [Display(Name = "Fecha Vencimiento")]
        public DateTime fechaVencimiento { get; set; }

        [Required]
        [StringLength(12, ErrorMessage = "El {0} debe poseer un máximo de {2} caracteres.", MinimumLength = 12)]
        [Display(Name = "N° Tarjeta")]
        public Int32 numeroTarjeta { get; set; }

        [Required]
        [Display(Name = "Fecha Emision")]
        public DateTime fechaEmision { get; set; }
    }
}