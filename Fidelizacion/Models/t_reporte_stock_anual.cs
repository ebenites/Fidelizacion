//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Fidelizacion.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class t_reporte_stock_anual
    {
        public int id_reporte_stock_anual { get; set; }
        public int fk_producto_canje { get; set; }
        public int anio { get; set; }
        public decimal stock_inicial { get; set; }
    
        public virtual t_producto_canje t_producto_canje { get; set; }
    }
}
