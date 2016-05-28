using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Fidelizacion.Models;

namespace Fidelizacion.DAO
{
    public class ReporteCanjeDAO : IReporteCanjeDAO
    {
        private plazaveaEntities db = new plazaveaEntities();

        public List<int> listAnios()
        {
            List<int> anios = db.Database.SqlQuery<int>("select distinct year(fecha_ticket) from t_ticket_canje order by 1 desc").ToList();
            return anios;
        }

        public List<ReporteCanje> reporteProductoCanje(int idtienda, int anio, int trimestre, int idcategoria)
        {

            string sql = "select cast(sum(d.cantidad) AS INT) as cantidad, p.id_producto_canje, p.nombre_producto as nombre, c.nombre_categoria_producto " +
                "from t_detalle_ticket_canje d " +
                "inner join t_modalidad_canje m on m.id_modalidad_canje = d.id_modalidad_canje " +
                "inner join t_producto_canje p on p.id_producto_canje = m.fk_producto_canje " +
                "inner join t_categoria_producto_canje c on c.id_categoria_producto_canje = p.fk_categoria_producto_canje " +
                "inner join t_ticket_canje t on t.id_ticket_canje = d.id_ticket_canje " +
                "where 1=1 ";

            if (idtienda != 0)
            {
                sql += "and t.fk_tienda = @idtienda ";
            }

            if(anio != 0)
            {
                sql += "and year(t.fecha_ticket) = @anio ";
            }

            if(trimestre != 0)
            {
                sql += "and ceiling(month(fecha_ticket) / 3.0) = @trimestre ";
            }

            if(idcategoria != 0)
            {
                sql += "and p.fk_categoria_producto_canje = @idcategoria ";
            }

            sql += "group by p.id_producto_canje, p.nombre_producto, c.nombre_categoria_producto ";

            List<ReporteCanje> reporte = db.Database.SqlQuery<ReporteCanje>(sql, new SqlParameter("idtienda", idtienda), new SqlParameter("anio", anio), new SqlParameter("trimestre", trimestre), new SqlParameter("idcategoria", idcategoria)).ToList();

            return reporte;
        }

        public List<ReporteCanje> reporteCategoriaCanje(int idtienda, int anio, int trimestre, int idcategoria)
        {

            string sql = "select cast(sum(d.cantidad) AS INT) as cantidad, c.id_categoria_producto_canje, c.nombre_categoria_producto as nombre " +
                "from t_detalle_ticket_canje d "+
                "inner join t_modalidad_canje m on m.id_modalidad_canje = d.id_modalidad_canje "+
                "inner join t_producto_canje p on p.id_producto_canje = m.fk_producto_canje "+
                "inner join t_categoria_producto_canje c on c.id_categoria_producto_canje = p.fk_categoria_producto_canje "+
                "inner join t_ticket_canje t on t.id_ticket_canje = d.id_ticket_canje "+
                "where 1=1 ";

            if (idtienda != 0)
            {
                sql += "and t.fk_tienda = @idtienda ";
            }

            if (anio != 0)
            {
                sql += "and year(t.fecha_ticket) = @anio ";
            }

            if (trimestre != 0)
            {
                sql += "and ceiling(month(fecha_ticket) / 3.0) = @trimestre ";
            }

            if (idcategoria != 0)
            {
                sql += "and p.fk_categoria_producto_canje = @idcategoria ";
            }

            sql += "group by c.id_categoria_producto_canje, c.nombre_categoria_producto ";

            List<ReporteCanje> reporte = db.Database.SqlQuery<ReporteCanje>(sql, new SqlParameter("idtienda", idtienda), new SqlParameter("anio", anio), new SqlParameter("trimestre", trimestre), new SqlParameter("idcategoria", idcategoria)).ToList();

            return reporte;
        }

        public List<ReporteCanje> reporteRotacion(int anio, int idcategoria)
        {

            string sql = "select cast(sum(d.cantidad) AS INT) as cantidad, r.stock_inicial, p.id_producto_canje, p.nombre_producto as nombre, c.nombre_categoria_producto " +
                "from t_detalle_ticket_canje d " +
                "inner join t_modalidad_canje m on m.id_modalidad_canje = d.id_modalidad_canje " +
                "inner join t_producto_canje p on p.id_producto_canje = m.fk_producto_canje " +
                "inner join t_categoria_producto_canje c on c.id_categoria_producto_canje = p.fk_categoria_producto_canje " +
                "inner join t_ticket_canje t on t.id_ticket_canje = d.id_ticket_canje " +
                "left join t_reporte_stock_anual r on r.fk_producto_canje = p.id_producto_canje and r.anio=@anio " +
                "where year(t.fecha_ticket) = @anio "; //and cantidad/stock_inicial < 0.6

            if (idcategoria != 0)
            {
                sql += "and p.fk_categoria_producto_canje = @idcategoria ";
            }

            sql += "group by p.id_producto_canje, p.nombre_producto, c.nombre_categoria_producto, r.stock_inicial ";

            List<ReporteCanje> reporte = db.Database.SqlQuery<ReporteCanje>(sql, new SqlParameter("anio", anio), new SqlParameter("idcategoria", idcategoria)).ToList();

            return reporte;
        }

    }
}