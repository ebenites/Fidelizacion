using System;
using System.ComponentModel.DataAnnotations;


namespace Fidelizacion.Models
{
    public class FichaAfiliacionViewModel
    {
        [Display(Name = "Tipo Documento de Identidad")]
        public int fk_tipo_documento { get; set; }

        [Display(Name = "Numero Documento de Identidad")]
        public string numero_documento { get; set; }

        [Display(Name = "Nombres")]
        public string nombre { get; set; }


        [Display(Name = "Apellido Paterno")]
        public string apellido_paterno { get; set; }

        [Display(Name = "Apellido Materno")]
        public string apellido_materno { get; set; }

        [Display(Name = "Fecha Nacimiento")]
        public DateTime fecha_nacimiento { get; set; }

        [Display(Name = "Sexo")]
        public string sexo { get; set; }


        [Display(Name = "Estado Civil")]
        public string estado_civil { get; set; }

        [Display(Name = "Correo")]
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
        public String numero_tarjeta { get; set; }


        [Display(Name = "Fecha Asignación")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime fecha_asignacion { get; set; }


        [Display(Name = "Estado")]
        public int estado_tarjeta { get; set; }


        [Display(Name = "Motivo")]
        public String motivo { get; set; }

        public int pk_ficha_afiliacion { get; set; }
           public DateTime fecha_baja { get; set; }
      public String tipo_afiliado { get; set; }
    }
}