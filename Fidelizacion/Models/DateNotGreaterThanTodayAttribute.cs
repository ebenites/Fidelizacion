using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Fidelizacion.Models
{
    [AttributeUsage(AttributeTargets.Property)]
    public class DateNotGreaterThanTodayAttribute : ValidationAttribute
    {
        public DateNotGreaterThanTodayAttribute()
        {

        }

        public string MessageError { get; set; }
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            DateTime earlierDate = (DateTime)value;

            //  DateTime laterDate = (DateTime)validationContext.ObjectType.GetProperty(DateToCompareToFieldName).GetValue(validationContext.ObjectInstance, null);

            if (earlierDate.Date < DateTime.Now.Date)
            {
                return ValidationResult.Success;
            }
            else
            {
                return new ValidationResult(MessageError);
            }
        }
    }
}