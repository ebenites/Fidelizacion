﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace Fidelizacion.Models
{
    public class TarjetaAfiliacionViewModels
    {

        public string Estado { get; set; }

        public int Codigo { get; set; }
        [Required]
        [StringLength(12, ErrorMessage = "El {0} debe poseer un máximo de {2} caracteres.", MinimumLength = 12)]
        [Display(Name = "N° Tarjeta")]
        public String numeroTarjeta { get; set; }

        [Required]
        [Display(Name = "Fecha Emision")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime fechaEmision { get; set; }


        [Required]
        [Display(Name = "Fecha Vencimiento")]
        [DataType(DataType.Date)]
        [DateGreaterThan("fechaEmision")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime fechaVencimiento { get; set; }

    }

    [AttributeUsage(AttributeTargets.Property)]
    public class DateGreaterThanAttribute : ValidationAttribute
    {
        public DateGreaterThanAttribute(string dateToCompareToFieldName)
        {
            DateToCompareToFieldName = dateToCompareToFieldName;
        }

        private string DateToCompareToFieldName { get; set; }

        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            DateTime earlierDate = (DateTime)value;

            DateTime laterDate = (DateTime)validationContext.ObjectType.GetProperty(DateToCompareToFieldName).GetValue(validationContext.ObjectInstance, null);

            if (earlierDate  > laterDate)
            {
                return ValidationResult.Success;
            }
            else
            {
                return new ValidationResult("La Fecha de Vencimiento debe ser mayor a la Fecha de Emisión");
            }
        }
    }
}