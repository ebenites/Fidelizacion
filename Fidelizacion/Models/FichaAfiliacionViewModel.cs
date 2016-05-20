using System;
using System.ComponentModel.DataAnnotations;


namespace Fidelizacion.Models
{
    public class FichaAfiliacionViewModel
    {
        [Display(Name = "Tipo Documento de Identidad")]
        [Required]
        public int fk_tipo_documento { get; set; }

        [Display(Name = "Numero Documento de Identidad")]
        [Required]
        public string numero_documento { get; set; }

        [Display(Name = "Nombres")]
        [Required]
        public string nombre { get; set; }


        [Display(Name = "Apellido Paterno")]
        [Required]
        public string apellido_paterno { get; set; }

        [Display(Name = "Apellido Materno")]
        public string apellido_materno { get; set; }

        [Display(Name = "Fecha Nacimiento")]
        [Required]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [DateNotGreaterThanToday(MessageError ="La Fecha Nacimiento no debe ser mayor a la fecha actual.")]
        public DateTime fecha_nacimiento { get; set; }

        [Display(Name = "Sexo")]
        [Required]
        public string sexo { get; set; }


        [Display(Name = "Estado Civil")]
        [Required]
        public string estado_civil { get; set; }

        [Display(Name = "Correo")]
        [Required]
        [EmailAddress]
        public string correo { get; set; }


        [Display(Name = "Teléfono")]
        [Required]
        public string numero_telefono { get; set; }

        [Display(Name = "Celular")]
        public string celular { get; set; }


        [Display(Name = "Dirección")]
        public string direccion { get; set; }


        [Display(Name = "Provincia")]
        public String provincia { get; set; }


        [Display(Name = "Distrito")]
        public String distrito { get; set; }


        [Display(Name = "Estado")]
        public string estado_afiliado { get; set; }

        [Display(Name = "Fecha Alta")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime fecha_alta { get; set; }


        //Datos de la cuenta
        [Display(Name = "N° Cuenta")]
        [Required]
        public String numero_cuenta { get; set; }

        [Display(Name = "Puntos")]
        public int puntos { get; set; }

        [Display(Name = "Tipo Cuenta")]
        public int tipo_cuenta { get; set; }

        [Display(Name = "Cuenta Titular")]
        public String cuenta_titular { get; set; }

        [Display(Name = "Estado")]
        public int estado { get; set; }

        //Datos Tarjeta

        [Display(Name = "N° Tarjeta")]
        [Required]
        public String numero_tarjeta { get; set; }


        [Display(Name = "Fecha Asignación")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime fecha_asignacion { get; set; }


        [Display(Name = "Estado")]
        public int estado_tarjeta { get; set; }


        [Display(Name = "Motivo")]
        public String motivo { get; set; }

        
        public int fk_tarjeta_afiliacion { get; set; }

        
        public int? fk_cuenta_titular { get; set; }

        public int pk_ficha_afiliacion { get; set; }
           public DateTime fecha_baja { get; set; }
      public String tipo_afiliado { get; set; }
    }
}