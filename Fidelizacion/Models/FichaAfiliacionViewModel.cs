using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;


namespace Fidelizacion.Models
{
    public class FichaAfiliacionViewModel
    {
        [Display(Name = "Tipo Documento de Identidad")]
        [Required]
        //[Required(ErrorMessage = "Document Type is required")]
        public int fk_tipo_documento { get; set; }

        [Display(Name = "Número Documento de Identidad")]
        [Required]
        public string numero_documento { get; set; }

        [Display(Name = "Nombres")]
        [Required]
        public string nombre { get; set; }


        [Display(Name = "Apellidos")]
        [Required]
        public string apellidos { get; set; }
        
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
        public String estado { get; set; }

        //Datos Tarjeta

        [Display(Name = "N° Tarjeta")]
        [Required]
        public String numero_tarjeta { get; set; }


        [Display(Name = "Fecha Asignación")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime fecha_asignacion { get; set; }


        [Display(Name = "Estado")]
        public String estado_tarjeta { get; set; }


        [Display(Name = "Motivo")]
        public String motivo { get; set; }

        
        public int fk_tarjeta_afiliacion { get; set; }

        
        public int? fk_cuenta_titular { get; set; }

        public int id_ficha_afiliacion { get; set; }
           public DateTime fecha_baja { get; set; }
      public String tipo_afiliado { get; set; }

        public IEnumerable<DesasociarFichaAfiliacionViewModel> Asociados { get; set; }
    }



    public class DesasociarFichaAfiliacionViewModel
    {
        [Display(Name = "Tipo Documento de Identidad")]
        public string  tipo_documento { get; set; }

        [Display(Name = "Numero Documento de Identidad")]
        public string numero_documento { get; set; }

        [Display(Name = "Nombres")]
        public string nombre { get; set; }


        [Display(Name = "Apellido Paterno")]
        public string apellidos { get; set; }


        public IEnumerable<DesasociarFichaAfiliacionViewModel> Asociados { get; set; }

        [Display(Name = "Sexo")]
        public string sexo { get; set; }


      

         


        [Display(Name = "Estado")]
        public string estado_afiliado { get; set; }

        [Display(Name = "Fecha Alta")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime fecha_alta { get; set; }


        //Datos de la cuenta
        [Display(Name = "N° Cuenta")]
        public String numero_cuenta { get; set; }

        [Display(Name = "Puntos")]
        public int puntos { get; set; }

        //Datos Tarjeta

        [Display(Name = "N° Tarjeta")]
        public String numero_tarjeta { get; set; }


        public String tipo_cuenta { get; set; }

        public int id_numero_cuenta { get; set; }

    }
}