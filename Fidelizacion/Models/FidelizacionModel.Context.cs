﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class plazaveaEntities : DbContext
    {
        public plazaveaEntities()
            : base("name=plazaveaEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<t_campana> t_campana { get; set; }
        public virtual DbSet<t_contrato> t_contrato { get; set; }
        public virtual DbSet<t_cuenta> t_cuenta { get; set; }
        public virtual DbSet<t_ficha_afiliacion> t_ficha_afiliacion { get; set; }
        public virtual DbSet<t_solicitud_atencion> t_solicitud_atencion { get; set; }
        public virtual DbSet<t_solicitud_campana> t_solicitud_campana { get; set; }
        public virtual DbSet<t_ticket_transferencia> t_ticket_transferencia { get; set; }
        public virtual DbSet<t_tienda> t_tienda { get; set; }
        public virtual DbSet<t_tipo_cuenta> t_tipo_cuenta { get; set; }
        public virtual DbSet<t_tipo_documento> t_tipo_documento { get; set; }
        public virtual DbSet<t_tarjera_afiliacion_cuenta> t_tarjera_afiliacion_cuenta { get; set; }
        public virtual DbSet<t_tarjeta_afiliacion> t_tarjeta_afiliacion { get; set; }
        public virtual DbSet<t_categoria_producto_canje> t_categoria_producto_canje { get; set; }
        public virtual DbSet<t_detalle_ticket_canje> t_detalle_ticket_canje { get; set; }
        public virtual DbSet<t_modalidad_canje> t_modalidad_canje { get; set; }
        public virtual DbSet<t_producto_canje> t_producto_canje { get; set; }
        public virtual DbSet<t_reporte_stock_producto_canje> t_reporte_stock_producto_canje { get; set; }
        public virtual DbSet<t_ticket_canje> t_ticket_canje { get; set; }
    }
}
