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
    
    public partial class t_producto_canje
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public t_producto_canje()
        {
            this.t_modalidad_canje = new HashSet<t_modalidad_canje>();
            this.t_reporte_stock_producto_canje = new HashSet<t_reporte_stock_producto_canje>();
            this.t_reporte_stock_anual = new HashSet<t_reporte_stock_anual>();
        }
    
        public int id_producto_canje { get; set; }
        public int fk_categoria_producto_canje { get; set; }
        public string nombre_producto { get; set; }
        public Nullable<decimal> costo { get; set; }
        public Nullable<System.DateTime> fecha_alta { get; set; }
        public System.DateTime fecha_baja { get; set; }
        public Nullable<System.DateTime> fecha_inicio_vigencia { get; set; }
        public Nullable<System.DateTime> fecha_fin_vigencia { get; set; }
        public string estado { get; set; }
    
        public virtual t_categoria_producto_canje t_categoria_producto_canje { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<t_modalidad_canje> t_modalidad_canje { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<t_reporte_stock_producto_canje> t_reporte_stock_producto_canje { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<t_reporte_stock_anual> t_reporte_stock_anual { get; set; }

        public int getStockByTienda(int idtienda)
        {
            if (this.t_reporte_stock_producto_canje != null)
            {
                foreach (t_reporte_stock_producto_canje reporte_stock in this.t_reporte_stock_producto_canje)
                {
                    if (reporte_stock.fk_tienda == idtienda)
                    {
                        return (int)reporte_stock.stock;
                    }
                }
            }
            return 0;
        }
    }
}
