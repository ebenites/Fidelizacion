USE [master]
GO
/****** Object:  Database [plazavea]    Script Date: 15/06/2016 12:00:15 p.m. ******/
CREATE DATABASE [plazavea]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'plazavea', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\plazavea.mdf' , SIZE = 4544KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'plazavea_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\plazavea_log.ldf' , SIZE = 896KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [plazavea] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [plazavea].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [plazavea] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [plazavea] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [plazavea] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [plazavea] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [plazavea] SET ARITHABORT OFF 
GO
ALTER DATABASE [plazavea] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [plazavea] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [plazavea] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [plazavea] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [plazavea] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [plazavea] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [plazavea] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [plazavea] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [plazavea] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [plazavea] SET  DISABLE_BROKER 
GO
ALTER DATABASE [plazavea] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [plazavea] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [plazavea] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [plazavea] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [plazavea] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [plazavea] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [plazavea] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [plazavea] SET RECOVERY FULL 
GO
ALTER DATABASE [plazavea] SET  MULTI_USER 
GO
ALTER DATABASE [plazavea] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [plazavea] SET DB_CHAINING OFF 
GO
ALTER DATABASE [plazavea] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [plazavea] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [plazavea] SET DELAYED_DURABILITY = DISABLED 
GO
USE [plazavea]
GO
/****** Object:  Table [dbo].[t_autorizacion]    Script Date: 15/06/2016 12:00:17 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_autorizacion](
	[id_autorizacion] [int] IDENTITY(1,1) NOT NULL,
	[accion] [nvarchar](50) NULL,
	[codigo_autorizacion] [nvarchar](16) NULL,
 CONSTRAINT [pk_autorizacion] PRIMARY KEY CLUSTERED 
(
	[id_autorizacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_banco]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_banco](
	[id_banco] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
 CONSTRAINT [pK_t_banco] PRIMARY KEY CLUSTERED 
(
	[id_banco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_cajero]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_cajero](
	[id_cajero] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[apellidos] [varchar](100) NULL,
 CONSTRAINT [PK_t_cajero] PRIMARY KEY CLUSTERED 
(
	[id_cajero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_campana]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_campana](
	[id_campana] [int] NOT NULL,
	[nombre_campana] [nvarchar](25) NULL,
	[fecha_alta] [datetime] NULL,
	[fecha_baja] [datetime] NULL,
	[fk_tienda] [int] NULL,
	[fk_solicitud_campana] [int] NULL,
	[tipo_campana] [char](1) NULL,
 CONSTRAINT [PK_CAMPANA] PRIMARY KEY CLUSTERED 
(
	[id_campana] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_campana_producto]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_campana_producto](
	[id_campana_producto] [int] IDENTITY(1,1) NOT NULL,
	[id_producto] [int] NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[tipo_campana] [nchar](1) NOT NULL,
	[compra] [int] NOT NULL,
	[paga] [int] NOT NULL,
	[porcentaje_descuento] [decimal](4, 2) NULL,
	[cantidad] [int] NULL,
 CONSTRAINT [pk_campana_producto] PRIMARY KEY CLUSTERED 
(
	[id_campana_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_categoria_producto]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_categoria_producto](
	[id_categoria_producto] [int] IDENTITY(1,1) NOT NULL,
	[descripcion_categoria_producto] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.t_categoria_producto] PRIMARY KEY CLUSTERED 
(
	[id_categoria_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_categoria_producto_canje]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_categoria_producto_canje](
	[id_categoria_producto_canje] [int] IDENTITY(1,1) NOT NULL,
	[nombre_categoria_producto] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_t_categoria_producto_canje] PRIMARY KEY CLUSTERED 
(
	[id_categoria_producto_canje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_cheque]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_cheque](
	[id_cheque] [int] IDENTITY(1,1) NOT NULL,
	[numero_cheque] [varchar](100) NULL,
	[fecha_emision] [varchar](100) NULL,
	[ffecha_emision] [int] NULL,
	[importe] [varchar](100) NULL,
	[id_proveedor] [int] NULL,
	[id_moneda] [int] NULL,
	[id_banco] [int] NULL,
 CONSTRAINT [pK_t_cheque] PRIMARY KEY CLUSTERED 
(
	[id_cheque] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_contrato]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_contrato](
	[id_contrato] [int] IDENTITY(1,1) NOT NULL,
	[fecha_contrato] [datetime] NULL,
	[fecha_firma] [datetime] NULL,
	[fk_cuenta] [int] NULL,
	[condiciones] [nvarchar](500) NULL,
 CONSTRAINT [PK_t_contrato] PRIMARY KEY CLUSTERED 
(
	[id_contrato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_cronograma]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_cronograma](
	[id_Cronograma] [int] IDENTITY(1,1) NOT NULL,
	[nro_cronograma] [varchar](100) NULL,
	[fecha_inicio] [varchar](11) NULL,
	[ffecha_inicio] [int] NULL,
	[fecha_fin] [varchar](11) NULL,
	[ffecha_fin] [int] NULL,
	[estado] [varchar](100) NULL,
	[observaciones] [varchar](max) NULL,
 CONSTRAINT [pK_t_cronograma] PRIMARY KEY CLUSTERED 
(
	[id_Cronograma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_cuenta]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_cuenta](
	[id_cuenta] [int] IDENTITY(1,1) NOT NULL,
	[numero_cuenta] [nvarchar](20) NULL,
	[fecha_alta] [datetime] NULL,
	[fecha_baja] [datetime] NULL,
	[puntos] [numeric](18, 0) NULL,
	[estado_cuenta] [char](1) NULL,
	[fk_tipo_cuenta] [int] NULL,
	[fk_cuenta] [int] NULL,
	[fk_ficha_afiliacion] [int] NULL,
 CONSTRAINT [PK_t_cuenta_1] PRIMARY KEY CLUSTERED 
(
	[id_cuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_cuenta_bancaria]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_cuenta_bancaria](
	[id_Cuentabancaria] [int] IDENTITY(1,1) NOT NULL,
	[nro_cuenta] [varchar](100) NULL,
	[tiipo] [varchar](100) NULL,
 CONSTRAINT [pK_t_cuenta_bancaria] PRIMARY KEY CLUSTERED 
(
	[id_Cuentabancaria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_detalle_pago]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_detalle_pago](
	[id_detalle_pago] [int] IDENTITY(1,1) NOT NULL,
	[id_pago] [int] NOT NULL,
	[id_medio_pago] [int] NOT NULL,
	[monto] [decimal](18, 2) NOT NULL,
	[id_moneda] [int] NOT NULL,
	[marca_tarjeta] [varchar](50) NULL,
	[entidad_bancaria] [varchar](100) NULL,
 CONSTRAINT [pk_detalle_pago] PRIMARY KEY CLUSTERED 
(
	[id_detalle_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_detalle_ticket_canje]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_detalle_ticket_canje](
	[id_ticket_canje] [int] NOT NULL,
	[id_modalidad_canje] [int] NOT NULL,
	[cantidad] [numeric](18, 0) NULL,
	[subtotal_puntos] [numeric](18, 0) NULL,
	[subtotal_importe] [numeric](18, 2) NULL,
 CONSTRAINT [PK_t_detalle_ticket_canje] PRIMARY KEY CLUSTERED 
(
	[id_ticket_canje] ASC,
	[id_modalidad_canje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_detalle_venta]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_detalle_venta](
	[id_detalle_venta] [int] IDENTITY(1,1) NOT NULL,
	[id_venta] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[cantidad] [decimal](12, 2) NOT NULL,
 CONSTRAINT [pk_detalle_venta] PRIMARY KEY CLUSTERED 
(
	[id_detalle_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_deuda]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_deuda](
	[id_deuda] [int] IDENTITY(1,1) NOT NULL,
	[id_tipo_servicio] [int] NOT NULL,
	[monto_soles] [decimal](18, 2) NOT NULL,
	[estado] [nvarchar](20) NOT NULL,
	[numero_documento] [nvarchar](20) NULL,
	[fecha_vencimiento] [datetime] NULL,
 CONSTRAINT [pk_deuda] PRIMARY KEY CLUSTERED 
(
	[id_deuda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_empresa]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_empresa](
	[id_empresa] [int] IDENTITY(1,1) NOT NULL,
	[razon_social] [nvarchar](100) NOT NULL,
	[ruc] [nvarchar](11) NOT NULL,
 CONSTRAINT [pk_empresa] PRIMARY KEY CLUSTERED 
(
	[id_empresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_ficha_afiliacion]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_ficha_afiliacion](
	[id_ficha_afiliacion] [int] IDENTITY(1,1) NOT NULL,
	[apellidos] [nvarchar](50) NULL,
	[nombre] [nvarchar](50) NULL,
	[numero_documento] [nvarchar](20) NULL,
	[sexo] [char](1) NULL,
	[correo] [nvarchar](64) NULL,
	[numero_telefono] [nvarchar](30) NULL,
	[fecha_alta] [datetime] NULL,
	[fecha_nacimiento] [date] NULL,
	[estado_afiliado] [char](1) NULL,
	[fecha_baja] [datetime] NULL,
	[estado_civil] [char](1) NULL,
	[direccion] [nvarchar](100) NULL,
	[celular] [nvarchar](30) NULL,
	[departamento] [nvarchar](50) NULL,
	[distrito] [nvarchar](50) NULL,
	[provincia] [nvarchar](50) NULL,
	[fk_tipo_documento] [int] NULL,
 CONSTRAINT [PK_AFILIADO] PRIMARY KEY CLUSTERED 
(
	[id_ficha_afiliacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_medio_pago]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_medio_pago](
	[id_medio_pago] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](10) NOT NULL,
 CONSTRAINT [pk_medio_pago] PRIMARY KEY CLUSTERED 
(
	[id_medio_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_modalidad]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_modalidad](
	[id_Modalidad] [int] IDENTITY(1,1) NOT NULL,
	[modalidad] [varchar](100) NULL,
 CONSTRAINT [pK_t_modalidad] PRIMARY KEY CLUSTERED 
(
	[id_Modalidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_modalidad_canje]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_modalidad_canje](
	[id_modalidad_canje] [int] IDENTITY(1,1) NOT NULL,
	[fk_producto_canje] [int] NOT NULL,
	[nombre_modalidad_canje] [nvarchar](80) NULL,
	[tipo_canje] [nchar](2) NULL,
	[punto_canje] [numeric](18, 0) NOT NULL,
	[importe_canje] [numeric](18, 2) NOT NULL,
	[fecha_alta] [date] NULL,
	[fecha_baja] [date] NULL,
	[estado] [nchar](1) NULL,
 CONSTRAINT [PK_t_modalidad_canje] PRIMARY KEY CLUSTERED 
(
	[id_modalidad_canje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_moneda]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_moneda](
	[id_moneda] [int] IDENTITY(1,1) NOT NULL,
	[moneda] [varchar](100) NULL,
	[descripcion] [nvarchar](20) NOT NULL,
	[simbolo] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_t_moneda] PRIMARY KEY CLUSTERED 
(
	[id_moneda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_orden_despacho]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_orden_despacho](
	[id_orden_despacho] [int] IDENTITY(1,1) NOT NULL,
	[fecha_despacho] [datetime] NOT NULL,
	[tipo_prioridad] [nvarchar](max) NULL,
	[id_transporte] [int] NOT NULL,
	[observacion] [nvarchar](max) NULL,
	[id_orden_despacho_estado] [int] NOT NULL,
	[entregado] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.t_orden_despacho] PRIMARY KEY CLUSTERED 
(
	[id_orden_despacho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_orden_despacho_detalle]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_orden_despacho_detalle](
	[id_orden_despacho_detalle] [int] IDENTITY(1,1) NOT NULL,
	[id_orden_despacho] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[cantidad_requerida] [decimal](18, 2) NOT NULL,
	[id_solicitud_compra] [int] NOT NULL,
 CONSTRAINT [PK_dbo.t_orden_despacho_detalle] PRIMARY KEY CLUSTERED 
(
	[id_orden_despacho_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_orden_despacho_estado]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_orden_despacho_estado](
	[id_orden_despacho_estado] [int] IDENTITY(1,1) NOT NULL,
	[descripcion_estado] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.t_orden_despacho_estado] PRIMARY KEY CLUSTERED 
(
	[id_orden_despacho_estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_orden_despacho_incidencia]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_orden_despacho_incidencia](
	[id_orden_despacho_incidencia] [int] IDENTITY(1,1) NOT NULL,
	[descripcion_incidencia] [nvarchar](max) NULL,
	[id_orden_despacho] [int] NOT NULL,
 CONSTRAINT [PK_dbo.t_orden_despacho_incidencia] PRIMARY KEY CLUSTERED 
(
	[id_orden_despacho_incidencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_orden_despacho_personal]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_orden_despacho_personal](
	[id_orden_despacho_persona] [int] IDENTITY(1,1) NOT NULL,
	[id_orden_despacho] [int] NOT NULL,
	[id_programar_persona] [int] NOT NULL,
 CONSTRAINT [PK_dbo.t_orden_despacho_personal] PRIMARY KEY CLUSTERED 
(
	[id_orden_despacho_persona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_orden_despacho_ruta]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_orden_despacho_ruta](
	[id_orden_despacho_ruta] [int] IDENTITY(1,1) NOT NULL,
	[id_tienda] [int] NOT NULL,
	[orden_ruta] [int] NOT NULL,
	[distancia] [real] NOT NULL,
	[id_orden_despacho] [int] NOT NULL,
 CONSTRAINT [PK_dbo.t_orden_despacho_ruta] PRIMARY KEY CLUSTERED 
(
	[id_orden_despacho_ruta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_orden_despacho_solicitud]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_orden_despacho_solicitud](
	[id_orden_despacho_solicitud] [int] IDENTITY(1,1) NOT NULL,
	[id_orden_despacho] [int] NOT NULL,
	[id_solicitud_compra] [int] NOT NULL,
 CONSTRAINT [PK_dbo.t_orden_despacho_solicitud] PRIMARY KEY CLUSTERED 
(
	[id_orden_despacho_solicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_orden_pago]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_orden_pago](
	[id_Ordenpago] [int] IDENTITY(1,1) NOT NULL,
	[nro_orden] [varchar](100) NULL,
	[descripcion] [varchar](100) NULL,
	[proveedor] [varchar](100) NULL,
	[fecha_registro] [varchar](11) NULL,
	[ffecha_registro] [int] NULL,
	[fecha_pago] [varchar](11) NULL,
	[ffecha_pago] [int] NULL,
	[banco] [varchar](100) NULL,
	[moneda] [varchar](100) NULL,
	[monto_pago] [varchar](100) NULL,
	[estado] [varchar](100) NULL,
	[cuenta_origen] [varchar](100) NULL,
	[saldo_cuenta_origen] [varchar](100) NULL,
	[moneda_destino] [varchar](100) NULL,
	[monto_destino] [varchar](100) NULL,
	[cuenta_destino] [varchar](100) NULL,
	[modalidad_pago] [varchar](100) NULL,
	[documento_anexo] [varchar](100) NULL,
	[nro_operacion] [varchar](100) NULL,
	[diferencia] [varchar](100) NULL,
	[monto_diferencia] [varchar](100) NULL,
	[comentario] [varchar](100) NULL,
	[motivo] [varchar](100) NULL,
	[fecha_comentario] [varchar](100) NULL,
	[nro_cronograma] [varchar](100) NULL,
	[id_proveedor] [int] NULL,
	[id_banco] [int] NULL,
	[id_moneda] [int] NULL,
	[id_cronograma] [int] NULL,
	[id_cuenta_origen] [int] NULL,
	[id_cuenta_destino] [int] NULL,
	[id_modalidad] [int] NULL,
 CONSTRAINT [pK_T_Ordenpago] PRIMARY KEY CLUSTERED 
(
	[id_Ordenpago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_pago]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_pago](
	[id_pago] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[id_tipo_comprobante] [int] NOT NULL,
	[vuelto_soles] [decimal](18, 2) NOT NULL,
	[monto_pagado] [decimal](18, 2) NOT NULL,
	[estado] [nvarchar](10) NOT NULL,
	[vuelto_dolares] [decimal](18, 2) NOT NULL,
	[id_empresa] [int] NULL,
	[comision] [decimal](18, 2) NULL,
	[numero_comprobante] [varchar](100) NOT NULL,
 CONSTRAINT [pk_pago] PRIMARY KEY CLUSTERED 
(
	[id_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_persona]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_persona](
	[id_persona] [int] IDENTITY(1,1) NOT NULL,
	[dni] [nvarchar](8) NULL,
	[nombre] [nvarchar](15) NULL,
	[apellido_paterno] [nvarchar](max) NULL,
	[apellido_materno] [nvarchar](max) NULL,
	[fecha_nacimiento] [datetime] NOT NULL,
	[direccion] [nvarchar](max) NULL,
	[telefono] [nvarchar](max) NULL,
	[celular] [nvarchar](max) NULL,
	[brevete] [nvarchar](max) NULL,
	[id_puesto] [int] NOT NULL,
 CONSTRAINT [PK_dbo.t_persona] PRIMARY KEY CLUSTERED 
(
	[id_persona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_producto]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_producto](
	[id_producto] [int] IDENTITY(1,1) NOT NULL,
	[descripcion_producto] [varchar](100) NOT NULL,
	[id_categoria_producto] [int] NOT NULL,
	[id_unidad_medida] [int] NOT NULL,
	[precio] [decimal](12, 2) NOT NULL,
 CONSTRAINT [pk_producto] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_producto_canje]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_producto_canje](
	[id_producto_canje] [int] IDENTITY(1,1) NOT NULL,
	[fk_categoria_producto_canje] [int] NOT NULL,
	[nombre_producto] [nvarchar](50) NULL,
	[costo] [decimal](18, 2) NULL,
	[fecha_alta] [datetime] NULL,
	[fecha_baja] [datetime] NOT NULL,
	[fecha_inicio_vigencia] [date] NULL,
	[fecha_fin_vigencia] [date] NULL,
	[estado] [char](1) NULL,
 CONSTRAINT [PK_t_producto_canje] PRIMARY KEY CLUSTERED 
(
	[id_producto_canje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_programar_personal]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_programar_personal](
	[id_programar_persona] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[observacion] [nvarchar](max) NULL,
	[disponible] [nvarchar](max) NULL,
	[id_turno] [int] NOT NULL,
	[id_persona] [int] NOT NULL,
 CONSTRAINT [PK_dbo.t_programar_personal] PRIMARY KEY CLUSTERED 
(
	[id_programar_persona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_proveedor]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_proveedor](
	[id_proveedor] [int] IDENTITY(1,1) NOT NULL,
	[razon_social] [varchar](100) NULL,
	[ruc] [varchar](100) NULL,
 CONSTRAINT [pK_t_proveedor] PRIMARY KEY CLUSTERED 
(
	[id_proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_puesto]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_puesto](
	[id_puesto] [int] IDENTITY(1,1) NOT NULL,
	[descripcion_puesto] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.t_puesto] PRIMARY KEY CLUSTERED 
(
	[id_puesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_puntos_producto]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_puntos_producto](
	[id_puntos_producto] [int] IDENTITY(1,1) NOT NULL,
	[id_producto] [int] NOT NULL,
	[puntos] [int] NOT NULL,
 CONSTRAINT [pk_puntos_producto] PRIMARY KEY CLUSTERED 
(
	[id_puntos_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_recarga_servicio]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_recarga_servicio](
	[id_recarga_servicio] [int] IDENTITY(1,1) NOT NULL,
	[id_tipo_servicio] [int] NOT NULL,
	[monto_soles] [decimal](18, 2) NOT NULL,
	[estado] [nvarchar](20) NOT NULL,
	[numero_telefono] [nvarchar](20) NULL,
	[id_venta] [int] NULL,
 CONSTRAINT [pk_id_recarga_servicio] PRIMARY KEY CLUSTERED 
(
	[id_recarga_servicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_reporte_stock_anual]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_reporte_stock_anual](
	[id_reporte_stock_anual] [int] IDENTITY(1,1) NOT NULL,
	[fk_producto_canje] [int] NOT NULL,
	[anio] [int] NOT NULL,
	[stock_inicial] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_t_reporte_stock_anual] PRIMARY KEY CLUSTERED 
(
	[id_reporte_stock_anual] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_reporte_stock_producto_canje]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_reporte_stock_producto_canje](
	[id_reporte_stock_producto_canje] [int] IDENTITY(1,1) NOT NULL,
	[fk_producto_canje] [int] NULL,
	[fk_tienda] [int] NULL,
	[stock] [numeric](18, 0) NULL,
	[fecha] [datetime] NULL,
 CONSTRAINT [PK_t_reporte_stock_producto_canje] PRIMARY KEY CLUSTERED 
(
	[id_reporte_stock_producto_canje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_solicitud_atencion]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_solicitud_atencion](
	[id_solicitud] [varchar](11) NOT NULL,
	[fecha] [datetime] NULL,
	[fk_ficha_afiliacion] [int] NULL,
	[fk_tienda] [int] NULL,
 CONSTRAINT [PK_SOLICITUD_AFILIACION] PRIMARY KEY CLUSTERED 
(
	[id_solicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_solicitud_campana]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_solicitud_campana](
	[id_solicitud_campana] [int] NOT NULL,
	[nombre_campana] [nvarchar](50) NULL,
	[descripcion_campana] [nvarchar](500) NULL,
	[tipo_campana] [nchar](2) NULL,
	[fecha_inicio] [datetime] NULL,
	[fecha_fina] [datetime] NULL,
 CONSTRAINT [PK_t_solicitud_campana] PRIMARY KEY CLUSTERED 
(
	[id_solicitud_campana] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_solicitud_compra]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_solicitud_compra](
	[id_solicitud_compra] [int] IDENTITY(1,1) NOT NULL,
	[fecha_solicitud_compra] [datetime] NOT NULL,
	[estado_solicitud_compra] [int] NOT NULL,
	[id_tienda] [int] NOT NULL,
 CONSTRAINT [PK_dbo.t_solicitud_compra] PRIMARY KEY CLUSTERED 
(
	[id_solicitud_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_solicitud_compra_detalle]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_solicitud_compra_detalle](
	[id_solicitud_compra_detalle] [int] IDENTITY(1,1) NOT NULL,
	[cantidad_solicitada] [decimal](18, 2) NULL,
	[estado_solicitud_compra_detalle] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[id_solicitud_compra] [int] NOT NULL,
 CONSTRAINT [PK_dbo.t_solicitud_compra_detalle] PRIMARY KEY CLUSTERED 
(
	[id_solicitud_compra_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_stock_producto]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_stock_producto](
	[id_stock_producto] [int] IDENTITY(1,1) NOT NULL,
	[id_producto] [int] NOT NULL,
	[stock_minimo] [decimal](12, 2) NOT NULL,
	[stock_maximo] [decimal](12, 2) NULL,
	[stock_actual] [decimal](12, 2) NULL,
 CONSTRAINT [pk_stock_producto] PRIMARY KEY CLUSTERED 
(
	[id_stock_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_stock_producto_almacen]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_stock_producto_almacen](
	[id_stock_producto_almacen] [int] IDENTITY(1,1) NOT NULL,
	[stock_minimo] [decimal](18, 2) NOT NULL,
	[stock_maximo] [decimal](18, 2) NOT NULL,
	[stock_actual] [decimal](18, 2) NOT NULL,
	[id_producto] [int] NOT NULL,
 CONSTRAINT [PK_dbo.t_stock_producto_almacen] PRIMARY KEY CLUSTERED 
(
	[id_stock_producto_almacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_tarjera_afiliacion_cuenta]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_tarjera_afiliacion_cuenta](
	[id_tarjeta_afiliacion_cuenta] [int] IDENTITY(1,1) NOT NULL,
	[fk_tarjeta_afiliacion] [int] NULL,
	[fk_cuenta] [int] NULL,
	[fecha_afiliacion] [datetime] NULL,
	[estado] [char](1) NULL,
 CONSTRAINT [PK_t_tarjera_afiliacion_cuenta] PRIMARY KEY CLUSTERED 
(
	[id_tarjeta_afiliacion_cuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_tarjeta_afiliacion]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_tarjeta_afiliacion](
	[id_tarjeta_afiliacion] [int] IDENTITY(1,1) NOT NULL,
	[fecha_vencimiento] [datetime] NULL,
	[numero_tarjeta] [nchar](12) NULL,
	[fecha_emision] [datetime] NULL,
	[estado] [char](1) NULL,
	[motivo] [nvarchar](500) NULL,
 CONSTRAINT [PK_t_tarjeta_afiliacion] PRIMARY KEY CLUSTERED 
(
	[id_tarjeta_afiliacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_ticket_canje]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_ticket_canje](
	[id_ticket_canje] [int] IDENTITY(1,1) NOT NULL,
	[numero_ticket] [nchar](30) NULL,
	[fecha_ticket] [date] NULL,
	[fk_cuenta] [int] NULL,
	[fk_tienda] [int] NULL,
	[puntos] [numeric](18, 0) NULL,
	[importe] [numeric](18, 2) NULL,
	[estado] [nchar](1) NULL,
 CONSTRAINT [PK_t_ticket_canje] PRIMARY KEY CLUSTERED 
(
	[id_ticket_canje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_ticket_transferencia]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_ticket_transferencia](
	[id_transferencia] [int] IDENTITY(1,1) NOT NULL,
	[puntos_transferidos] [int] NULL,
	[numero_ticket] [nvarchar](20) NULL,
	[fecha_transferencia] [datetime] NULL,
	[motivo_transferencia] [nvarchar](500) NULL,
	[cuenta_origen] [nvarchar](20) NULL,
	[fk_cuenta] [int] NULL,
	[cuenta_destino] [nvarchar](20) NULL,
 CONSTRAINT [PK_TRANSFERENCIA_PUNTOS_AFILIADO] PRIMARY KEY CLUSTERED 
(
	[id_transferencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_tienda]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_tienda](
	[id_tienda] [int] IDENTITY(1,1) NOT NULL,
	[nombre_tienda] [varchar](200) NULL,
	[nombre_direccion] [varchar](200) NULL,
	[fecha_apertura] [datetime] NULL,
	[distrito] [varchar](50) NULL,
	[provincia] [varchar](50) NULL,
	[departamento] [varchar](50) NULL,
	[tipo_tienda] [nchar](1) NULL,
	[pais] [nvarchar](25) NULL,
	[descripcion_tienda] [nvarchar](max) NULL,
	[latitud] [real] NULL,
	[id_zona] [int] NULL,
	[longitud] [real] NULL,
	[horario] [varchar](200) NULL,
 CONSTRAINT [PK_TIENDA] PRIMARY KEY CLUSTERED 
(
	[id_tienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_tipo_cambio]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_tipo_cambio](
	[id_tipo_cambio] [int] IDENTITY(1,1) NOT NULL,
	[id_moneda] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[compra] [decimal](4, 2) NOT NULL,
	[venta] [decimal](4, 2) NOT NULL,
 CONSTRAINT [pk_tipo_cambio] PRIMARY KEY CLUSTERED 
(
	[id_tipo_cambio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_tipo_comprobante]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_tipo_comprobante](
	[id_tipo_comprobante] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](20) NOT NULL,
	[abreviatura] [nvarchar](4) NOT NULL,
	[correlativo] [int] NOT NULL,
 CONSTRAINT [pk_tipo_comprobante] PRIMARY KEY CLUSTERED 
(
	[id_tipo_comprobante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_tipo_cuenta]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_tipo_cuenta](
	[id_tipo_cuenta] [int] NOT NULL,
	[tipo_cuenta] [nvarchar](20) NULL,
 CONSTRAINT [PK_t_tipo_cuenta] PRIMARY KEY CLUSTERED 
(
	[id_tipo_cuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_tipo_documento]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_tipo_documento](
	[id_tipo_documento] [int] NOT NULL,
	[tipo_documento] [nvarchar](50) NULL,
 CONSTRAINT [PK_t_tipo_documento] PRIMARY KEY CLUSTERED 
(
	[id_tipo_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_tipo_servicio]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_tipo_servicio](
	[id_tipo_servicio] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](20) NOT NULL,
	[porcentaje_comision] [decimal](18, 2) NOT NULL,
	[tipo] [char](1) NOT NULL,
	[habilitado ] [bit] NOT NULL,
 CONSTRAINT [pk_tipo_servicio] PRIMARY KEY CLUSTERED 
(
	[id_tipo_servicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_tipo_servicio_historico]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_tipo_servicio_historico](
	[id_tipo_servicio_historico] [int] IDENTITY(1,1) NOT NULL,
	[id_tipo_servicio] [int] NULL,
	[porcentaje_comision] [decimal](18, 2) NULL,
	[Fecha_registro] [datetime] NULL,
	[Usuario] [nvarchar](100) NULL,
 CONSTRAINT [pk_tipo_servicio_historico] PRIMARY KEY CLUSTERED 
(
	[id_tipo_servicio_historico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_transferencia_pago]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_transferencia_pago](
	[id_Transferenciapago] [int] IDENTITY(1,1) NOT NULL,
	[orden_pago] [varchar](100) NULL,
	[proveedor] [varchar](100) NULL,
	[fecha_registro] [varchar](11) NULL,
	[ffecha_registro] [int] NULL,
	[importe] [varchar](100) NULL,
	[banco] [varchar](100) NULL,
	[cuenta_corriente] [varchar](100) NULL,
	[moneda] [varchar](100) NULL,
	[nro_transferencia] [varchar](100) NULL,
	[banco_proveedor] [varchar](100) NULL,
	[cuenta_corriente_proveedor] [varchar](100) NULL,
	[moneda_proveedor] [varchar](100) NULL,
	[id_proveedor] [int] NULL,
	[id_banco] [int] NULL,
	[id_banco_proveedor] [int] NULL,
	[id_moneda] [int] NULL,
	[id_cuenta_origen] [int] NULL,
	[id_cuenta_destino] [int] NULL,
 CONSTRAINT [pK_t_transferencia_pago] PRIMARY KEY CLUSTERED 
(
	[id_Transferenciapago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_transporte]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_transporte](
	[id_transporte] [int] IDENTITY(1,1) NOT NULL,
	[nro_placa] [nvarchar](max) NULL,
	[modelo] [nvarchar](max) NULL,
	[marca] [nvarchar](max) NULL,
	[soat] [nvarchar](max) NULL,
	[tipo_transporte] [nvarchar](max) NULL,
	[capacidad] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_dbo.t_transporte] PRIMARY KEY CLUSTERED 
(
	[id_transporte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_turno]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_turno](
	[id_turno] [int] IDENTITY(1,1) NOT NULL,
	[descripcion_turno] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.t_turno] PRIMARY KEY CLUSTERED 
(
	[id_turno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_unidad_medida]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_unidad_medida](
	[id_unidad_medida] [int] IDENTITY(1,1) NOT NULL,
	[descripcion_unidad_medida] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.t_unidad_medida] PRIMARY KEY CLUSTERED 
(
	[id_unidad_medida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_venta]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_venta](
	[id_venta] [int] IDENTITY(1,1) NOT NULL,
	[fecha_hora] [datetime] NOT NULL,
	[id_cajero] [int] NOT NULL,
	[monto_soles] [decimal](18, 2) NOT NULL,
	[monto_dolares] [decimal](18, 2) NOT NULL,
	[subtotal] [decimal](18, 2) NOT NULL,
	[igv] [decimal](18, 2) NOT NULL,
	[estado] [nvarchar](20) NOT NULL,
	[descuento] [decimal](18, 2) NULL,
	[puntos_acumulados] [int] NULL,
	[id_tarjeta_afiliacion] [int] NULL,
	[id_tienda] [int] NULL,
	[tipo_venta] [int] NULL,
	[id_pago] [int] NULL,
 CONSTRAINT [pk_venta] PRIMARY KEY CLUSTERED 
(
	[id_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_zona]    Script Date: 15/06/2016 12:00:18 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_zona](
	[id_zona] [int] IDENTITY(1,1) NOT NULL,
	[descripcion_zona] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.t_zona] PRIMARY KEY CLUSTERED 
(
	[id_zona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[t_autorizacion] ON 

INSERT [dbo].[t_autorizacion] ([id_autorizacion], [accion], [codigo_autorizacion]) VALUES (1, N'AnularProducto', N'1234567890123456')
INSERT [dbo].[t_autorizacion] ([id_autorizacion], [accion], [codigo_autorizacion]) VALUES (2, N'AnularVenta', N'1234567890123456')
SET IDENTITY_INSERT [dbo].[t_autorizacion] OFF
SET IDENTITY_INSERT [dbo].[t_banco] ON 

INSERT [dbo].[t_banco] ([id_banco], [nombre]) VALUES (1, N'BCP')
INSERT [dbo].[t_banco] ([id_banco], [nombre]) VALUES (2, N'BBVA')
INSERT [dbo].[t_banco] ([id_banco], [nombre]) VALUES (3, N'SCOTIABANK')
INSERT [dbo].[t_banco] ([id_banco], [nombre]) VALUES (4, N'INTERBANK')
SET IDENTITY_INSERT [dbo].[t_banco] OFF
SET IDENTITY_INSERT [dbo].[t_cajero] ON 

INSERT [dbo].[t_cajero] ([id_cajero], [nombre], [apellidos]) VALUES (1, N'kvalidvia', NULL)
INSERT [dbo].[t_cajero] ([id_cajero], [nombre], [apellidos]) VALUES (2, N'rsanchez', NULL)
SET IDENTITY_INSERT [dbo].[t_cajero] OFF
SET IDENTITY_INSERT [dbo].[t_categoria_producto_canje] ON 

INSERT [dbo].[t_categoria_producto_canje] ([id_categoria_producto_canje], [nombre_categoria_producto]) VALUES (1, N'Electrohogar')
INSERT [dbo].[t_categoria_producto_canje] ([id_categoria_producto_canje], [nombre_categoria_producto]) VALUES (2, N'Tecnología')
INSERT [dbo].[t_categoria_producto_canje] ([id_categoria_producto_canje], [nombre_categoria_producto]) VALUES (3, N'Muebles')
INSERT [dbo].[t_categoria_producto_canje] ([id_categoria_producto_canje], [nombre_categoria_producto]) VALUES (4, N'Decohogar')
INSERT [dbo].[t_categoria_producto_canje] ([id_categoria_producto_canje], [nombre_categoria_producto]) VALUES (5, N'Dormitorio')
INSERT [dbo].[t_categoria_producto_canje] ([id_categoria_producto_canje], [nombre_categoria_producto]) VALUES (6, N'Deportes')
INSERT [dbo].[t_categoria_producto_canje] ([id_categoria_producto_canje], [nombre_categoria_producto]) VALUES (7, N'Moda y Accesorios')
INSERT [dbo].[t_categoria_producto_canje] ([id_categoria_producto_canje], [nombre_categoria_producto]) VALUES (8, N'Calzado')
INSERT [dbo].[t_categoria_producto_canje] ([id_categoria_producto_canje], [nombre_categoria_producto]) VALUES (9, N'Regalos')
INSERT [dbo].[t_categoria_producto_canje] ([id_categoria_producto_canje], [nombre_categoria_producto]) VALUES (10, N'Infantil')
INSERT [dbo].[t_categoria_producto_canje] ([id_categoria_producto_canje], [nombre_categoria_producto]) VALUES (11, N'Belleza')
SET IDENTITY_INSERT [dbo].[t_categoria_producto_canje] OFF
SET IDENTITY_INSERT [dbo].[t_cheque] ON 

INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (601, N'01434903', N'27/ENE/2016', 20160127, N'3917.00', 8, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (602, N'02874364', N'29/FEb/2016', 20160229, N'2566.00', 6, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (603, N'03205030', N'26/ENE/2016', 20160126, N'705.00', 7, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (604, N'02293494', N'19/MAR/2016', 20160319, N'1350.00', 7, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (605, N'01426484', N'11/MAY/2016', 20160511, N'3300.00', 7, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (606, N'06524357', N'24/FEb/2016', 20160224, N'775.00', 6, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (607, N'09574583', N'25/FEb/2016', 20160225, N'916.00', 6, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (608, N'09926817', N'17/FEb/2016', 20160217, N'3476.00', 8, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (609, N'03385655', N'22/FEb/2016', 20160222, N'1625.00', 5, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (610, N'07806244', N'22/JUN/2016', 20160622, N'1429.00', 8, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (611, N'03683853', N'10/ENE/2016', 20160110, N'1417.00', 6, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (612, N'05813927', N'15/FEb/2016', 20160215, N'2207.00', 7, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (613, N'07204998', N'14/JUN/2016', 20160614, N'2779.00', 6, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (614, N'07785284', N'13/JUN/2016', 20160613, N'2801.00', 5, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (615, N'09495644', N'18/MAY/2016', 20160518, N'3412.00', 6, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (616, N'04524187', N'27/MAR/2016', 20160327, N'3825.00', 6, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (617, N'06405315', N'15/MAY/2016', 20160515, N'1757.00', 6, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (618, N'09784865', N'23/JUN/2016', 20160623, N'3686.00', 6, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (619, N'07993585', N'11/MAR/2016', 20160311, N'3865.00', 6, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (620, N'06485082', N'23/MAR/2016', 20160323, N'795.00', 7, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (621, N'03815440', N'22/AbR/2016', 20160422, N'2651.00', 6, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (622, N'09765617', N'15/AbR/2016', 20160415, N'3558.00', 7, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (623, N'02614511', N'29/MAY/2016', 20160529, N'781.00', 7, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (624, N'09244147', N'18/FEb/2016', 20160218, N'3720.00', 5, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (625, N'08446585', N'15/MAY/2016', 20160515, N'3388.00', 7, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (626, N'08343278', N'11/MAY/2016', 20160511, N'3092.00', 7, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (627, N'05905080', N'22/AbR/2016', 20160422, N'983.00', 5, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (628, N'02686466', N'12/JUN/2016', 20160612, N'721.00', 5, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (629, N'04333730', N'18/MAR/2016', 20160318, N'3419.00', 6, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (630, N'03644583', N'13/MAY/2016', 20160513, N'2243.00', 6, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (631, N'06583953', N'21/ENE/2016', 20160121, N'2595.00', 7, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (632, N'08465435', N'20/MAR/2016', 20160320, N'2850.00', 8, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (633, N'06344993', N'20/MAR/2016', 20160320, N'1964.00', 8, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (634, N'04004328', N'13/MAR/2016', 20160313, N'3297.00', 5, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (635, N'04005414', N'21/MAR/2016', 20160321, N'159.00', 5, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (636, N'06555598', N'28/FEb/2016', 20160228, N'3499.00', 7, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (637, N'08566628', N'28/MAR/2016', 20160328, N'3840.00', 6, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (638, N'01576762', N'15/MAY/2016', 20160515, N'989.00', 5, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (639, N'01623783', N'15/FEb/2016', 20160215, N'770.00', 6, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (640, N'06103527', N'17/MAY/2016', 20160517, N'694.00', 8, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (641, N'04505278', N'26/MAY/2016', 20160526, N'808.00', 7, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (642, N'03835948', N'12/FEb/2016', 20160212, N'440.00', 7, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (643, N'04695876', N'12/JUN/2016', 20160612, N'1703.00', 5, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (644, N'06323803', N'29/FEb/2016', 20160229, N'1150.00', 6, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (645, N'02524937', N'28/MAY/2016', 20160528, N'2499.00', 8, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (646, N'01383697', N'22/MAR/2016', 20160322, N'2707.00', 7, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (647, N'09616776', N'14/JUN/2016', 20160614, N'586.00', 7, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (648, N'06355485', N'22/AbR/2016', 20160422, N'2072.00', 6, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (649, N'08364068', N'28/ENE/2016', 20160128, N'356.00', 8, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (650, N'02224503', N'11/FEb/2016', 20160211, N'268.00', 8, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (651, N'09375022', N'25/FEb/2016', 20160225, N'1301.00', 6, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (652, N'08563988', N'13/MAY/2016', 20160513, N'856.00', 6, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (653, N'02825777', N'12/ENE/2016', 20160112, N'1439.00', 6, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (654, N'09334728', N'29/MAR/2016', 20160329, N'911.00', 5, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (655, N'08834174', N'24/FEb/2016', 20160224, N'3357.00', 7, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (656, N'01623902', N'24/ENE/2016', 20160124, N'2825.00', 7, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (657, N'03153937', N'26/ENE/2016', 20160126, N'921.00', 7, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (658, N'05756423', N'29/MAY/2016', 20160529, N'4189.00', 8, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (659, N'05495912', N'23/FEb/2016', 20160223, N'1030.00', 7, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (660, N'09676182', N'21/AbR/2016', 20160421, N'731.00', 8, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (661, N'06286818', N'27/ENE/2016', 20160127, N'3663.00', 7, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (662, N'03696082', N'24/MAR/2016', 20160324, N'2913.00', 6, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (663, N'05776771', N'13/ENE/2016', 20160113, N'3396.00', 7, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (664, N'06504302', N'18/JUN/2016', 20160618, N'2987.00', 5, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (665, N'01274333', N'26/FEb/2016', 20160226, N'3511.00', 5, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (666, N'01246398', N'19/JUN/2016', 20160619, N'3310.00', 5, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (667, N'06773905', N'15/FEb/2016', 20160215, N'4072.00', 5, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (668, N'06103452', N'20/JUN/2016', 20160620, N'1918.00', 6, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (669, N'09793416', N'15/MAR/2016', 20160315, N'4085.00', 6, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (670, N'05363927', N'11/MAY/2016', 20160511, N'2887.00', 7, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (671, N'01423260', N'26/MAY/2016', 20160526, N'4075.00', 5, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (672, N'08244802', N'11/JUN/2016', 20160611, N'3974.00', 7, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (673, N'06364907', N'23/JUN/2016', 20160623, N'108.00', 5, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (674, N'02196484', N'27/FEb/2016', 20160227, N'3967.00', 6, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (675, N'03095243', N'16/JUN/2016', 20160616, N'1197.00', 8, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (676, N'09825791', N'15/ENE/2016', 20160115, N'3752.00', 5, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (677, N'05566110', N'13/MAR/2016', 20160313, N'940.00', 8, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (678, N'02176027', N'19/MAY/2016', 20160519, N'1296.00', 6, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (679, N'02264486', N'23/JUN/2016', 20160623, N'4100.00', 7, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (680, N'02765650', N'10/FEb/2016', 20160210, N'2260.00', 5, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (681, N'07383453', N'14/JUN/2016', 20160614, N'2046.00', 7, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (682, N'01945631', N'11/MAR/2016', 20160311, N'857.00', 6, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (683, N'01343906', N'25/JUN/2016', 20160625, N'3076.00', 6, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (684, N'07916150', N'25/ENE/2016', 20160125, N'786.00', 8, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (685, N'06086305', N'22/ENE/2016', 20160122, N'1278.00', 7, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (686, N'03534437', N'14/ENE/2016', 20160114, N'4127.00', 6, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (687, N'09033834', N'26/FEb/2016', 20160226, N'3927.00', 5, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (688, N'03694546', N'21/MAR/2016', 20160321, N'3910.00', 5, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (689, N'01543325', N'21/ENE/2016', 20160121, N'2619.00', 6, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (690, N'09555884', N'13/MAY/2016', 20160513, N'363.00', 6, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (691, N'09916192', N'25/JUN/2016', 20160625, N'2759.00', 6, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (692, N'03353568', N'27/ENE/2016', 20160127, N'1426.00', 7, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (693, N'07985858', N'28/MAR/2016', 20160328, N'1115.00', 5, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (694, N'01215708', N'25/MAR/2016', 20160325, N'2183.00', 5, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (695, N'06176088', N'13/MAR/2016', 20160313, N'1180.00', 7, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (696, N'02495223', N'24/MAR/2016', 20160324, N'1343.00', 6, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (697, N'08123542', N'16/AbR/2016', 20160416, N'2596.00', 8, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (698, N'01306385', N'23/MAY/2016', 20160523, N'3187.00', 7, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (699, N'09515026', N'10/MAY/2016', 20160510, N'3018.00', 6, 1, 3)
GO
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (700, N'01195270', N'24/JUN/2016', 20160624, N'2838.00', 8, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (701, N'04384456', N'28/FEb/2016', 20160228, N'3971.00', 5, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (702, N'01923742', N'22/ENE/2016', 20160122, N'3231.00', 6, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (703, N'05715543', N'23/MAY/2016', 20160523, N'4191.00', 5, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (704, N'04364775', N'15/ENE/2016', 20160115, N'1291.00', 6, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (705, N'09694883', N'29/AbR/2016', 20160429, N'1566.00', 7, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (706, N'08735875', N'19/MAR/2016', 20160319, N'1031.00', 6, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (707, N'09144301', N'21/ENE/2016', 20160121, N'916.00', 5, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (708, N'01805425', N'11/MAY/2016', 20160511, N'3426.00', 8, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (709, N'02855817', N'21/ENE/2016', 20160121, N'3452.00', 7, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (710, N'02556681', N'12/MAR/2016', 20160312, N'1530.00', 8, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (711, N'08655223', N'23/MAR/2016', 20160323, N'741.00', 8, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (712, N'04365462', N'17/ENE/2016', 20160117, N'266.00', 7, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (713, N'02625240', N'19/AbR/2016', 20160419, N'3068.00', 5, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (714, N'02535840', N'19/AbR/2016', 20160419, N'853.00', 8, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (715, N'09423848', N'25/ENE/2016', 20160125, N'1701.00', 8, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (716, N'03995894', N'13/MAR/2016', 20160313, N'4043.00', 5, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (717, N'05505501', N'28/MAR/2016', 20160328, N'1843.00', 5, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (718, N'01886078', N'14/ENE/2016', 20160114, N'742.00', 7, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (719, N'08534080', N'15/AbR/2016', 20160415, N'1494.00', 7, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (720, N'04445343', N'20/MAY/2016', 20160520, N'1848.00', 6, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (721, N'08295176', N'21/ENE/2016', 20160121, N'669.00', 7, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (722, N'09386392', N'10/JUN/2016', 20160610, N'816.00', 6, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (723, N'05086231', N'24/ENE/2016', 20160124, N'3321.00', 8, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (724, N'01834720', N'25/MAR/2016', 20160325, N'1826.00', 7, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (725, N'03026623', N'25/AbR/2016', 20160425, N'817.00', 7, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (726, N'02963623', N'11/MAR/2016', 20160311, N'3510.00', 8, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (727, N'08714228', N'17/MAR/2016', 20160317, N'2074.00', 6, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (728, N'07764160', N'11/FEb/2016', 20160211, N'720.00', 6, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (729, N'01985828', N'18/ENE/2016', 20160118, N'2036.00', 7, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (730, N'07995565', N'22/FEb/2016', 20160222, N'3716.00', 5, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (731, N'01655755', N'23/MAY/2016', 20160523, N'1205.00', 8, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (732, N'08883613', N'14/MAR/2016', 20160314, N'1135.00', 5, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (733, N'07094266', N'13/AbR/2016', 20160413, N'292.00', 6, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (734, N'07105696', N'23/FEb/2016', 20160223, N'3096.00', 5, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (735, N'06474470', N'11/MAY/2016', 20160511, N'2590.00', 5, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (736, N'05665145', N'15/MAY/2016', 20160515, N'2425.00', 5, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (737, N'05336771', N'14/JUN/2016', 20160614, N'3692.00', 5, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (738, N'01374165', N'15/FEb/2016', 20160215, N'719.00', 7, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (739, N'01475515', N'14/MAY/2016', 20160514, N'3165.00', 8, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (740, N'01166594', N'21/AbR/2016', 20160421, N'3720.00', 6, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (741, N'05406242', N'13/FEb/2016', 20160213, N'1040.00', 8, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (742, N'01566525', N'21/JUN/2016', 20160621, N'3313.00', 7, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (743, N'03866494', N'14/ENE/2016', 20160114, N'2134.00', 7, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (744, N'04925777', N'11/JUN/2016', 20160611, N'1315.00', 5, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (745, N'01914186', N'27/JUN/2016', 20160627, N'3185.00', 5, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (746, N'01705606', N'24/JUN/2016', 20160624, N'3803.00', 8, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (747, N'07435015', N'28/JUN/2016', 20160628, N'1669.00', 7, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (748, N'08014457', N'22/ENE/2016', 20160122, N'1198.00', 6, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (749, N'01245586', N'28/AbR/2016', 20160428, N'1362.00', 6, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (750, N'02695673', N'26/FEb/2016', 20160226, N'282.00', 8, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (751, N'08016835', N'28/AbR/2016', 20160428, N'2491.00', 8, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (752, N'06855538', N'16/MAR/2016', 20160316, N'3694.00', 5, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (753, N'07733427', N'20/MAY/2016', 20160520, N'1468.00', 5, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (754, N'07124121', N'18/FEb/2016', 20160218, N'3788.00', 5, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (755, N'04813714', N'15/AbR/2016', 20160415, N'1445.00', 7, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (756, N'03814225', N'25/AbR/2016', 20160425, N'3489.00', 6, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (757, N'02485502', N'12/MAY/2016', 20160512, N'2958.00', 6, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (758, N'06314438', N'21/ENE/2016', 20160121, N'2513.00', 6, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (759, N'04334494', N'13/ENE/2016', 20160113, N'314.00', 8, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (760, N'03434610', N'12/MAR/2016', 20160312, N'3358.00', 8, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (761, N'02194966', N'25/MAY/2016', 20160525, N'2628.00', 6, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (762, N'05984416', N'17/MAY/2016', 20160517, N'1529.00', 6, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (763, N'02105364', N'13/JUN/2016', 20160613, N'657.00', 6, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (764, N'05706413', N'25/JUN/2016', 20160625, N'3713.00', 7, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (765, N'06233824', N'14/ENE/2016', 20160114, N'3490.00', 7, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (766, N'09955514', N'25/MAY/2016', 20160525, N'2697.00', 6, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (767, N'02793846', N'29/ENE/2016', 20160129, N'1594.00', 5, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (768, N'07526070', N'15/ENE/2016', 20160115, N'1730.00', 5, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (769, N'02255906', N'15/MAY/2016', 20160515, N'1143.00', 7, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (770, N'08245671', N'13/AbR/2016', 20160413, N'3573.00', 7, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (771, N'08994596', N'20/MAY/2016', 20160520, N'1693.00', 5, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (772, N'09224740', N'27/JUN/2016', 20160627, N'3857.00', 6, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (773, N'04415924', N'22/AbR/2016', 20160422, N'3025.00', 8, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (774, N'01303655', N'16/MAY/2016', 20160516, N'1910.00', 6, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (775, N'03604464', N'19/AbR/2016', 20160419, N'3220.00', 8, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (776, N'08716183', N'22/FEb/2016', 20160222, N'1414.00', 6, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (777, N'01415464', N'12/MAR/2016', 20160312, N'3492.00', 7, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (778, N'01726373', N'25/ENE/2016', 20160125, N'4155.00', 6, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (779, N'09555055', N'19/AbR/2016', 20160419, N'537.00', 8, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (780, N'02013987', N'24/MAR/2016', 20160324, N'823.00', 6, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (781, N'01213753', N'21/MAY/2016', 20160521, N'3643.00', 8, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (782, N'06294526', N'29/MAR/2016', 20160329, N'3846.00', 7, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (783, N'04176243', N'10/MAR/2016', 20160310, N'3202.00', 7, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (784, N'08936766', N'20/ENE/2016', 20160120, N'1774.00', 8, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (785, N'03885328', N'24/ENE/2016', 20160124, N'623.00', 5, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (786, N'05823744', N'21/FEb/2016', 20160221, N'2229.00', 5, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (787, N'02854817', N'29/MAR/2016', 20160329, N'2413.00', 7, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (788, N'06594148', N'13/ENE/2016', 20160113, N'4019.00', 8, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (789, N'06555445', N'21/JUN/2016', 20160621, N'3897.00', 7, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (790, N'03433432', N'17/MAY/2016', 20160517, N'1964.00', 6, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (791, N'09864221', N'29/ENE/2016', 20160129, N'2122.00', 8, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (792, N'04616734', N'19/AbR/2016', 20160419, N'3290.00', 7, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (793, N'06365118', N'17/JUN/2016', 20160617, N'2465.00', 5, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (794, N'01653552', N'25/FEb/2016', 20160225, N'2400.00', 7, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (795, N'03726578', N'20/AbR/2016', 20160420, N'2716.00', 6, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (796, N'02503534', N'14/MAR/2016', 20160314, N'3006.00', 6, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (797, N'07054177', N'12/AbR/2016', 20160412, N'4023.00', 5, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (798, N'05646493', N'26/JUN/2016', 20160626, N'2803.00', 8, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (799, N'05026494', N'28/AbR/2016', 20160428, N'2965.00', 7, 1, 4)
GO
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (800, N'03564953', N'22/AbR/2016', 20160422, N'640.00', 7, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (801, N'09805608', N'28/MAR/2016', 20160328, N'1375.00', 8, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (802, N'01903391', N'20/JUN/2016', 20160620, N'1961.00', 7, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (803, N'02476362', N'20/FEb/2016', 20160220, N'2051.00', 5, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (804, N'06954426', N'29/JUN/2016', 20160629, N'2669.00', 8, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (805, N'09746756', N'17/MAR/2016', 20160317, N'1013.00', 5, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (806, N'04665295', N'25/JUN/2016', 20160625, N'2547.00', 7, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (807, N'09383788', N'28/MAY/2016', 20160528, N'2836.00', 8, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (808, N'06986765', N'16/AbR/2016', 20160416, N'2289.00', 8, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (809, N'07005664', N'28/MAR/2016', 20160328, N'2784.00', 8, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (810, N'01724650', N'15/AbR/2016', 20160415, N'2340.00', 8, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (811, N'04946816', N'15/AbR/2016', 20160415, N'3411.00', 7, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (812, N'06753625', N'23/AbR/2016', 20160423, N'208.00', 8, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (813, N'06674028', N'29/AbR/2016', 20160429, N'3997.00', 7, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (814, N'09084845', N'25/AbR/2016', 20160425, N'1717.00', 6, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (815, N'07213740', N'25/FEb/2016', 20160225, N'3790.00', 5, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (816, N'01246720', N'23/JUN/2016', 20160623, N'3350.00', 8, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (817, N'04815218', N'21/MAY/2016', 20160521, N'2483.00', 6, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (818, N'02963528', N'26/FEb/2016', 20160226, N'1240.00', 5, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (819, N'04264293', N'12/JUN/2016', 20160612, N'3483.00', 5, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (820, N'06126818', N'16/MAR/2016', 20160316, N'2992.00', 5, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (821, N'09026098', N'26/AbR/2016', 20160426, N'3498.00', 8, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (822, N'03866546', N'25/MAR/2016', 20160325, N'482.00', 5, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (823, N'08443853', N'26/MAY/2016', 20160526, N'2003.00', 8, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (824, N'02934770', N'22/MAR/2016', 20160322, N'2057.00', 6, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (825, N'03254103', N'29/FEb/2016', 20160229, N'1449.00', 6, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (826, N'05586814', N'29/FEb/2016', 20160229, N'1108.00', 6, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (827, N'02583887', N'15/FEb/2016', 20160215, N'303.00', 7, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (828, N'02415535', N'25/ENE/2016', 20160125, N'1912.00', 5, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (829, N'09604937', N'28/FEb/2016', 20160228, N'4131.00', 8, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (830, N'02954158', N'19/AbR/2016', 20160419, N'3803.00', 5, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (831, N'02626242', N'29/JUN/2016', 20160629, N'992.00', 6, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (832, N'05324031', N'23/JUN/2016', 20160623, N'2765.00', 7, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (833, N'01514432', N'10/FEb/2016', 20160210, N'3851.00', 6, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (834, N'07544537', N'13/MAY/2016', 20160513, N'1298.00', 6, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (835, N'07225642', N'28/MAY/2016', 20160528, N'1447.00', 5, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (836, N'08266814', N'28/ENE/2016', 20160128, N'3240.00', 6, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (837, N'03276037', N'26/MAY/2016', 20160526, N'3710.00', 5, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (838, N'06815534', N'21/JUN/2016', 20160621, N'3744.00', 5, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (839, N'03644788', N'18/AbR/2016', 20160418, N'168.00', 6, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (840, N'04734090', N'13/FEb/2016', 20160213, N'1783.00', 8, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (841, N'05833790', N'17/JUN/2016', 20160617, N'2742.00', 5, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (842, N'02134586', N'22/AbR/2016', 20160422, N'1603.00', 5, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (843, N'05976494', N'29/MAR/2016', 20160329, N'3703.00', 8, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (844, N'06405174', N'18/AbR/2016', 20160418, N'3649.00', 8, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (845, N'03605313', N'12/FEb/2016', 20160212, N'3815.00', 6, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (846, N'08164338', N'21/FEb/2016', 20160221, N'3708.00', 5, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (847, N'03465677', N'11/MAR/2016', 20160311, N'3652.00', 8, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (848, N'07664990', N'11/MAY/2016', 20160511, N'2025.00', 7, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (849, N'03334910', N'24/JUN/2016', 20160624, N'2788.00', 7, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (850, N'03804140', N'12/MAY/2016', 20160512, N'2316.00', 8, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (851, N'05163585', N'21/MAY/2016', 20160521, N'1118.00', 6, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (852, N'05675531', N'15/MAY/2016', 20160515, N'3522.00', 7, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (853, N'06276585', N'22/ENE/2016', 20160122, N'2288.00', 7, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (854, N'06193615', N'23/FEb/2016', 20160223, N'2917.00', 6, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (855, N'09424160', N'26/FEb/2016', 20160226, N'2101.00', 5, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (856, N'02814251', N'23/JUN/2016', 20160623, N'275.00', 8, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (857, N'06633448', N'10/FEb/2016', 20160210, N'4139.00', 8, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (858, N'04784696', N'11/ENE/2016', 20160111, N'795.00', 7, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (859, N'08526758', N'18/JUN/2016', 20160618, N'2090.00', 5, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (860, N'03205533', N'26/ENE/2016', 20160126, N'1903.00', 6, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (861, N'02074610', N'15/FEb/2016', 20160215, N'1455.00', 7, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (862, N'02926790', N'15/JUN/2016', 20160615, N'3234.00', 8, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (863, N'08933761', N'15/AbR/2016', 20160415, N'3918.00', 6, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (864, N'03036326', N'11/MAR/2016', 20160311, N'1222.00', 7, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (865, N'02174560', N'24/MAY/2016', 20160524, N'1373.00', 7, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (866, N'07256792', N'18/ENE/2016', 20160118, N'633.00', 5, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (867, N'04185895', N'16/MAY/2016', 20160516, N'647.00', 6, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (868, N'03995351', N'28/AbR/2016', 20160428, N'3013.00', 5, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (869, N'03254325', N'14/AbR/2016', 20160414, N'1862.00', 6, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (870, N'07583912', N'11/MAY/2016', 20160511, N'1688.00', 5, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (871, N'06033348', N'18/ENE/2016', 20160118, N'3965.00', 5, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (872, N'05034918', N'16/MAY/2016', 20160516, N'3932.00', 8, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (873, N'07765737', N'28/MAY/2016', 20160528, N'3233.00', 6, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (874, N'06935943', N'15/MAR/2016', 20160315, N'1100.00', 5, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (875, N'02736771', N'17/MAR/2016', 20160317, N'235.00', 5, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (876, N'09776418', N'20/AbR/2016', 20160420, N'4171.00', 8, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (877, N'03305235', N'26/ENE/2016', 20160126, N'2320.00', 5, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (878, N'08085252', N'23/MAY/2016', 20160523, N'1359.00', 5, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (879, N'02115366', N'22/JUN/2016', 20160622, N'4123.00', 7, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (880, N'02594147', N'22/MAR/2016', 20160322, N'2386.00', 8, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (881, N'09164628', N'17/AbR/2016', 20160417, N'2398.00', 8, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (882, N'03634922', N'17/AbR/2016', 20160417, N'2224.00', 5, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (883, N'03193537', N'18/JUN/2016', 20160618, N'1761.00', 6, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (884, N'09573863', N'19/MAR/2016', 20160319, N'3325.00', 8, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (885, N'02846043', N'26/AbR/2016', 20160426, N'3445.00', 5, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (886, N'03243976', N'29/FEb/2016', 20160229, N'447.00', 7, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (887, N'08466482', N'19/JUN/2016', 20160619, N'3356.00', 6, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (888, N'09365615', N'12/ENE/2016', 20160112, N'3079.00', 6, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (889, N'07075832', N'23/ENE/2016', 20160123, N'1026.00', 8, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (890, N'01965321', N'25/ENE/2016', 20160125, N'854.00', 5, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (891, N'07544758', N'23/JUN/2016', 20160623, N'4008.00', 8, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (892, N'07004517', N'12/FEb/2016', 20160212, N'1857.00', 6, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (893, N'05745203', N'27/MAY/2016', 20160527, N'3974.00', 8, 1, 1)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (894, N'02003846', N'12/FEb/2016', 20160212, N'3362.00', 8, 1, 4)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (895, N'09915890', N'27/AbR/2016', 20160427, N'160.00', 7, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (896, N'06173545', N'16/AbR/2016', 20160416, N'1991.00', 7, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (897, N'07544995', N'23/MAY/2016', 20160523, N'2634.00', 8, 1, 3)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (898, N'03745917', N'12/MAR/2016', 20160312, N'2724.00', 6, 1, 2)
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (899, N'05394413', N'18/MAY/2016', 20160518, N'3132.00', 6, 1, 4)
GO
INSERT [dbo].[t_cheque] ([id_cheque], [numero_cheque], [fecha_emision], [ffecha_emision], [importe], [id_proveedor], [id_moneda], [id_banco]) VALUES (900, N'03035923', N'11/MAY/2016', 20160511, N'2849.00', 7, 1, 3)
SET IDENTITY_INSERT [dbo].[t_cheque] OFF
SET IDENTITY_INSERT [dbo].[t_cronograma] ON 

INSERT [dbo].[t_cronograma] ([id_Cronograma], [nro_cronograma], [fecha_inicio], [ffecha_inicio], [fecha_fin], [ffecha_fin], [estado], [observaciones]) VALUES (1, N'1262', N'01/ENE/2016', 20160101, N'07/ENE/2016', 20160107, N'Aprobado', N'-')
INSERT [dbo].[t_cronograma] ([id_Cronograma], [nro_cronograma], [fecha_inicio], [ffecha_inicio], [fecha_fin], [ffecha_fin], [estado], [observaciones]) VALUES (2, N'2608', N'08/ENE/2016', 20160108, N'15/ENE/2016', 20160115, N'Aprobado', N'-')
INSERT [dbo].[t_cronograma] ([id_Cronograma], [nro_cronograma], [fecha_inicio], [ffecha_inicio], [fecha_fin], [ffecha_fin], [estado], [observaciones]) VALUES (3, N'2065', N'16/ENE/2016', 20160116, N'22/ENE/2016', 20160122, N'Aprobado', N'-')
INSERT [dbo].[t_cronograma] ([id_Cronograma], [nro_cronograma], [fecha_inicio], [ffecha_inicio], [fecha_fin], [ffecha_fin], [estado], [observaciones]) VALUES (4, N'3494', N'23/ENE/2016', 20160123, N'31/ENE/2016', 20160131, N'Aprobado', N'-')
INSERT [dbo].[t_cronograma] ([id_Cronograma], [nro_cronograma], [fecha_inicio], [ffecha_inicio], [fecha_fin], [ffecha_fin], [estado], [observaciones]) VALUES (5, N'2676', N'01/FEb/2016', 20160201, N'07/FEb/2016', 20160207, N'Aprobado', N'-')
INSERT [dbo].[t_cronograma] ([id_Cronograma], [nro_cronograma], [fecha_inicio], [ffecha_inicio], [fecha_fin], [ffecha_fin], [estado], [observaciones]) VALUES (6, N'2327', N'08/FEb/2016', 20160208, N'14/FEb/2016', 20160214, N'Aprobado', N'-')
INSERT [dbo].[t_cronograma] ([id_Cronograma], [nro_cronograma], [fecha_inicio], [ffecha_inicio], [fecha_fin], [ffecha_fin], [estado], [observaciones]) VALUES (7, N'2416', N'15/FEb/2016', 20160215, N'21/FEb/2016', 20160221, N'Rechazado', N'Se tienen Ordenes de pago pendientes')
INSERT [dbo].[t_cronograma] ([id_Cronograma], [nro_cronograma], [fecha_inicio], [ffecha_inicio], [fecha_fin], [ffecha_fin], [estado], [observaciones]) VALUES (8, N'1401', N'22/FEb/2016', 20160222, N'29/FEb/2016', 20160229, N'Aprobado', N'-')
INSERT [dbo].[t_cronograma] ([id_Cronograma], [nro_cronograma], [fecha_inicio], [ffecha_inicio], [fecha_fin], [ffecha_fin], [estado], [observaciones]) VALUES (9, N'2844', N'01/MAR/2016', 20160301, N'07/MAR/2016', 20160307, N'Aprobado', N'-')
INSERT [dbo].[t_cronograma] ([id_Cronograma], [nro_cronograma], [fecha_inicio], [ffecha_inicio], [fecha_fin], [ffecha_fin], [estado], [observaciones]) VALUES (10, N'1083', N'08/MAR/2016', 20160308, N'14/MAR/2016', 20160314, N'Aprobado', N'-')
INSERT [dbo].[t_cronograma] ([id_Cronograma], [nro_cronograma], [fecha_inicio], [ffecha_inicio], [fecha_fin], [ffecha_fin], [estado], [observaciones]) VALUES (11, N'3639', N'15/MAR/2016', 20160315, N'21/MAR/2016', 20160321, N'Aprobado', N'-')
INSERT [dbo].[t_cronograma] ([id_Cronograma], [nro_cronograma], [fecha_inicio], [ffecha_inicio], [fecha_fin], [ffecha_fin], [estado], [observaciones]) VALUES (12, N'2790', N'22/MAR/2016', 20160322, N'31/MAR/2016', 20160331, N'Aprobado', N'-')
INSERT [dbo].[t_cronograma] ([id_Cronograma], [nro_cronograma], [fecha_inicio], [ffecha_inicio], [fecha_fin], [ffecha_fin], [estado], [observaciones]) VALUES (13, N'1218', N'01/AbR/2016', 20160401, N'07/AbR/2016', 20160407, N'Aprobado', N'-')
INSERT [dbo].[t_cronograma] ([id_Cronograma], [nro_cronograma], [fecha_inicio], [ffecha_inicio], [fecha_fin], [ffecha_fin], [estado], [observaciones]) VALUES (14, N'2638', N'08/AbR/2016', 20160408, N'14/AbR/2016', 20160414, N'Aprobado', N'-')
INSERT [dbo].[t_cronograma] ([id_Cronograma], [nro_cronograma], [fecha_inicio], [ffecha_inicio], [fecha_fin], [ffecha_fin], [estado], [observaciones]) VALUES (15, N'3403', N'15/AbR/2016', 20160415, N'21/AbR/2016', 20160421, N'Aprobado', N'-')
INSERT [dbo].[t_cronograma] ([id_Cronograma], [nro_cronograma], [fecha_inicio], [ffecha_inicio], [fecha_fin], [ffecha_fin], [estado], [observaciones]) VALUES (16, N'3523', N'22/AbR/2016', 20160422, N'28/AbR/2016', 20160428, N'Rechazado', N'Se tienen Ordenes de pago pendientes')
INSERT [dbo].[t_cronograma] ([id_Cronograma], [nro_cronograma], [fecha_inicio], [ffecha_inicio], [fecha_fin], [ffecha_fin], [estado], [observaciones]) VALUES (17, N'2904', N'29/AbR/2016', 20160429, N'05/MAY/2016', 20160505, N'Aprobado', N'-')
INSERT [dbo].[t_cronograma] ([id_Cronograma], [nro_cronograma], [fecha_inicio], [ffecha_inicio], [fecha_fin], [ffecha_fin], [estado], [observaciones]) VALUES (18, N'3146', N'06/MAY/2016', 20160506, N'13/MAY/2016', 20160513, N'Aprobado', N'-')
INSERT [dbo].[t_cronograma] ([id_Cronograma], [nro_cronograma], [fecha_inicio], [ffecha_inicio], [fecha_fin], [ffecha_fin], [estado], [observaciones]) VALUES (19, N'1424', N'14/MAY/2016', 20160514, N'20/MAY/2016', 20160520, N'Rechazado', N'El cronograma es rechazado po tener órdenes de pagos pendientes')
INSERT [dbo].[t_cronograma] ([id_Cronograma], [nro_cronograma], [fecha_inicio], [ffecha_inicio], [fecha_fin], [ffecha_fin], [estado], [observaciones]) VALUES (20, N'1637', N'21/MAY/2016', 20160521, N'27/MAY/2016', 20160527, N'Aprobado', N'-')
SET IDENTITY_INSERT [dbo].[t_cronograma] OFF
SET IDENTITY_INSERT [dbo].[t_cuenta] ON 

INSERT [dbo].[t_cuenta] ([id_cuenta], [numero_cuenta], [fecha_alta], [fecha_baja], [puntos], [estado_cuenta], [fk_tipo_cuenta], [fk_cuenta], [fk_ficha_afiliacion]) VALUES (1, N'9020164254560601', CAST(N'2016-01-12 00:00:00.000' AS DateTime), NULL, CAST(754 AS Numeric(18, 0)), N'A', 1, NULL, 1)
INSERT [dbo].[t_cuenta] ([id_cuenta], [numero_cuenta], [fecha_alta], [fecha_baja], [puntos], [estado_cuenta], [fk_tipo_cuenta], [fk_cuenta], [fk_ficha_afiliacion]) VALUES (2, N'9020163854502401', CAST(N'2016-06-04 00:00:00.000' AS DateTime), NULL, CAST(100 AS Numeric(18, 0)), N'A', 1, NULL, 2)
INSERT [dbo].[t_cuenta] ([id_cuenta], [numero_cuenta], [fecha_alta], [fecha_baja], [puntos], [estado_cuenta], [fk_tipo_cuenta], [fk_cuenta], [fk_ficha_afiliacion]) VALUES (3, N'9020154567890001', CAST(N'2015-11-20 00:00:00.000' AS DateTime), NULL, CAST(620 AS Numeric(18, 0)), N'A', 2, 1, 3)
INSERT [dbo].[t_cuenta] ([id_cuenta], [numero_cuenta], [fecha_alta], [fecha_baja], [puntos], [estado_cuenta], [fk_tipo_cuenta], [fk_cuenta], [fk_ficha_afiliacion]) VALUES (4, N'9020163965254501', CAST(N'2016-01-20 00:00:00.000' AS DateTime), NULL, CAST(0 AS Numeric(18, 0)), N'I', 2, 1, 4)
SET IDENTITY_INSERT [dbo].[t_cuenta] OFF
SET IDENTITY_INSERT [dbo].[t_cuenta_bancaria] ON 

INSERT [dbo].[t_cuenta_bancaria] ([id_Cuentabancaria], [nro_cuenta], [tiipo]) VALUES (1, N'0010-3063-54-0-1', N'Origen')
INSERT [dbo].[t_cuenta_bancaria] ([id_Cuentabancaria], [nro_cuenta], [tiipo]) VALUES (2, N'0011-1127-73-0-1', N'Origen')
INSERT [dbo].[t_cuenta_bancaria] ([id_Cuentabancaria], [nro_cuenta], [tiipo]) VALUES (3, N'0011-1443-75-0-1', N'Origen')
INSERT [dbo].[t_cuenta_bancaria] ([id_Cuentabancaria], [nro_cuenta], [tiipo]) VALUES (4, N'0011-1806-17-0-1', N'Origen')
INSERT [dbo].[t_cuenta_bancaria] ([id_Cuentabancaria], [nro_cuenta], [tiipo]) VALUES (5, N'0011-2071-28-0-1', N'Origen')
INSERT [dbo].[t_cuenta_bancaria] ([id_Cuentabancaria], [nro_cuenta], [tiipo]) VALUES (6, N'0011-2136-12-0-1', N'Origen')
INSERT [dbo].[t_cuenta_bancaria] ([id_Cuentabancaria], [nro_cuenta], [tiipo]) VALUES (7, N'0011-2733-75-0-1', N'Origen')
INSERT [dbo].[t_cuenta_bancaria] ([id_Cuentabancaria], [nro_cuenta], [tiipo]) VALUES (8, N'0013-2514-38-0-1', N'Origen')
INSERT [dbo].[t_cuenta_bancaria] ([id_Cuentabancaria], [nro_cuenta], [tiipo]) VALUES (9, N'0014-1791-62-0-1', N'Origen')
INSERT [dbo].[t_cuenta_bancaria] ([id_Cuentabancaria], [nro_cuenta], [tiipo]) VALUES (10, N'0014-2937-86-0-1', N'Origen')
INSERT [dbo].[t_cuenta_bancaria] ([id_Cuentabancaria], [nro_cuenta], [tiipo]) VALUES (11, N'0010-2001-60-0-1', N'Destino')
INSERT [dbo].[t_cuenta_bancaria] ([id_Cuentabancaria], [nro_cuenta], [tiipo]) VALUES (12, N'0010-2876-13-0-1', N'Destino')
INSERT [dbo].[t_cuenta_bancaria] ([id_Cuentabancaria], [nro_cuenta], [tiipo]) VALUES (13, N'0011-1360-13-0-1', N'Destino')
INSERT [dbo].[t_cuenta_bancaria] ([id_Cuentabancaria], [nro_cuenta], [tiipo]) VALUES (14, N'0011-2737-90-0-1', N'Destino')
INSERT [dbo].[t_cuenta_bancaria] ([id_Cuentabancaria], [nro_cuenta], [tiipo]) VALUES (15, N'0011-3288-34-0-1', N'Destino')
INSERT [dbo].[t_cuenta_bancaria] ([id_Cuentabancaria], [nro_cuenta], [tiipo]) VALUES (16, N'0012-2449-88-0-1', N'Destino')
INSERT [dbo].[t_cuenta_bancaria] ([id_Cuentabancaria], [nro_cuenta], [tiipo]) VALUES (17, N'0012-3021-54-0-1', N'Destino')
INSERT [dbo].[t_cuenta_bancaria] ([id_Cuentabancaria], [nro_cuenta], [tiipo]) VALUES (18, N'0012-3520-44-0-1', N'Destino')
INSERT [dbo].[t_cuenta_bancaria] ([id_Cuentabancaria], [nro_cuenta], [tiipo]) VALUES (19, N'0012-3620-76-0-1', N'Destino')
INSERT [dbo].[t_cuenta_bancaria] ([id_Cuentabancaria], [nro_cuenta], [tiipo]) VALUES (20, N'0013-1363-66-0-1', N'Destino')
INSERT [dbo].[t_cuenta_bancaria] ([id_Cuentabancaria], [nro_cuenta], [tiipo]) VALUES (21, N'0011-8787-22-0-1', N'Destino')
SET IDENTITY_INSERT [dbo].[t_cuenta_bancaria] OFF
INSERT [dbo].[t_detalle_ticket_canje] ([id_ticket_canje], [id_modalidad_canje], [cantidad], [subtotal_puntos], [subtotal_importe]) VALUES (3, 1, CAST(2 AS Numeric(18, 0)), CAST(160 AS Numeric(18, 0)), CAST(0.00 AS Numeric(18, 2)))
INSERT [dbo].[t_detalle_ticket_canje] ([id_ticket_canje], [id_modalidad_canje], [cantidad], [subtotal_puntos], [subtotal_importe]) VALUES (3, 9, CAST(4 AS Numeric(18, 0)), CAST(40 AS Numeric(18, 0)), CAST(80.00 AS Numeric(18, 2)))
INSERT [dbo].[t_detalle_ticket_canje] ([id_ticket_canje], [id_modalidad_canje], [cantidad], [subtotal_puntos], [subtotal_importe]) VALUES (4, 4, CAST(2 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(160.00 AS Numeric(18, 2)))
INSERT [dbo].[t_detalle_ticket_canje] ([id_ticket_canje], [id_modalidad_canje], [cantidad], [subtotal_puntos], [subtotal_importe]) VALUES (5, 2, CAST(1 AS Numeric(18, 0)), CAST(20 AS Numeric(18, 0)), CAST(30.00 AS Numeric(18, 2)))
INSERT [dbo].[t_detalle_ticket_canje] ([id_ticket_canje], [id_modalidad_canje], [cantidad], [subtotal_puntos], [subtotal_importe]) VALUES (5, 8, CAST(2 AS Numeric(18, 0)), CAST(50 AS Numeric(18, 0)), CAST(0.00 AS Numeric(18, 2)))
INSERT [dbo].[t_detalle_ticket_canje] ([id_ticket_canje], [id_modalidad_canje], [cantidad], [subtotal_puntos], [subtotal_importe]) VALUES (6, 2, CAST(2 AS Numeric(18, 0)), CAST(40 AS Numeric(18, 0)), CAST(60.00 AS Numeric(18, 2)))
INSERT [dbo].[t_detalle_ticket_canje] ([id_ticket_canje], [id_modalidad_canje], [cantidad], [subtotal_puntos], [subtotal_importe]) VALUES (6, 5, CAST(4 AS Numeric(18, 0)), CAST(160 AS Numeric(18, 0)), CAST(0.00 AS Numeric(18, 2)))
INSERT [dbo].[t_detalle_ticket_canje] ([id_ticket_canje], [id_modalidad_canje], [cantidad], [subtotal_puntos], [subtotal_importe]) VALUES (7, 1, CAST(4 AS Numeric(18, 0)), CAST(320 AS Numeric(18, 0)), CAST(0.00 AS Numeric(18, 2)))
INSERT [dbo].[t_detalle_ticket_canje] ([id_ticket_canje], [id_modalidad_canje], [cantidad], [subtotal_puntos], [subtotal_importe]) VALUES (7, 9, CAST(1 AS Numeric(18, 0)), CAST(10 AS Numeric(18, 0)), CAST(20.00 AS Numeric(18, 2)))
INSERT [dbo].[t_detalle_ticket_canje] ([id_ticket_canje], [id_modalidad_canje], [cantidad], [subtotal_puntos], [subtotal_importe]) VALUES (8, 4, CAST(1 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(80.00 AS Numeric(18, 2)))
INSERT [dbo].[t_detalle_ticket_canje] ([id_ticket_canje], [id_modalidad_canje], [cantidad], [subtotal_puntos], [subtotal_importe]) VALUES (9, 9, CAST(1 AS Numeric(18, 0)), CAST(10 AS Numeric(18, 0)), CAST(20.00 AS Numeric(18, 2)))
INSERT [dbo].[t_detalle_ticket_canje] ([id_ticket_canje], [id_modalidad_canje], [cantidad], [subtotal_puntos], [subtotal_importe]) VALUES (10, 5, CAST(1 AS Numeric(18, 0)), CAST(40 AS Numeric(18, 0)), CAST(0.00 AS Numeric(18, 2)))
INSERT [dbo].[t_detalle_ticket_canje] ([id_ticket_canje], [id_modalidad_canje], [cantidad], [subtotal_puntos], [subtotal_importe]) VALUES (10, 6, CAST(1 AS Numeric(18, 0)), CAST(80 AS Numeric(18, 0)), CAST(0.00 AS Numeric(18, 2)))
INSERT [dbo].[t_detalle_ticket_canje] ([id_ticket_canje], [id_modalidad_canje], [cantidad], [subtotal_puntos], [subtotal_importe]) VALUES (11, 4, CAST(1 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(80.00 AS Numeric(18, 2)))
INSERT [dbo].[t_detalle_ticket_canje] ([id_ticket_canje], [id_modalidad_canje], [cantidad], [subtotal_puntos], [subtotal_importe]) VALUES (13, 5, CAST(8 AS Numeric(18, 0)), CAST(320 AS Numeric(18, 0)), CAST(0.00 AS Numeric(18, 2)))
INSERT [dbo].[t_detalle_ticket_canje] ([id_ticket_canje], [id_modalidad_canje], [cantidad], [subtotal_puntos], [subtotal_importe]) VALUES (14, 5, CAST(8 AS Numeric(18, 0)), CAST(320 AS Numeric(18, 0)), CAST(0.00 AS Numeric(18, 2)))
INSERT [dbo].[t_detalle_ticket_canje] ([id_ticket_canje], [id_modalidad_canje], [cantidad], [subtotal_puntos], [subtotal_importe]) VALUES (15, 1, CAST(1 AS Numeric(18, 0)), CAST(80 AS Numeric(18, 0)), CAST(0.00 AS Numeric(18, 2)))
INSERT [dbo].[t_detalle_ticket_canje] ([id_ticket_canje], [id_modalidad_canje], [cantidad], [subtotal_puntos], [subtotal_importe]) VALUES (16, 7, CAST(1 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(40.00 AS Numeric(18, 2)))
INSERT [dbo].[t_detalle_ticket_canje] ([id_ticket_canje], [id_modalidad_canje], [cantidad], [subtotal_puntos], [subtotal_importe]) VALUES (17, 1, CAST(2 AS Numeric(18, 0)), CAST(160 AS Numeric(18, 0)), CAST(0.00 AS Numeric(18, 2)))
INSERT [dbo].[t_detalle_ticket_canje] ([id_ticket_canje], [id_modalidad_canje], [cantidad], [subtotal_puntos], [subtotal_importe]) VALUES (18, 6, CAST(1 AS Numeric(18, 0)), CAST(80 AS Numeric(18, 0)), CAST(0.00 AS Numeric(18, 2)))
INSERT [dbo].[t_detalle_ticket_canje] ([id_ticket_canje], [id_modalidad_canje], [cantidad], [subtotal_puntos], [subtotal_importe]) VALUES (19, 1, CAST(1 AS Numeric(18, 0)), CAST(80 AS Numeric(18, 0)), CAST(0.00 AS Numeric(18, 2)))
INSERT [dbo].[t_detalle_ticket_canje] ([id_ticket_canje], [id_modalidad_canje], [cantidad], [subtotal_puntos], [subtotal_importe]) VALUES (20, 6, CAST(1 AS Numeric(18, 0)), CAST(80 AS Numeric(18, 0)), CAST(0.00 AS Numeric(18, 2)))
INSERT [dbo].[t_detalle_ticket_canje] ([id_ticket_canje], [id_modalidad_canje], [cantidad], [subtotal_puntos], [subtotal_importe]) VALUES (21, 7, CAST(1 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(40.00 AS Numeric(18, 2)))
SET IDENTITY_INSERT [dbo].[t_deuda] ON 

INSERT [dbo].[t_deuda] ([id_deuda], [id_tipo_servicio], [monto_soles], [estado], [numero_documento], [fecha_vencimiento]) VALUES (1, 1, CAST(67.20 AS Decimal(18, 2)), N'Pagado', N'1111111', CAST(N'2016-05-12 00:00:00.000' AS DateTime))
INSERT [dbo].[t_deuda] ([id_deuda], [id_tipo_servicio], [monto_soles], [estado], [numero_documento], [fecha_vencimiento]) VALUES (2, 3, CAST(120.10 AS Decimal(18, 2)), N'Pendiente', N'2222222', CAST(N'2016-05-11 00:00:00.000' AS DateTime))
INSERT [dbo].[t_deuda] ([id_deuda], [id_tipo_servicio], [monto_soles], [estado], [numero_documento], [fecha_vencimiento]) VALUES (3, 5, CAST(50.80 AS Decimal(18, 2)), N'Pendiente', N'333333333', CAST(N'2016-05-12 00:00:00.000' AS DateTime))
INSERT [dbo].[t_deuda] ([id_deuda], [id_tipo_servicio], [monto_soles], [estado], [numero_documento], [fecha_vencimiento]) VALUES (4, 13, CAST(200.30 AS Decimal(18, 2)), N'Pendiente', N'444444444', CAST(N'2016-05-12 00:00:00.000' AS DateTime))
INSERT [dbo].[t_deuda] ([id_deuda], [id_tipo_servicio], [monto_soles], [estado], [numero_documento], [fecha_vencimiento]) VALUES (5, 8, CAST(57.30 AS Decimal(18, 2)), N'Pendiente', N'555555555', CAST(N'2016-05-12 00:00:00.000' AS DateTime))
INSERT [dbo].[t_deuda] ([id_deuda], [id_tipo_servicio], [monto_soles], [estado], [numero_documento], [fecha_vencimiento]) VALUES (6, 14, CAST(89.90 AS Decimal(18, 2)), N'Pendiente', N'666666666', CAST(N'2016-05-12 00:00:00.000' AS DateTime))
INSERT [dbo].[t_deuda] ([id_deuda], [id_tipo_servicio], [monto_soles], [estado], [numero_documento], [fecha_vencimiento]) VALUES (7, 7, CAST(10.20 AS Decimal(18, 2)), N'Pendiente', N'777777777', CAST(N'2016-05-12 00:00:00.000' AS DateTime))
INSERT [dbo].[t_deuda] ([id_deuda], [id_tipo_servicio], [monto_soles], [estado], [numero_documento], [fecha_vencimiento]) VALUES (8, 5, CAST(40.10 AS Decimal(18, 2)), N'Pendiente', N'1234567', CAST(N'2016-05-12 00:00:00.000' AS DateTime))
INSERT [dbo].[t_deuda] ([id_deuda], [id_tipo_servicio], [monto_soles], [estado], [numero_documento], [fecha_vencimiento]) VALUES (9, 8, CAST(123.50 AS Decimal(18, 2)), N'Pagado', N'123456', CAST(N'2016-05-12 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[t_deuda] OFF
SET IDENTITY_INSERT [dbo].[t_empresa] ON 

INSERT [dbo].[t_empresa] ([id_empresa], [razon_social], [ruc]) VALUES (1, N'Microsoft', N'12345678901')
INSERT [dbo].[t_empresa] ([id_empresa], [razon_social], [ruc]) VALUES (2, N'12121212', N'12345678999')
SET IDENTITY_INSERT [dbo].[t_empresa] OFF
SET IDENTITY_INSERT [dbo].[t_ficha_afiliacion] ON 

INSERT [dbo].[t_ficha_afiliacion] ([id_ficha_afiliacion], [apellidos], [nombre], [numero_documento], [sexo], [correo], [numero_telefono], [fecha_alta], [fecha_nacimiento], [estado_afiliado], [fecha_baja], [estado_civil], [direccion], [celular], [departamento], [distrito], [provincia], [fk_tipo_documento]) VALUES (1, N'Benites', N'Erick', N'42545606', N'M', N'erick.benites@gmail.com', N'971278643', CAST(N'2016-01-05 00:00:00.000' AS DateTime), CAST(N'1988-05-08' AS Date), N'A', NULL, N'S', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[t_ficha_afiliacion] ([id_ficha_afiliacion], [apellidos], [nombre], [numero_documento], [sexo], [correo], [numero_telefono], [fecha_alta], [fecha_nacimiento], [estado_afiliado], [fecha_baja], [estado_civil], [direccion], [celular], [departamento], [distrito], [provincia], [fk_tipo_documento]) VALUES (2, N'Farfan', N'Jaime', N'38545024', N'M', N'jaime.farfan@gmail.com', N'95458545', CAST(N'2016-06-04 00:00:00.000' AS DateTime), CAST(N'1978-02-24' AS Date), N'A', NULL, N'S', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[t_ficha_afiliacion] ([id_ficha_afiliacion], [apellidos], [nombre], [numero_documento], [sexo], [correo], [numero_telefono], [fecha_alta], [fecha_nacimiento], [estado_afiliado], [fecha_baja], [estado_civil], [direccion], [celular], [departamento], [distrito], [provincia], [fk_tipo_documento]) VALUES (3, N'Marin', N'Evelyn', N'42545607', N'F', N'emarinsanchez@gmail.com', N'955458652', CAST(N'2015-11-20 00:00:00.000' AS DateTime), CAST(N'1986-04-12' AS Date), N'A', NULL, N'S', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[t_ficha_afiliacion] ([id_ficha_afiliacion], [apellidos], [nombre], [numero_documento], [sexo], [correo], [numero_telefono], [fecha_alta], [fecha_nacimiento], [estado_afiliado], [fecha_baja], [estado_civil], [direccion], [celular], [departamento], [distrito], [provincia], [fk_tipo_documento]) VALUES (4, N'Benites', N'Ruth', N'39652545', N'F', N'rbenites@gmail.com', N'987607058', CAST(N'2016-01-05 00:00:00.000' AS DateTime), CAST(N'1973-03-16' AS Date), N'I', NULL, N'S', NULL, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[t_ficha_afiliacion] OFF
SET IDENTITY_INSERT [dbo].[t_medio_pago] ON 

INSERT [dbo].[t_medio_pago] ([id_medio_pago], [descripcion]) VALUES (1, N'Efectivo')
INSERT [dbo].[t_medio_pago] ([id_medio_pago], [descripcion]) VALUES (2, N'Tarjeta')
SET IDENTITY_INSERT [dbo].[t_medio_pago] OFF
SET IDENTITY_INSERT [dbo].[t_modalidad] ON 

INSERT [dbo].[t_modalidad] ([id_Modalidad], [modalidad]) VALUES (1, N'Transferencia')
INSERT [dbo].[t_modalidad] ([id_Modalidad], [modalidad]) VALUES (2, N'Cheque')
SET IDENTITY_INSERT [dbo].[t_modalidad] OFF
SET IDENTITY_INSERT [dbo].[t_modalidad_canje] ON 

INSERT [dbo].[t_modalidad_canje] ([id_modalidad_canje], [fk_producto_canje], [nombre_modalidad_canje], [tipo_canje], [punto_canje], [importe_canje], [fecha_alta], [fecha_baja], [estado]) VALUES (1, 2, N'Modalidad 01', N'PP', CAST(80 AS Numeric(18, 0)), CAST(0.00 AS Numeric(18, 2)), NULL, NULL, N'A')
INSERT [dbo].[t_modalidad_canje] ([id_modalidad_canje], [fk_producto_canje], [nombre_modalidad_canje], [tipo_canje], [punto_canje], [importe_canje], [fecha_alta], [fecha_baja], [estado]) VALUES (2, 4, N'Modalidad 01', N'PI', CAST(20 AS Numeric(18, 0)), CAST(30.00 AS Numeric(18, 2)), NULL, NULL, N'A')
INSERT [dbo].[t_modalidad_canje] ([id_modalidad_canje], [fk_producto_canje], [nombre_modalidad_canje], [tipo_canje], [punto_canje], [importe_canje], [fecha_alta], [fecha_baja], [estado]) VALUES (3, 4, N'Modalidad 02', N'PI', CAST(10 AS Numeric(18, 0)), CAST(50.00 AS Numeric(18, 2)), NULL, NULL, N'A')
INSERT [dbo].[t_modalidad_canje] ([id_modalidad_canje], [fk_producto_canje], [nombre_modalidad_canje], [tipo_canje], [punto_canje], [importe_canje], [fecha_alta], [fecha_baja], [estado]) VALUES (4, 10, N'Modalidad 01', N'II', CAST(0 AS Numeric(18, 0)), CAST(80.00 AS Numeric(18, 2)), NULL, NULL, N'A')
INSERT [dbo].[t_modalidad_canje] ([id_modalidad_canje], [fk_producto_canje], [nombre_modalidad_canje], [tipo_canje], [punto_canje], [importe_canje], [fecha_alta], [fecha_baja], [estado]) VALUES (5, 11, N'Modalidad 01', N'PP', CAST(40 AS Numeric(18, 0)), CAST(0.00 AS Numeric(18, 2)), NULL, NULL, N'A')
INSERT [dbo].[t_modalidad_canje] ([id_modalidad_canje], [fk_producto_canje], [nombre_modalidad_canje], [tipo_canje], [punto_canje], [importe_canje], [fecha_alta], [fecha_baja], [estado]) VALUES (6, 12, N'Modalidad 01', N'PP', CAST(80 AS Numeric(18, 0)), CAST(0.00 AS Numeric(18, 2)), NULL, NULL, N'A')
INSERT [dbo].[t_modalidad_canje] ([id_modalidad_canje], [fk_producto_canje], [nombre_modalidad_canje], [tipo_canje], [punto_canje], [importe_canje], [fecha_alta], [fecha_baja], [estado]) VALUES (7, 12, N'Modalidad 02', N'II', CAST(0 AS Numeric(18, 0)), CAST(40.00 AS Numeric(18, 2)), NULL, NULL, N'A')
INSERT [dbo].[t_modalidad_canje] ([id_modalidad_canje], [fk_producto_canje], [nombre_modalidad_canje], [tipo_canje], [punto_canje], [importe_canje], [fecha_alta], [fecha_baja], [estado]) VALUES (8, 21, N'Modalidad 01', N'PP', CAST(25 AS Numeric(18, 0)), CAST(0.00 AS Numeric(18, 2)), NULL, NULL, N'A')
INSERT [dbo].[t_modalidad_canje] ([id_modalidad_canje], [fk_producto_canje], [nombre_modalidad_canje], [tipo_canje], [punto_canje], [importe_canje], [fecha_alta], [fecha_baja], [estado]) VALUES (9, 11, N'Modalidad 02', N'PI', CAST(10 AS Numeric(18, 0)), CAST(20.00 AS Numeric(18, 2)), NULL, NULL, N'A')
SET IDENTITY_INSERT [dbo].[t_modalidad_canje] OFF
SET IDENTITY_INSERT [dbo].[t_moneda] ON 

INSERT [dbo].[t_moneda] ([id_moneda], [moneda], [descripcion], [simbolo]) VALUES (1, N'SOLES', N'SOLES', N'S/.')
INSERT [dbo].[t_moneda] ([id_moneda], [moneda], [descripcion], [simbolo]) VALUES (2, N'DÓLARES', N'DOLARES', N'USD')
SET IDENTITY_INSERT [dbo].[t_moneda] OFF
SET IDENTITY_INSERT [dbo].[t_orden_pago] ON 

INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (1, N'10181', N'Servicio de Edelnor', N'Edelnor', N'02/FEb/2016', 20160202, N'16/AbR/2016', 20160416, N'SCOTIA bANK', N'Soles', N'4166.00', N'Reprogramado', N'0011-1127-73-0-1', N'6599.00', N'Soles', N'1348.00', N'0011-8787-22-0-1', N'Transferencia', N'Factura 05-1601', N'1630', N'SI', N'2818.00', N'-', N'-', N'-', N'3403', 6, 3, 1, NULL, 2, 14, 1)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (2, N'10611', N'Servicio de Edelnor', N'Edelnor', N'05/MAY/2016', 20160505, N'16/MAY/2016', 20160516, N'bCp', N'Soles', N'3551.00', N'Reprogramado', N'0011-2733-75-0-1', N'6622.00', N'Soles', N'1454.00', N'0011-8787-22-0-1', N'Transferencia', N'Factura 06-2090', N'1605', N'SI', N'2097.00', N'-', N'-', N'-', N'2844', 6, 1, 1, NULL, 7, 14, 1)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (3, N'10543', N'Servicio de Cruz del Sur', N'Cruz del Sur', N'20/FEb/2016', 20160220, N'22/MAR/2016', 20160322, N'bbVA', N'Soles', N'1741.00', N'Aprobado', N'0011-2071-28-0-1', N'7741.00', N'Soles', N'620.00', N'0012-2449-88-0-1', N'Transferencia', N'Factura 08-1898', N'3596', N'SI', N'1121.00', N'-', N'-', N'-', N'3494', 5, 2, 1, NULL, 5, 16, 1)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (4, N'10797', N'Servicio de Cruz del Sur', N'Cruz del Sur', N'06/FEb/2016', 20160206, N'12/MAY/2016', 20160512, N'bCp', N'Soles', N'2425.00', N'pagado', N'0011-2733-75-0-1', N'6609.00', N'Soles', N'1404.00', N'0012-2449-88-0-1', N'Cheque', N'Factura 01-1350', N'3619', N'SI', N'1021.00', N'-', N'-', N'-', N'3146', 5, 1, 1, NULL, 7, 16, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (5, N'10842', N'Servicio de Cruz del Sur', N'Cruz del Sur', N'10/FEb/2016', 20160210, N'14/AbR/2016', 20160414, N'INTERbANK', N'Soles', N'3098.00', N'Reprogramado', N'0010-3063-54-0-1', N'7600.00', N'Soles', N'1040.00', N'0012-2449-88-0-1', N'Transferencia', N'Factura 08-2036', N'2189', N'SI', N'2058.00', N'-', N'-', N'-', N'2638', 5, 4, 1, NULL, 1, 16, 1)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (6, N'10864', N'Servicio de Gloria', N'Gloria', N'19/ENE/2016', 20160119, N'22/AbR/2016', 20160422, N'INTERbANK', N'Soles', N'1000.00', N'pagado', N'0010-3063-54-0-1', N'9465.00', N'Soles', N'876.00', N'0011-2071-28-0-1', N'Cheque', N'Factura 05-1276', N'1149', N'SI', N'124.00', N'-', N'-', N'-', N'2065', 7, 4, 1, NULL, 1, 15, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (7, N'10454', N'Servicio de Cruz del Sur', N'Cruz del Sur', N'30/ENE/2016', 20160130, N'17/AbR/2016', 20160417, N'INTERbANK', N'Soles', N'512.00', N'Aprobado', N'0010-3063-54-0-1', N'9389.00', N'Soles', N'389.00', N'0012-2449-88-0-1', N'Transferencia', N'Factura 06-1762', N'1935', N'SI', N'123.00', N'-', N'-', N'-', N'3403', 5, 4, 1, NULL, 1, 16, 1)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (8, N'10501', N'Servicio de backus', N'backus', N'11/AbR/2016', 20160411, N'08/MAY/2016', 20160508, N'bbVA', N'Soles', N'1769.00', N'Reprogramado', N'0011-2071-28-0-1', N'9971.00', N'Soles', N'680.00', N'0010-2001-60-0-1', N'Cheque', N'Factura 04-2625', N'3030', N'SI', N'1089.00', N'PRUEBA CARÁCTER | ESPECIAL', N'001 - DIFERENCIA DE MONTO-CHEQUE', N'14/JUN/2016', N'1401', 8, 2, 1, NULL, 5, 11, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (9, N'10209', N'Servicio de Edelnor', N'Edelnor', N'02/FEb/2016', 20160202, N'12/AbR/2016', 20160412, N'SCOTIA bANK', N'Soles', N'2641.00', N'Reprogramado', N'0011-1127-73-0-1', N'9861.00', N'Soles', N'1459.00', N'0011-8787-22-0-1', N'Cheque', N'Factura 01-2681', N'1439', N'SI', N'1182.00', N'-', N'-', N'-', N'2638', 6, 3, 1, NULL, 2, 14, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (10, N'10303', N'Servicio de backus', N'backus', N'02/ENE/2016', 20160102, N'14/AbR/2016', 20160414, N'INTERbANK', N'Soles', N'752.00', N'Aprobado', N'0010-3063-54-0-1', N'9198.00', N'Soles', N'752.00', N'0010-2001-60-0-1', N'Transferencia', N'Factura 06-2295', N'2053', N'NO', N'0.00', N'-', N'-', N'-', N'2844', 8, 4, 1, NULL, 1, 11, 1)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (11, N'10261', N'Servicio de Edelnor', N'Edelnor', N'21/ENE/2016', 20160121, N'25/ENE/2016', 20160125, N'bCp', N'Soles', N'1055.00', N'Aprobado', N'0011-2733-75-0-1', N'8875.00', N'Soles', N'599.00', N'0011-8787-22-0-1', N'Transferencia', N'Factura 03-1821', N'3101', N'SI', N'456.00', N'-', N'-', N'-', N'1262', 6, 1, 1, NULL, 7, 14, 1)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (12, N'10413', N'Servicio de Cruz del Sur', N'Cruz del Sur', N'13/ENE/2016', 20160113, N'11/AbR/2016', 20160411, N'SCOTIA bANK', N'Soles', N'1729.00', N'Aprobado', N'0011-1127-73-0-1', N'8311.00', N'Soles', N'395.00', N'0012-2449-88-0-1', N'Cheque', N'Factura 04-1461', N'1974', N'SI', N'1334.00', N'-', N'-', N'-', N'2638', 5, 3, 1, NULL, 2, 16, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (13, N'10147', N'Servicio de Gloria', N'Gloria', N'07/ENE/2016', 20160107, N'26/MAY/2016', 20160526, N'bCp', N'Soles', N'514.00', N'Reprogramado', N'0011-2733-75-0-1', N'8486.00', N'Soles', N'373.00', N'0011-2071-28-0-1', N'Cheque', N'Factura 06-2266', N'1211', N'SI', N'141.00', N'-', N'-', N'-', N'1637', 7, 1, 1, NULL, 7, 15, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (14, N'10491', N'Servicio de Edelnor', N'Edelnor', N'11/AbR/2016', 20160411, N'14/AbR/2016', 20160414, N'bCp', N'Soles', N'572.00', N'Reprogramado', N'0011-2733-75-0-1', N'6938.00', N'Soles', N'365.00', N'0011-8787-22-0-1', N'Cheque', N'Factura 04-2324', N'3389', N'SI', N'207.00', N'-', N'-', N'-', N'2638', 6, 1, 1, NULL, 7, 14, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (15, N'10332', N'Servicio de backus', N'backus', N'12/FEb/2016', 20160212, N'27/AbR/2016', 20160427, N'INTERbANK', N'Soles', N'2383.00', N'Reprogramado', N'0010-3063-54-0-1', N'7413.00', N'Soles', N'1676.00', N'0010-2001-60-0-1', N'Cheque', N'Factura 06-1760', N'4016', N'SI', N'707.00', N'-', N'-', N'-', N'2327', 8, 4, 1, NULL, 1, 11, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (16, N'10743', N'Servicio de Gloria', N'Gloria', N'22/AbR/2016', 20160422, N'26/MAY/2016', 20160526, N'bbVA', N'Soles', N'2508.00', N'Reprogramado', N'0011-2071-28-0-1', N'6427.00', N'Soles', N'669.00', N'0011-2071-28-0-1', N'Transferencia', N'Factura 04-1093', N'1847', N'SI', N'1839.00', N'-', N'-', N'-', N'3639', 7, 2, 1, NULL, 5, 15, 1)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (17, N'10232', N'Servicio de backus', N'backus', N'05/MAY/2016', 20160505, N'05/MAY/2016', 20160505, N'SCOTIA bANK', N'Soles', N'2886.00', N'pagado', N'0011-1127-73-0-1', N'7229.00', N'Soles', N'281.00', N'0010-2001-60-0-1', N'Transferencia', N'Factura 01-1253', N'2682', N'SI', N'2605.00', N'-', N'-', N'-', N'2676', 8, 3, 1, NULL, 2, 11, 1)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (18, N'10879', N'Servicio de backus', N'backus', N'01/MAR/2016', 20160301, N'05/MAR/2016', 20160305, N'bCp', N'Soles', N'3744.00', N'Reprogramado', N'0011-2733-75-0-1', N'7708.00', N'Soles', N'3238.00', N'0010-2001-60-0-1', N'Cheque', N'Factura 08-1268', N'1220', N'SI', N'506.00', N'-', N'-', N'-', N'2416', 8, 1, 1, NULL, 7, 11, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (19, N'10288', N'Servicio de Gloria', N'Gloria', N'09/AbR/2016', 20160409, N'20/AbR/2016', 20160420, N'SCOTIA bANK', N'Soles', N'2047.00', N'pagado', N'0011-1127-73-0-1', N'6844.00', N'Soles', N'1875.00', N'0011-2071-28-0-1', N'Transferencia', N'Factura 06-1375', N'2875', N'SI', N'172.00', N'                         ', N'001 - DIFERENCIA DE MONTO-CHEQUE', N'14/JUN/2016', N'1401', 7, 3, 1, NULL, 2, 15, 1)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (20, N'10709', N'Servicio de Edelnor', N'Edelnor', N'23/MAR/2016', 20160323, N'16/MAY/2016', 20160516, N'bbVA', N'Soles', N'1595.00', N'pagado', N'0011-2071-28-0-1', N'8746.00', N'Soles', N'1595.00', N'0011-8787-22-0-1', N'Cheque', N'Factura 04-2891', N'3072', N'NO', N'0.00', N'-', N'-', N'-', N'1424', 6, 2, 1, NULL, 5, 14, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (21, N'10389', N'Servicio de backus', N'backus', N'07/ENE/2016', 20160107, N'11/ENE/2016', 20160111, N'bbVA', N'Soles', N'1624.00', N'Reprogramado', N'0011-2071-28-0-1', N'6488.00', N'Soles', N'371.00', N'0010-2001-60-0-1', N'Transferencia', N'Factura 03-1712', N'2627', N'SI', N'1253.00', N'-', N'-', N'-', N'2844', 8, 2, 1, NULL, 5, 11, 1)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (22, N'10645', N'Servicio de Cruz del Sur', N'Cruz del Sur', N'26/ENE/2016', 20160126, N'12/MAY/2016', 20160512, N'INTERbANK', N'Soles', N'3192.00', N'Aprobado', N'0010-3063-54-0-1', N'9032.00', N'Soles', N'2951.00', N'0012-2449-88-0-1', N'Cheque', N'Factura 03-2811', N'2817', N'SI', N'241.00', N'-', N'-', N'-', N'3146', 5, 4, 1, NULL, 1, 16, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (23, N'10291', N'Servicio de Edelnor', N'Edelnor', N'06/ENE/2016', 20160106, N'17/MAY/2016', 20160517, N'bbVA', N'Soles', N'3282.00', N'Aprobado', N'0011-2071-28-0-1', N'7765.00', N'Soles', N'1313.00', N'0011-8787-22-0-1', N'Cheque', N'Factura 06-2927', N'1568', N'SI', N'1969.00', N'-', N'-', N'-', N'1424', 6, 2, 1, NULL, 5, 14, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (24, N'10295', N'Servicio de Gloria', N'Gloria', N'21/FEb/2016', 20160221, N'27/AbR/2016', 20160427, N'INTERbANK', N'Soles', N'3607.00', N'Aprobado', N'0010-3063-54-0-1', N'9972.00', N'Soles', N'1618.00', N'0011-2071-28-0-1', N'Cheque', N'Factura 07-1855', N'3769', N'SI', N'1989.00', N'-', N'-', N'-', N'3523', 7, 4, 1, NULL, 1, 15, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (25, N'10870', N'Servicio de Edelnor', N'Edelnor', N'20/ENE/2016', 20160120, N'24/AbR/2016', 20160424, N'SCOTIA bANK', N'Soles', N'1348.00', N'pagado', N'0011-1127-73-0-1', N'6266.00', N'Soles', N'1109.00', N'0011-8787-22-0-1', N'Cheque', N'Factura 05-1636', N'3763', N'SI', N'239.00', N'-', N'-', N'-', N'3523', 6, 3, 1, NULL, 2, 14, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (26, N'10525', N'Servicio de backus', N'backus', N'07/MAR/2016', 20160307, N'15/MAY/2016', 20160515, N'bCp', N'Soles', N'2947.00', N'pendiente', N'0011-2733-75-0-1', N'7730.00', N'Soles', N'373.00', N'0010-2001-60-0-1', N'Cheque', N'Factura 02-2762', N'3717', N'SI', N'2574.00', N'-', N'-', N'-', N'1424', 8, 1, 1, NULL, 7, 11, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (27, N'10650', N'Servicio de backus', N'backus', N'04/FEb/2016', 20160204, N'08/FEb/2016', 20160208, N'SCOTIA bANK', N'Soles', N'1613.00', N'Aprobado', N'0011-1127-73-0-1', N'6562.00', N'Soles', N'764.00', N'0010-2001-60-0-1', N'Cheque', N'Factura 06-1190', N'4014', N'SI', N'849.00', N'-', N'-', N'-', N'2676', 8, 3, 1, NULL, 2, 11, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (28, N'10840', N'Servicio de backus', N'backus', N'10/MAR/2016', 20160310, N'14/MAR/2016', 20160314, N'bbVA', N'Soles', N'1147.00', N'pagado', N'0011-2071-28-0-1', N'8731.00', N'Soles', N'830.00', N'0010-2001-60-0-1', N'Cheque', N'Factura 08-2141', N'1537', N'SI', N'317.00', N'-', N'-', N'-', N'2790', 8, 2, 1, NULL, 5, 11, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (29, N'10508', N'Servicio de Gloria', N'Gloria', N'04/FEb/2016', 20160204, N'16/AbR/2016', 20160416, N'INTERbANK', N'Soles', N'1267.00', N'pagado', N'0010-3063-54-0-1', N'7269.00', N'Soles', N'1229.00', N'0011-2071-28-0-1', N'Cheque', N'Factura 08-2954', N'1600', N'SI', N'38.00', N'-', N'-', N'-', N'3403', 7, 4, 1, NULL, 1, 15, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (30, N'10151', N'Servicio de Edelnor', N'Edelnor', N'16/AbR/2016', 20160416, N'24/AbR/2016', 20160424, N'bCp', N'Soles', N'1381.00', N'pagado', N'0011-2733-75-0-1', N'6960.00', N'Soles', N'1381.00', N'0011-8787-22-0-1', N'Cheque', N'Factura 06-1516', N'1330', N'NO', N'0.00', N'-', N'-', N'-', N'3523', 6, 1, 1, NULL, 7, 14, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (31, N'10342', N'Servicio de Gloria', N'Gloria', N'10/MAR/2016', 20160310, N'20/MAY/2016', 20160520, N'SCOTIA bANK', N'Soles', N'1450.00', N'Aprobado', N'0011-1127-73-0-1', N'9068.00', N'Soles', N'787.00', N'0011-2071-28-0-1', N'Transferencia', N'Factura 08-1597', N'1860', N'SI', N'663.00', N'-', N'-', N'-', N'2416', 7, 3, 1, NULL, 2, 15, 1)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (32, N'10868', N'Servicio de Gloria', N'Gloria', N'27/FEb/2016', 20160227, N'20/AbR/2016', 20160420, N'INTERbANK', N'Soles', N'2284.00', N'Aprobado', N'0010-3063-54-0-1', N'9676.00', N'Soles', N'1529.00', N'0011-2071-28-0-1', N'Transferencia', N'Factura 07-1323', N'1610', N'SI', N'755.00', N'-', N'-', N'-', N'3403', 7, 4, 1, NULL, 1, 15, 1)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (33, N'10124', N'Servicio de Gloria', N'Gloria', N'05/FEb/2016', 20160205, N'05/AbR/2016', 20160405, N'bbVA', N'Soles', N'1975.00', N'Reprogramado', N'0011-2071-28-0-1', N'8754.00', N'Soles', N'288.00', N'0011-2071-28-0-1', N'Cheque', N'Factura 03-1794', N'2026', N'SI', N'1687.00', N'-', N'-', N'-', N'1218', 7, 2, 1, NULL, 5, 15, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (34, N'10668', N'Servicio de Gloria', N'Gloria', N'06/MAR/2016', 20160306, N'10/MAY/2016', 20160510, N'SCOTIA bANK', N'Soles', N'2904.00', N'Aprobado', N'0011-1127-73-0-1', N'6492.00', N'Soles', N'1433.00', N'0011-2071-28-0-1', N'Transferencia', N'Factura 02-1416', N'2847', N'SI', N'1471.00', N'-', N'-', N'-', N'3146', 7, 3, 1, NULL, 2, 15, 1)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (35, N'10742', N'Servicio de backus', N'backus', N'01/MAR/2016', 20160301, N'05/AbR/2016', 20160405, N'bbVA', N'Soles', N'1643.00', N'pagado', N'0011-2071-28-0-1', N'6918.00', N'Soles', N'1422.00', N'0010-2001-60-0-1', N'Cheque', N'Factura 04-1403', N'1116', N'SI', N'221.00', N'-', N'-', N'-', N'3639', 8, 2, 1, NULL, 5, 11, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (36, N'10139', N'Servicio de Edelnor', N'Edelnor', N'11/AbR/2016', 20160411, N'02/MAY/2016', 20160502, N'bCp', N'Soles', N'3000.00', N'pagado', N'0011-2733-75-0-1', N'6901.00', N'Soles', N'118.00', N'0011-8787-22-0-1', N'Cheque', N'Factura 04-1989', N'1508', N'SI', N'2882.00', N'-', N'-', N'-', N'1262', 6, 1, 1, NULL, 7, 14, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (37, N'10338', N'Servicio de Gloria', N'Gloria', N'10/AbR/2016', 20160410, N'14/MAY/2016', 20160514, N'bbVA', N'Soles', N'846.00', N'pagado', N'0011-2071-28-0-1', N'9023.00', N'Soles', N'173.00', N'0011-2071-28-0-1', N'Transferencia', N'Factura 07-2224', N'3975', N'SI', N'673.00', N'-', N'-', N'-', N'1424', 7, 2, 1, NULL, 5, 15, 1)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (38, N'10238', N'Servicio de Gloria', N'Gloria', N'12/FEb/2016', 20160212, N'19/MAY/2016', 20160519, N'bCp', N'Soles', N'3339.00', N'Aprobado', N'0011-2733-75-0-1', N'9453.00', N'Soles', N'1947.00', N'0011-2071-28-0-1', N'Cheque', N'Factura 08-1882', N'2349', N'SI', N'1392.00', N'-', N'-', N'-', N'1424', 7, 1, 1, NULL, 7, 15, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (39, N'10402', N'Servicio de Gloria', N'Gloria', N'07/FEb/2016', 20160207, N'19/MAY/2016', 20160519, N'SCOTIA bANK', N'Soles', N'3011.00', N'Reprogramado', N'0011-1127-73-0-1', N'7778.00', N'Soles', N'2203.00', N'0011-2071-28-0-1', N'Cheque', N'Factura 06-2070', N'2911', N'SI', N'808.00', N'-', N'-', N'-', N'1401', 7, 3, 1, NULL, 2, 15, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (40, N'10142', N'Servicio de Gloria', N'Gloria', N'12/ENE/2016', 20160112, N'27/AbR/2016', 20160427, N'bCp', N'Soles', N'551.00', N'Aprobado', N'0011-2733-75-0-1', N'7764.00', N'Soles', N'551.00', N'0011-2071-28-0-1', N'Cheque', N'Factura 05-2736', N'1507', N'NO', N'0.00', N'-', N'-', N'-', N'2327', 7, 1, 1, NULL, 7, 15, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (41, N'10218', N'Servicio de Edelnor', N'Edelnor', N'17/AbR/2016', 20160417, N'21/AbR/2016', 20160421, N'INTERbANK', N'Soles', N'1988.00', N'pagado', N'0010-3063-54-0-1', N'6812.00', N'Soles', N'1123.00', N'0011-8787-22-0-1', N'Transferencia', N'Factura 03-2092', N'4027', N'SI', N'865.00', N'-', N'-', N'-', N'2844', 6, 4, 1, NULL, 1, 14, 1)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (42, N'10430', N'Servicio de Edelnor', N'Edelnor', N'01/FEb/2016', 20160201, N'21/AbR/2016', 20160421, N'bbVA', N'Soles', N'669.00', N'Reprogramado', N'0011-2071-28-0-1', N'9122.00', N'Soles', N'111.00', N'0011-8787-22-0-1', N'Cheque', N'Factura 01-1813', N'2005', N'SI', N'558.00', N'-', N'-', N'-', N'2676', 6, 2, 1, NULL, 5, 14, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (43, N'10447', N'Servicio de Edelnor', N'Edelnor', N'31/ENE/2016', 20160131, N'04/FEb/2016', 20160204, N'bbVA', N'Soles', N'2663.00', N'pagado', N'0011-2071-28-0-1', N'9407.00', N'Soles', N'191.00', N'0011-8787-22-0-1', N'Transferencia', N'Factura 05-1269', N'1265', N'SI', N'2472.00', N'-', N'-', N'-', N'2608', 6, 2, 1, NULL, 5, 14, 1)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (44, N'10368', N'Servicio de Cruz del Sur', N'Cruz del Sur', N'20/ENE/2016', 20160120, N'24/ENE/2016', 20160124, N'INTERbANK', N'Soles', N'2107.00', N'Aprobado', N'0010-3063-54-0-1', N'7102.00', N'Soles', N'1163.00', N'0012-2449-88-0-1', N'Cheque', N'Factura 08-1316', N'3102', N'SI', N'944.00', N'-', N'-', N'-', N'2844', 5, 4, 1, NULL, 1, 16, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (45, N'10246', N'Servicio de Cruz del Sur', N'Cruz del Sur', N'11/ENE/2016', 20160111, N'12/MAY/2016', 20160512, N'bbVA', N'Soles', N'3771.00', N'Aprobado', N'0011-2071-28-0-1', N'7479.00', N'Soles', N'3031.00', N'0012-2449-88-0-1', N'Transferencia', N'Factura 05-2992', N'1397', N'SI', N'740.00', N'-', N'-', N'-', N'3146', 5, 2, 1, NULL, 5, 16, 1)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (46, N'10268', N'Servicio de Gloria', N'Gloria', N'13/MAR/2016', 20160313, N'16/MAY/2016', 20160516, N'SCOTIA bANK', N'Soles', N'2258.00', N'Reprogramado', N'0011-1127-73-0-1', N'8734.00', N'Soles', N'904.00', N'0011-2071-28-0-1', N'Cheque', N'Factura 05-1231', N'3316', N'SI', N'1354.00', N'-', N'-', N'-', N'2676', 7, 3, 1, NULL, 2, 15, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (47, N'10449', N'Servicio de Edelnor', N'Edelnor', N'04/ENE/2016', 20160104, N'08/ENE/2016', 20160108, N'bCp', N'Soles', N'2031.00', N'pagado', N'0011-2733-75-0-1', N'7192.00', N'Soles', N'1567.00', N'0011-8787-22-0-1', N'Cheque', N'Factura 02-1223', N'2437', N'SI', N'464.00', N'-', N'-', N'-', N'2676', 6, 1, 1, NULL, 7, 14, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (48, N'10263', N'Servicio de backus', N'backus', N'03/ENE/2016', 20160103, N'20/AbR/2016', 20160420, N'bbVA', N'Soles', N'2959.00', N'Aprobado', N'0011-2071-28-0-1', N'6125.00', N'Soles', N'2808.00', N'0010-2001-60-0-1', N'Cheque', N'Factura 04-1602', N'3114', N'SI', N'151.00', N'-', N'-', N'-', N'3403', 8, 2, 1, NULL, 5, 11, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (49, N'10841', N'Servicio de Edelnor', N'Edelnor', N'08/FEb/2016', 20160208, N'12/FEb/2016', 20160212, N'bbVA', N'Soles', N'2805.00', N'Reprogramado', N'0011-2071-28-0-1', N'6490.00', N'Soles', N'2721.00', N'0011-8787-22-0-1', N'Cheque', N'Factura 02-1604', N'1255', N'SI', N'84.00', N'-', N'-', N'-', N'2608', 6, 2, 1, NULL, 5, 14, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (50, N'10662', N'Servicio de Edelnor', N'Edelnor', N'06/ENE/2016', 20160106, N'22/MAY/2016', 20160522, N'INTERbANK', N'Soles', N'717.00', N'Aprobado', N'0010-3063-54-0-1', N'7012.00', N'Soles', N'717.00', N'0011-8787-22-0-1', N'Cheque', N'Factura 03-2761', N'2333', N'NO', N'0.00', N'-', N'-', N'-', N'1637', 6, 4, 1, NULL, 1, 14, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (51, N'10137', N'Servicio de Gloria', N'Gloria', N'21/ENE/2016', 20160121, N'25/ENE/2016', 20160125, N'INTERbANK', N'Soles', N'1298.00', N'Reprogramado', N'0010-3063-54-0-1', N'9366.00', N'Soles', N'930.00', N'0011-2071-28-0-1', N'Cheque', N'Factura 05-2698', N'1983', N'SI', N'368.00', N'-', N'-', N'-', N'1262', 7, 4, 1, NULL, 1, 15, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (52, N'10383', N'Servicio de Gloria', N'Gloria', N'06/AbR/2016', 20160406, N'10/AbR/2016', 20160410, N'bCp', N'Soles', N'3473.00', N'Aprobado', N'0011-2733-75-0-1', N'8459.00', N'Soles', N'1191.00', N'0011-2071-28-0-1', N'Transferencia', N'Factura 05-1030', N'2102', N'SI', N'2282.00', N'-', N'-', N'-', N'2608', 7, 1, 1, NULL, 7, 15, 1)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (53, N'10566', N'Servicio de Cruz del Sur', N'Cruz del Sur', N'26/FEb/2016', 20160226, N'06/AbR/2016', 20160406, N'SCOTIA bANK', N'Soles', N'675.00', N'pagado', N'0011-1127-73-0-1', N'7564.00', N'Soles', N'373.00', N'0012-2449-88-0-1', N'Cheque', N'Factura 08-1551', N'1804', N'SI', N'302.00', N'-', N'-', N'-', N'1218', 5, 3, 1, NULL, 2, 16, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (54, N'10324', N'Servicio de Cruz del Sur', N'Cruz del Sur', N'06/MAR/2016', 20160306, N'10/MAR/2016', 20160310, N'bbVA', N'Soles', N'1759.00', N'Aprobado', N'0011-2071-28-0-1', N'8661.00', N'Soles', N'356.00', N'0012-2449-88-0-1', N'Transferencia', N'Factura 03-2101', N'2386', N'SI', N'1403.00', N'-', N'-', N'-', N'2327', 5, 2, 1, NULL, 5, 16, 1)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (55, N'10673', N'Servicio de Edelnor', N'Edelnor', N'01/FEb/2016', 20160201, N'05/FEb/2016', 20160205, N'INTERbANK', N'Soles', N'1450.00', N'pendiente', N'0010-3063-54-0-1', N'8292.00', N'Soles', N'882.00', N'0011-8787-22-0-1', N'Transferencia', N'Factura 02-2759', N'2058', N'SI', N'568.00', N'-', N'-', N'-', N'1262', 6, 4, 1, NULL, 1, 14, 1)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (56, N'10102', N'Servicio de backus', N'backus', N'18/MAR/2016', 20160318, N'22/MAY/2016', 20160522, N'bCp', N'Soles', N'1661.00', N'Aprobado', N'0011-2733-75-0-1', N'9645.00', N'Soles', N'1460.00', N'0010-2001-60-0-1', N'Cheque', N'Factura 01-2314', N'3127', N'SI', N'201.00', N'-', N'-', N'-', N'1637', 8, 1, 1, NULL, 7, 11, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (57, N'10775', N'Servicio de backus', N'backus', N'15/FEb/2016', 20160215, N'19/FEb/2016', 20160219, N'INTERbANK', N'Soles', N'2765.00', N'Reprogramado', N'0010-3063-54-0-1', N'6206.00', N'Soles', N'228.00', N'0010-2001-60-0-1', N'Cheque', N'Factura 06-1635', N'2935', N'SI', N'2537.00', N'-', N'-', N'-', N'2065', 8, 4, 1, NULL, 1, 11, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (58, N'10287', N'Servicio de Cruz del Sur', N'Cruz del Sur', N'19/FEb/2016', 20160219, N'12/AbR/2016', 20160412, N'bbVA', N'Soles', N'1958.00', N'pagado', N'0011-2071-28-0-1', N'7523.00', N'Soles', N'907.00', N'0012-2449-88-0-1', N'Cheque', N'Factura 03-1288', N'3506', N'SI', N'1051.00', N'-', N'-', N'-', N'3403', 5, 2, 1, NULL, 5, 16, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (59, N'10306', N'Servicio de Edelnor', N'Edelnor', N'04/FEb/2016', 20160204, N'02/MAR/2016', 20160302, N'bbVA', N'Soles', N'4193.00', N'pagado', N'0011-2071-28-0-1', N'9831.00', N'Soles', N'1133.00', N'0011-8787-22-0-1', N'Transferencia', N'Factura 06-2839', N'1836', N'SI', N'3060.00', N'-', N'-', N'-', N'2327', 6, 2, 1, NULL, 5, 14, 1)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (60, N'10317', N'Servicio de Gloria', N'Gloria', N'05/MAR/2016', 20160305, N'09/MAR/2016', 20160309, N'bbVA', N'Soles', N'1887.00', N'pagado', N'0011-2071-28-0-1', N'8219.00', N'Soles', N'1887.00', N'0011-2071-28-0-1', N'Cheque', N'Factura 03-1069', N'3941', N'NO', N'0.00', N'-', N'-', N'-', N'1401', 7, 2, 1, NULL, 5, 15, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (61, N'10494', N'Servicio de Gloria', N'Gloria', N'03/ENE/2016', 20160103, N'07/ENE/2016', 20160107, N'INTERbANK', N'Soles', N'3719.00', N'pagado', N'0010-3063-54-0-1', N'8564.00', N'Soles', N'1822.00', N'0011-2071-28-0-1', N'Transferencia', N'Factura 05-2700', N'4002', N'SI', N'1897.00', N'-', N'-', N'-', N'2790', 7, 4, 1, NULL, 1, 15, 1)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (62, N'10660', N'Servicio de Cruz del Sur', N'Cruz del Sur', N'05/FEb/2016', 20160205, N'09/FEb/2016', 20160209, N'bbVA', N'Soles', N'1527.00', N'Reprogramado', N'0011-2071-28-0-1', N'7745.00', N'Soles', N'564.00', N'0012-2449-88-0-1', N'Cheque', N'Factura 08-2062', N'1213', N'SI', N'963.00', N'-', N'-', N'-', N'1262', 5, 2, 1, NULL, 5, 16, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (63, N'10828', N'Servicio de Gloria', N'Gloria', N'08/ENE/2016', 20160108, N'12/AbR/2016', 20160412, N'bCp', N'Soles', N'2526.00', N'Aprobado', N'0011-2733-75-0-1', N'9201.00', N'Soles', N'543.00', N'0011-2071-28-0-1', N'Cheque', N'Factura 05-2569', N'2812', N'SI', N'1983.00', N'-', N'-', N'-', N'2638', 7, 1, 1, NULL, 7, 15, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (64, N'10247', N'Servicio de Gloria', N'Gloria', N'02/FEb/2016', 20160202, N'06/FEb/2016', 20160206, N'INTERbANK', N'Soles', N'1806.00', N'Aprobado', N'0010-3063-54-0-1', N'6138.00', N'Soles', N'1333.00', N'0011-2071-28-0-1', N'Transferencia', N'Factura 03-2144', N'1151', N'SI', N'473.00', N'-', N'-', N'-', N'2844', 7, 4, 1, NULL, 1, 15, 1)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (65, N'10856', N'Servicio de Gloria', N'Gloria', N'28/ENE/2016', 20160128, N'20/AbR/2016', 20160420, N'bCp', N'Soles', N'2840.00', N'pagado', N'0011-2733-75-0-1', N'7626.00', N'Soles', N'243.00', N'0011-2071-28-0-1', N'Cheque', N'Factura 03-1493', N'2504', N'SI', N'2597.00', N'-', N'-', N'-', N'3403', 7, 1, 1, NULL, 7, 15, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (66, N'10649', N'Servicio de backus', N'backus', N'12/AbR/2016', 20160412, N'26/MAY/2016', 20160526, N'bCp', N'Soles', N'2893.00', N'Reprogramado', N'0011-2733-75-0-1', N'7294.00', N'Soles', N'806.00', N'0010-2001-60-0-1', N'Cheque', N'Factura 04-1180', N'2144', N'SI', N'2087.00', N'-', N'-', N'-', N'1637', 8, 1, 1, NULL, 7, 11, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (67, N'10490', N'Servicio de backus', N'backus', N'18/MAR/2016', 20160318, N'22/MAR/2016', 20160322, N'bbVA', N'Soles', N'1626.00', N'Aprobado', N'0011-2071-28-0-1', N'8488.00', N'Soles', N'1470.00', N'0010-2001-60-0-1', N'Transferencia', N'Factura 05-2240', N'1753', N'SI', N'156.00', N'-', N'-', N'-', N'1401', 8, 2, 1, NULL, 5, 11, 1)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (68, N'10550', N'Servicio de backus', N'backus', N'12/MAY/2016', 20160512, N'13/MAY/2016', 20160513, N'bCp', N'Soles', N'3462.00', N'Aprobado', N'0011-2733-75-0-1', N'6716.00', N'Soles', N'558.00', N'0010-2001-60-0-1', N'Transferencia', N'Factura 08-1776', N'2891', N'SI', N'2904.00', N'-', N'-', N'-', N'3494', 8, 1, 1, NULL, 7, 11, 1)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (69, N'10235', N'Servicio de Edelnor', N'Edelnor', N'04/MAR/2016', 20160304, N'08/MAR/2016', 20160308, N'SCOTIA bANK', N'Soles', N'942.00', N'Aprobado', N'0011-1127-73-0-1', N'9207.00', N'Soles', N'676.00', N'0011-8787-22-0-1', N'Transferencia', N'Factura 07-1152', N'3759', N'SI', N'266.00', N'-', N'-', N'-', N'2790', 6, 3, 1, NULL, 2, 14, 1)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (70, N'10451', N'Servicio de backus', N'backus', N'09/FEb/2016', 20160209, N'28/AbR/2016', 20160428, N'INTERbANK', N'Soles', N'1646.00', N'Reprogramado', N'0010-3063-54-0-1', N'9280.00', N'Soles', N'1646.00', N'0010-2001-60-0-1', N'Cheque', N'Factura 06-2095', N'2254', N'NO', N'0.00', N'-', N'-', N'-', N'2904', 8, 4, 1, NULL, 1, 11, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (71, N'10839', N'Servicio de Edelnor', N'Edelnor', N'20/FEb/2016', 20160220, N'24/FEb/2016', 20160224, N'bCp', N'Soles', N'3095.00', N'Aprobado', N'0011-2733-75-0-1', N'6424.00', N'Soles', N'2248.00', N'0011-8787-22-0-1', N'Transferencia', N'Factura 08-1440', N'2136', N'SI', N'847.00', N'-', N'-', N'-', N'2790', 6, 1, 1, NULL, 7, 14, 1)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (72, N'10644', N'Servicio de Gloria', N'Gloria', N'23/AbR/2016', 20160423, N'08/MAY/2016', 20160508, N'SCOTIA bANK', N'Soles', N'3982.00', N'Reprogramado', N'0011-1127-73-0-1', N'7186.00', N'Soles', N'3052.00', N'0011-2071-28-0-1', N'Cheque', N'Factura 05-2207', N'3301', N'SI', N'930.00', N'-', N'-', N'-', N'1401', 7, 3, 1, NULL, 2, 15, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (73, N'10343', N'Servicio de backus', N'backus', N'03/ENE/2016', 20160103, N'07/ENE/2016', 20160107, N'bCp', N'Soles', N'3891.00', N'Reprogramado', N'0011-2733-75-0-1', N'6775.00', N'Soles', N'3310.00', N'0010-2001-60-0-1', N'Cheque', N'Factura 06-1339', N'1760', N'SI', N'581.00', N'-', N'-', N'-', N'1083', 8, 1, 1, NULL, 7, 11, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (74, N'10169', N'Servicio de Cruz del Sur', N'Cruz del Sur', N'13/MAR/2016', 20160313, N'17/MAR/2016', 20160317, N'bbVA', N'Soles', N'3548.00', N'Aprobado', N'0011-2071-28-0-1', N'6231.00', N'Soles', N'1862.00', N'0012-2449-88-0-1', N'Transferencia', N'Factura 03-2185', N'1079', N'SI', N'1686.00', N'-', N'-', N'-', N'1083', 5, 2, 1, NULL, 5, 16, 1)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (75, N'10234', N'Servicio de Gloria', N'Gloria', N'14/ENE/2016', 20160114, N'17/MAY/2016', 20160517, N'INTERbANK', N'Soles', N'4113.00', N'Reprogramado', N'0010-3063-54-0-1', N'8886.00', N'Soles', N'2791.00', N'0011-2071-28-0-1', N'Cheque', N'Factura 05-1194', N'2653', N'SI', N'1322.00', N'-', N'-', N'-', N'1424', 7, 4, 1, NULL, 1, 15, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (76, N'10199', N'Servicio de backus', N'backus', N'22/MAR/2016', 20160322, N'26/MAR/2016', 20160326, N'bbVA', N'Soles', N'1051.00', N'Reprogramado', N'0011-2071-28-0-1', N'9422.00', N'Soles', N'607.00', N'0010-2001-60-0-1', N'Cheque', N'Factura 05-1554', N'2356', N'SI', N'444.00', N'-', N'-', N'-', N'2327', 8, 2, 1, NULL, 5, 11, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (77, N'10240', N'Servicio de Cruz del Sur', N'Cruz del Sur', N'29/AbR/2016', 20160429, N'10/MAY/2016', 20160510, N'bCp', N'Soles', N'907.00', N'Aprobado', N'0011-2733-75-0-1', N'9203.00', N'Soles', N'317.00', N'0012-2449-88-0-1', N'Transferencia', N'Factura 03-1681', N'3231', N'SI', N'590.00', N'-', N'-', N'-', N'3146', 5, 1, 1, NULL, 7, 16, 1)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (78, N'10906', N'Servicio de backus', N'backus', N'03/FEb/2016', 20160203, N'09/AbR/2016', 20160409, N'SCOTIA bANK', N'Soles', N'874.00', N'pagado', N'0011-1127-73-0-1', N'9693.00', N'Soles', N'839.00', N'0010-2001-60-0-1', N'Cheque', N'Factura 02-1592', N'2248', N'SI', N'35.00', N'-', N'-', N'-', N'2638', 8, 3, 1, NULL, 2, 11, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (79, N'10667', N'Servicio de backus', N'backus', N'16/FEb/2016', 20160216, N'20/FEb/2016', 20160220, N'bCp', N'Soles', N'3379.00', N'pendiente', N'0011-2733-75-0-1', N'9924.00', N'Soles', N'464.00', N'0010-2001-60-0-1', N'Cheque', N'Factura 06-1708', N'1979', N'SI', N'2915.00', N'-', N'-', N'-', N'2416', 8, 1, 1, NULL, 7, 11, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (80, N'10596', N'Servicio de backus', N'backus', N'22/AbR/2016', 20160422, N'25/MAY/2016', 20160525, N'bCp', N'Soles', N'2912.00', N'Aprobado', N'0011-2733-75-0-1', N'6492.00', N'Soles', N'2912.00', N'0010-2001-60-0-1', N'Cheque', N'Factura 08-2357', N'3289', N'NO', N'0.00', N'-', N'-', N'-', N'2608', 8, 1, 1, NULL, 7, 11, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (81, N'10844', N'Servicio de Edelnor', N'Edelnor', N'11/ENE/2016', 20160111, N'25/AbR/2016', 20160425, N'bbVA', N'Soles', N'452.00', N'pendiente', N'0011-2071-28-0-1', N'9248.00', N'Soles', N'122.00', N'0011-8787-22-0-1', N'Cheque', N'Factura 08-2853', N'1523', N'SI', N'330.00', N'-', N'-', N'-', N'3523', 6, 2, 1, NULL, 5, 14, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (82, N'10715', N'Servicio de Gloria', N'Gloria', N'18/FEb/2016', 20160218, N'01/MAY/2016', 20160501, N'bCp', N'Soles', N'1476.00', N'pagado', N'0011-2733-75-0-1', N'7277.00', N'Soles', N'1347.00', N'0011-2071-28-0-1', N'Cheque', N'Factura 04-2319', N'2641', N'SI', N'129.00', N'-', N'-', N'-', N'2416', 7, 1, 1, NULL, 7, 15, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (83, N'10692', N'Servicio de Edelnor', N'Edelnor', N'21/FEb/2016', 20160221, N'25/FEb/2016', 20160225, N'bbVA', N'Soles', N'1716.00', N'Reprogramado', N'0011-2071-28-0-1', N'7021.00', N'Soles', N'851.00', N'0011-8787-22-0-1', N'Cheque', N'Factura 02-1719', N'2431', N'SI', N'865.00', N'-', N'-', N'-', N'3494', 6, 2, 1, NULL, 5, 14, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (84, N'10178', N'Servicio de backus', N'backus', N'31/MAR/2016', 20160331, N'04/AbR/2016', 20160404, N'SCOTIA bANK', N'Soles', N'3087.00', N'Aprobado', N'0011-1127-73-0-1', N'7808.00', N'Soles', N'1303.00', N'0010-2001-60-0-1', N'Transferencia', N'Factura 05-2343', N'3502', N'SI', N'1784.00', N'-', N'-', N'-', N'2327', 8, 3, 1, NULL, 2, 11, 1)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (85, N'10426', N'Servicio de Cruz del Sur', N'Cruz del Sur', N'11/AbR/2016', 20160411, N'01/AbR/2016', 20160401, N'bCp', N'Soles', N'3249.00', N'Aprobado', N'0011-2733-75-0-1', N'6133.00', N'Soles', N'2713.00', N'0012-2449-88-0-1', N'Transferencia', N'Factura 08-1991', N'1272', N'SI', N'536.00', N'-', N'-', N'-', N'1218', 5, 1, 1, NULL, 7, 16, 1)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (86, N'10482', N'Servicio de backus', N'backus', N'15/MAY/2016', 20160515, N'19/MAY/2016', 20160519, N'SCOTIA bANK', N'Soles', N'2930.00', N'Aprobado', N'0011-1127-73-0-1', N'9410.00', N'Soles', N'2910.00', N'0010-2001-60-0-1', N'Cheque', N'Factura 08-1652', N'3188', N'SI', N'20.00', N'-', N'-', N'-', N'2416', 8, 3, 1, NULL, 2, 11, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (87, N'10445', N'Servicio de backus', N'backus', N'15/FEb/2016', 20160215, N'19/FEb/2016', 20160219, N'bCp', N'Soles', N'1443.00', N'Aprobado', N'0011-2733-75-0-1', N'8199.00', N'Soles', N'109.00', N'0010-2001-60-0-1', N'Cheque', N'Factura 08-2637', N'1486', N'SI', N'1334.00', N'-', N'-', N'-', N'2327', 8, 1, 1, NULL, 7, 11, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (88, N'10595', N'Servicio de backus', N'backus', N'21/ENE/2016', 20160121, N'07/MAY/2016', 20160507, N'bbVA', N'Soles', N'2728.00', N'Reprogramado', N'0011-2071-28-0-1', N'8582.00', N'Soles', N'143.00', N'0010-2001-60-0-1', N'Cheque', N'Factura 02-1322', N'2635', N'SI', N'2585.00', N'-', N'-', N'-', N'2416', 8, 2, 1, NULL, 5, 11, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (89, N'10244', N'Servicio de backus', N'backus', N'18/MAR/2016', 20160318, N'13/AbR/2016', 20160413, N'SCOTIA bANK', N'Soles', N'1922.00', N'Reprogramado', N'0011-1127-73-0-1', N'9382.00', N'Soles', N'1169.00', N'0010-2001-60-0-1', N'Transferencia', N'Factura 04-2177', N'3061', N'SI', N'753.00', N'-', N'-', N'-', N'2065', 8, 3, 1, NULL, 2, 11, 1)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (90, N'10296', N'Servicio de backus', N'backus', N'25/MAR/2016', 20160325, N'26/MAY/2016', 20160526, N'bbVA', N'Soles', N'2571.00', N'Aprobado', N'0011-2071-28-0-1', N'7271.00', N'Soles', N'2571.00', N'0010-2001-60-0-1', N'Transferencia', N'Factura 05-2044', N'2946', N'NO', N'0.00', N'-', N'-', N'-', N'1637', 8, 2, 1, NULL, 5, 11, 1)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (91, N'10862', N'Servicio de Cruz del Sur', N'Cruz del Sur', N'08/AbR/2016', 20160408, N'04/MAY/2016', 20160504, N'bbVA', N'Soles', N'3081.00', N'Aprobado', N'0011-2071-28-0-1', N'9039.00', N'Soles', N'148.00', N'0012-2449-88-0-1', N'Transferencia', N'Factura 02-2768', N'1305', N'SI', N'2933.00', N'-', N'-', N'-', N'2904', 5, 2, 1, NULL, 5, 16, 1)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (92, N'10656', N'Servicio de Edelnor', N'Edelnor', N'29/MAR/2016', 20160329, N'12/MAY/2016', 20160512, N'bCp', N'Soles', N'3095.00', N'Aprobado', N'0011-2733-75-0-1', N'9874.00', N'Soles', N'2157.00', N'0011-8787-22-0-1', N'Cheque', N'Factura 02-2559', N'3115', N'SI', N'938.00', N'-', N'-', N'-', N'3146', 6, 1, 1, NULL, 7, 14, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (93, N'10554', N'Servicio de Edelnor', N'Edelnor', N'03/ENE/2016', 20160103, N'15/MAY/2016', 20160515, N'bCp', N'Soles', N'2857.00', N'pendiente', N'0011-2733-75-0-1', N'8658.00', N'Soles', N'504.00', N'0011-8787-22-0-1', N'Cheque', N'Factura 04-2466', N'2677', N'SI', N'2353.00', N'-', N'-', N'-', N'1424', 6, 1, 1, NULL, 7, 14, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (94, N'10629', N'Servicio de Gloria', N'Gloria', N'30/AbR/2016', 20160430, N'04/MAY/2016', 20160504, N'SCOTIA bANK', N'Soles', N'1056.00', N'pagado', N'0011-1127-73-0-1', N'7145.00', N'Soles', N'945.00', N'0011-2071-28-0-1', N'Cheque', N'Factura 05-1623', N'1665', N'SI', N'111.00', N'-', N'-', N'-', N'1083', 7, 3, 1, NULL, 2, 15, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (95, N'10809', N'Servicio de Edelnor', N'Edelnor', N'10/FEb/2016', 20160210, N'16/MAY/2016', 20160516, N'bbVA', N'Soles', N'2955.00', N'pagado', N'0011-2071-28-0-1', N'8786.00', N'Soles', N'1252.00', N'0011-8787-22-0-1', N'Transferencia', N'Factura 06-1483', N'2494', N'SI', N'1703.00', N'-', N'-', N'-', N'3639', 6, 2, 1, NULL, 5, 14, 1)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (96, N'10759', N'Servicio de Gloria', N'Gloria', N'05/FEb/2016', 20160205, N'11/MAY/2016', 20160511, N'INTERbANK', N'Soles', N'3415.00', N'Reprogramado', N'0010-3063-54-0-1', N'9994.00', N'Soles', N'3291.00', N'0011-2071-28-0-1', N'Cheque', N'Factura 02-1032', N'1110', N'SI', N'124.00', N'-', N'-', N'-', N'3146', 7, 4, 1, NULL, 1, 15, 2)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (97, N'10559', N'Servicio de Cruz del Sur', N'Cruz del Sur', N'29/FEb/2016', 20160229, N'04/MAR/2016', 20160304, N'bbVA', N'Soles', N'2805.00', N'pagado', N'0011-2071-28-0-1', N'8119.00', N'Soles', N'446.00', N'0012-2449-88-0-1', N'Transferencia', N'Factura 06-1023', N'1948', N'SI', N'2359.00', N'-', N'-', N'-', N'2844', 5, 2, 1, NULL, 5, 16, 1)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (98, N'10290', N'Servicio de Edelnor', N'Edelnor', N'06/ENE/2016', 20160106, N'12/MAY/2016', 20160512, N'bbVA', N'Soles', N'860.00', N'pagado', N'0011-2071-28-0-1', N'7966.00', N'Soles', N'461.00', N'0011-8787-22-0-1', N'Transferencia', N'Factura 03-2691', N'3155', N'SI', N'399.00', N'-', N'-', N'-', N'3146', 6, 2, 1, NULL, 5, 14, 1)
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (99, N'10506', N'Servicio de backus', N'backus', N'01/FEb/2016', 20160201, N'12/MAY/2016', 20160512, N'bbVA', N'Soles', N'863.00', N'Reprogramado', N'0011-2071-28-0-1', N'7590.00', N'Soles', N'141.00', N'0010-2001-60-0-1', N'Cheque', N'Factura 07-2458', N'2588', N'SI', N'722.00', N'-', N'-', N'-', N'1424', 8, 2, 1, NULL, 5, 11, 2)
GO
INSERT [dbo].[t_orden_pago] ([id_Ordenpago], [nro_orden], [descripcion], [proveedor], [fecha_registro], [ffecha_registro], [fecha_pago], [ffecha_pago], [banco], [moneda], [monto_pago], [estado], [cuenta_origen], [saldo_cuenta_origen], [moneda_destino], [monto_destino], [cuenta_destino], [modalidad_pago], [documento_anexo], [nro_operacion], [diferencia], [monto_diferencia], [comentario], [motivo], [fecha_comentario], [nro_cronograma], [id_proveedor], [id_banco], [id_moneda], [id_cronograma], [id_cuenta_origen], [id_cuenta_destino], [id_modalidad]) VALUES (100, N'10162', N'Servicio de backus', N'backus', N'02/FEb/2016', 20160202, N'06/AbR/2016', 20160406, N'bCp', N'Soles', N'3499.00', N'Aprobado', N'0011-2733-75-0-1', N'7622.00', N'Soles', N'3499.00', N'0010-2001-60-0-1', N'Transferencia', N'Factura 05-2344', N'3529', N'NO', N'0.00', N'-', N'-', N'-', N'1218', 8, 1, 1, NULL, 7, 11, 1)
SET IDENTITY_INSERT [dbo].[t_orden_pago] OFF
SET IDENTITY_INSERT [dbo].[t_producto_canje] ON 

INSERT [dbo].[t_producto_canje] ([id_producto_canje], [fk_categoria_producto_canje], [nombre_producto], [costo], [fecha_alta], [fecha_baja], [fecha_inicio_vigencia], [fecha_fin_vigencia], [estado]) VALUES (1, 1, N'Refrigeradora Daewoo', NULL, CAST(N'2015-02-12 00:00:00.000' AS DateTime), CAST(N'2017-03-21 00:00:00.000' AS DateTime), CAST(N'2015-02-12' AS Date), CAST(N'2017-03-21' AS Date), N'A')
INSERT [dbo].[t_producto_canje] ([id_producto_canje], [fk_categoria_producto_canje], [nombre_producto], [costo], [fecha_alta], [fecha_baja], [fecha_inicio_vigencia], [fecha_fin_vigencia], [estado]) VALUES (2, 1, N'Olla Arrocera Indurama', NULL, CAST(N'2014-03-21 00:00:00.000' AS DateTime), CAST(N'2016-12-01 00:00:00.000' AS DateTime), CAST(N'2014-03-21' AS Date), CAST(N'2016-12-01' AS Date), N'A')
INSERT [dbo].[t_producto_canje] ([id_producto_canje], [fk_categoria_producto_canje], [nombre_producto], [costo], [fecha_alta], [fecha_baja], [fecha_inicio_vigencia], [fecha_fin_vigencia], [estado]) VALUES (3, 2, N'Ultrabook Intel', NULL, CAST(N'2015-11-01 00:00:00.000' AS DateTime), CAST(N'2016-11-20 00:00:00.000' AS DateTime), CAST(N'2015-11-01' AS Date), CAST(N'2016-11-20' AS Date), N'A')
INSERT [dbo].[t_producto_canje] ([id_producto_canje], [fk_categoria_producto_canje], [nombre_producto], [costo], [fecha_alta], [fecha_baja], [fecha_inicio_vigencia], [fecha_fin_vigencia], [estado]) VALUES (4, 2, N'GalaxyTab 3200', NULL, CAST(N'2016-01-01 00:00:00.000' AS DateTime), CAST(N'2017-01-01 00:00:00.000' AS DateTime), CAST(N'2016-01-01' AS Date), CAST(N'2017-01-01' AS Date), N'A')
INSERT [dbo].[t_producto_canje] ([id_producto_canje], [fk_categoria_producto_canje], [nombre_producto], [costo], [fecha_alta], [fecha_baja], [fecha_inicio_vigencia], [fecha_fin_vigencia], [estado]) VALUES (7, 3, N'Silla Poltrona Marron', NULL, CAST(N'2014-12-12 00:00:00.000' AS DateTime), CAST(N'2016-12-12 00:00:00.000' AS DateTime), CAST(N'2014-12-12' AS Date), CAST(N'2016-12-12' AS Date), N'A')
INSERT [dbo].[t_producto_canje] ([id_producto_canje], [fk_categoria_producto_canje], [nombre_producto], [costo], [fecha_alta], [fecha_baja], [fecha_inicio_vigencia], [fecha_fin_vigencia], [estado]) VALUES (9, 3, N'Sillón sin brazos', NULL, CAST(N'2015-11-12 00:00:00.000' AS DateTime), CAST(N'2017-02-12 00:00:00.000' AS DateTime), CAST(N'2015-11-12' AS Date), CAST(N'2017-02-12' AS Date), N'A')
INSERT [dbo].[t_producto_canje] ([id_producto_canje], [fk_categoria_producto_canje], [nombre_producto], [costo], [fecha_alta], [fecha_baja], [fecha_inicio_vigencia], [fecha_fin_vigencia], [estado]) VALUES (10, 4, N'Juego de Vasos Hogar', NULL, CAST(N'2016-01-01 00:00:00.000' AS DateTime), CAST(N'2017-02-12 00:00:00.000' AS DateTime), CAST(N'2016-01-01' AS Date), CAST(N'2017-02-12' AS Date), N'A')
INSERT [dbo].[t_producto_canje] ([id_producto_canje], [fk_categoria_producto_canje], [nombre_producto], [costo], [fecha_alta], [fecha_baja], [fecha_inicio_vigencia], [fecha_fin_vigencia], [estado]) VALUES (11, 4, N'Juego de Ollas de Acero Durex', NULL, CAST(N'2015-01-10 00:00:00.000' AS DateTime), CAST(N'2017-01-12 00:00:00.000' AS DateTime), CAST(N'2015-01-10' AS Date), CAST(N'2017-01-12' AS Date), N'A')
INSERT [dbo].[t_producto_canje] ([id_producto_canje], [fk_categoria_producto_canje], [nombre_producto], [costo], [fecha_alta], [fecha_baja], [fecha_inicio_vigencia], [fecha_fin_vigencia], [estado]) VALUES (12, 4, N'Porta Platos 2 pisos', NULL, CAST(N'2015-12-10 00:00:00.000' AS DateTime), CAST(N'2017-01-20 00:00:00.000' AS DateTime), CAST(N'2015-12-10' AS Date), CAST(N'2017-01-20' AS Date), N'A')
INSERT [dbo].[t_producto_canje] ([id_producto_canje], [fk_categoria_producto_canje], [nombre_producto], [costo], [fecha_alta], [fecha_baja], [fecha_inicio_vigencia], [fecha_fin_vigencia], [estado]) VALUES (13, 5, N'Colchón Style', NULL, CAST(N'2015-12-12 00:00:00.000' AS DateTime), CAST(N'2017-02-14 00:00:00.000' AS DateTime), CAST(N'2015-12-12' AS Date), CAST(N'2017-02-14' AS Date), N'A')
INSERT [dbo].[t_producto_canje] ([id_producto_canje], [fk_categoria_producto_canje], [nombre_producto], [costo], [fecha_alta], [fecha_baja], [fecha_inicio_vigencia], [fecha_fin_vigencia], [estado]) VALUES (14, 5, N'Cubrecama Hanna', NULL, CAST(N'2016-01-01 00:00:00.000' AS DateTime), CAST(N'2017-03-20 00:00:00.000' AS DateTime), CAST(N'2016-01-01' AS Date), CAST(N'2017-03-20' AS Date), N'A')
INSERT [dbo].[t_producto_canje] ([id_producto_canje], [fk_categoria_producto_canje], [nombre_producto], [costo], [fecha_alta], [fecha_baja], [fecha_inicio_vigencia], [fecha_fin_vigencia], [estado]) VALUES (15, 6, N'Eliptica E360', NULL, CAST(N'2015-01-01 00:00:00.000' AS DateTime), CAST(N'2016-12-12 00:00:00.000' AS DateTime), CAST(N'2015-01-01' AS Date), CAST(N'2016-12-12' AS Date), N'A')
INSERT [dbo].[t_producto_canje] ([id_producto_canje], [fk_categoria_producto_canje], [nombre_producto], [costo], [fecha_alta], [fecha_baja], [fecha_inicio_vigencia], [fecha_fin_vigencia], [estado]) VALUES (16, 6, N'Mancueras Xtreme', NULL, CAST(N'2015-12-20 00:00:00.000' AS DateTime), CAST(N'2017-02-05 00:00:00.000' AS DateTime), CAST(N'2015-12-20' AS Date), CAST(N'2017-02-05' AS Date), N'A')
INSERT [dbo].[t_producto_canje] ([id_producto_canje], [fk_categoria_producto_canje], [nombre_producto], [costo], [fecha_alta], [fecha_baja], [fecha_inicio_vigencia], [fecha_fin_vigencia], [estado]) VALUES (17, 7, N'Cartera Cryelle', NULL, CAST(N'2016-01-12 00:00:00.000' AS DateTime), CAST(N'2017-12-20 00:00:00.000' AS DateTime), CAST(N'2016-01-12' AS Date), CAST(N'2017-12-20' AS Date), N'A')
INSERT [dbo].[t_producto_canje] ([id_producto_canje], [fk_categoria_producto_canje], [nombre_producto], [costo], [fecha_alta], [fecha_baja], [fecha_inicio_vigencia], [fecha_fin_vigencia], [estado]) VALUES (18, 7, N'Reloj Dorado Movado', NULL, CAST(N'2016-01-01 00:00:00.000' AS DateTime), CAST(N'2017-08-05 00:00:00.000' AS DateTime), CAST(N'2016-01-01' AS Date), CAST(N'2017-08-05' AS Date), N'A')
INSERT [dbo].[t_producto_canje] ([id_producto_canje], [fk_categoria_producto_canje], [nombre_producto], [costo], [fecha_alta], [fecha_baja], [fecha_inicio_vigencia], [fecha_fin_vigencia], [estado]) VALUES (20, 9, N'Caja de Rosas Rosatel', NULL, CAST(N'2016-01-01 00:00:00.000' AS DateTime), CAST(N'2017-01-01 00:00:00.000' AS DateTime), CAST(N'2016-01-01' AS Date), CAST(N'2017-01-01' AS Date), N'A')
INSERT [dbo].[t_producto_canje] ([id_producto_canje], [fk_categoria_producto_canje], [nombre_producto], [costo], [fecha_alta], [fecha_baja], [fecha_inicio_vigencia], [fecha_fin_vigencia], [estado]) VALUES (21, 9, N'Vino Gran Tinto', NULL, CAST(N'2016-01-01 00:00:00.000' AS DateTime), CAST(N'2017-01-01 00:00:00.000' AS DateTime), CAST(N'2016-01-01' AS Date), CAST(N'2017-01-01' AS Date), N'A')
INSERT [dbo].[t_producto_canje] ([id_producto_canje], [fk_categoria_producto_canje], [nombre_producto], [costo], [fecha_alta], [fecha_baja], [fecha_inicio_vigencia], [fecha_fin_vigencia], [estado]) VALUES (22, 10, N'Silla de comer musical', NULL, CAST(N'2015-01-06 00:00:00.000' AS DateTime), CAST(N'2016-12-12 00:00:00.000' AS DateTime), CAST(N'2015-01-06' AS Date), CAST(N'2016-12-12' AS Date), N'A')
INSERT [dbo].[t_producto_canje] ([id_producto_canje], [fk_categoria_producto_canje], [nombre_producto], [costo], [fecha_alta], [fecha_baja], [fecha_inicio_vigencia], [fecha_fin_vigencia], [estado]) VALUES (23, 10, N'Perfume Hugo Boss', NULL, CAST(N'2016-02-12 00:00:00.000' AS DateTime), CAST(N'2017-03-09 00:00:00.000' AS DateTime), CAST(N'2016-02-12' AS Date), CAST(N'2017-03-09' AS Date), N'A')
SET IDENTITY_INSERT [dbo].[t_producto_canje] OFF
SET IDENTITY_INSERT [dbo].[t_proveedor] ON 

INSERT [dbo].[t_proveedor] ([id_proveedor], [razon_social], [ruc]) VALUES (5, N'Cruz del Sur', N'20126612819')
INSERT [dbo].[t_proveedor] ([id_proveedor], [razon_social], [ruc]) VALUES (6, N'Edelnor', N'20125128312')
INSERT [dbo].[t_proveedor] ([id_proveedor], [razon_social], [ruc]) VALUES (7, N'Gloria', N'20126612972')
INSERT [dbo].[t_proveedor] ([id_proveedor], [razon_social], [ruc]) VALUES (8, N'Backus', N'20122131125')
SET IDENTITY_INSERT [dbo].[t_proveedor] OFF
SET IDENTITY_INSERT [dbo].[t_reporte_stock_anual] ON 

INSERT [dbo].[t_reporte_stock_anual] ([id_reporte_stock_anual], [fk_producto_canje], [anio], [stock_inicial]) VALUES (1, 2, 2015, CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[t_reporte_stock_anual] ([id_reporte_stock_anual], [fk_producto_canje], [anio], [stock_inicial]) VALUES (2, 2, 2016, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[t_reporte_stock_anual] ([id_reporte_stock_anual], [fk_producto_canje], [anio], [stock_inicial]) VALUES (4, 1, 2015, CAST(20 AS Decimal(18, 0)))
INSERT [dbo].[t_reporte_stock_anual] ([id_reporte_stock_anual], [fk_producto_canje], [anio], [stock_inicial]) VALUES (5, 1, 2016, CAST(20 AS Decimal(18, 0)))
INSERT [dbo].[t_reporte_stock_anual] ([id_reporte_stock_anual], [fk_producto_canje], [anio], [stock_inicial]) VALUES (6, 3, 2015, CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[t_reporte_stock_anual] ([id_reporte_stock_anual], [fk_producto_canje], [anio], [stock_inicial]) VALUES (7, 3, 2016, CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[t_reporte_stock_anual] ([id_reporte_stock_anual], [fk_producto_canje], [anio], [stock_inicial]) VALUES (10, 4, 2015, CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[t_reporte_stock_anual] ([id_reporte_stock_anual], [fk_producto_canje], [anio], [stock_inicial]) VALUES (11, 4, 2016, CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[t_reporte_stock_anual] ([id_reporte_stock_anual], [fk_producto_canje], [anio], [stock_inicial]) VALUES (13, 10, 2015, CAST(32 AS Decimal(18, 0)))
INSERT [dbo].[t_reporte_stock_anual] ([id_reporte_stock_anual], [fk_producto_canje], [anio], [stock_inicial]) VALUES (14, 10, 2016, CAST(32 AS Decimal(18, 0)))
INSERT [dbo].[t_reporte_stock_anual] ([id_reporte_stock_anual], [fk_producto_canje], [anio], [stock_inicial]) VALUES (15, 11, 2015, CAST(32 AS Decimal(18, 0)))
INSERT [dbo].[t_reporte_stock_anual] ([id_reporte_stock_anual], [fk_producto_canje], [anio], [stock_inicial]) VALUES (16, 11, 2016, CAST(32 AS Decimal(18, 0)))
INSERT [dbo].[t_reporte_stock_anual] ([id_reporte_stock_anual], [fk_producto_canje], [anio], [stock_inicial]) VALUES (17, 12, 2015, CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[t_reporte_stock_anual] ([id_reporte_stock_anual], [fk_producto_canje], [anio], [stock_inicial]) VALUES (18, 12, 2016, CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[t_reporte_stock_anual] ([id_reporte_stock_anual], [fk_producto_canje], [anio], [stock_inicial]) VALUES (19, 7, 2015, CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[t_reporte_stock_anual] ([id_reporte_stock_anual], [fk_producto_canje], [anio], [stock_inicial]) VALUES (20, 9, 2015, CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[t_reporte_stock_anual] ([id_reporte_stock_anual], [fk_producto_canje], [anio], [stock_inicial]) VALUES (21, 13, 2015, CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[t_reporte_stock_anual] ([id_reporte_stock_anual], [fk_producto_canje], [anio], [stock_inicial]) VALUES (22, 14, 2015, CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[t_reporte_stock_anual] ([id_reporte_stock_anual], [fk_producto_canje], [anio], [stock_inicial]) VALUES (23, 15, 2015, CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[t_reporte_stock_anual] ([id_reporte_stock_anual], [fk_producto_canje], [anio], [stock_inicial]) VALUES (24, 16, 2015, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[t_reporte_stock_anual] ([id_reporte_stock_anual], [fk_producto_canje], [anio], [stock_inicial]) VALUES (25, 17, 2015, CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[t_reporte_stock_anual] ([id_reporte_stock_anual], [fk_producto_canje], [anio], [stock_inicial]) VALUES (26, 18, 2015, CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[t_reporte_stock_anual] ([id_reporte_stock_anual], [fk_producto_canje], [anio], [stock_inicial]) VALUES (27, 20, 2015, CAST(16 AS Decimal(18, 0)))
INSERT [dbo].[t_reporte_stock_anual] ([id_reporte_stock_anual], [fk_producto_canje], [anio], [stock_inicial]) VALUES (28, 21, 2015, CAST(6 AS Decimal(18, 0)))
INSERT [dbo].[t_reporte_stock_anual] ([id_reporte_stock_anual], [fk_producto_canje], [anio], [stock_inicial]) VALUES (29, 22, 2015, CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[t_reporte_stock_anual] ([id_reporte_stock_anual], [fk_producto_canje], [anio], [stock_inicial]) VALUES (30, 23, 2015, CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[t_reporte_stock_anual] ([id_reporte_stock_anual], [fk_producto_canje], [anio], [stock_inicial]) VALUES (31, 7, 2016, CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[t_reporte_stock_anual] ([id_reporte_stock_anual], [fk_producto_canje], [anio], [stock_inicial]) VALUES (32, 9, 2016, CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[t_reporte_stock_anual] ([id_reporte_stock_anual], [fk_producto_canje], [anio], [stock_inicial]) VALUES (33, 13, 2016, CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[t_reporte_stock_anual] ([id_reporte_stock_anual], [fk_producto_canje], [anio], [stock_inicial]) VALUES (34, 14, 2016, CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[t_reporte_stock_anual] ([id_reporte_stock_anual], [fk_producto_canje], [anio], [stock_inicial]) VALUES (35, 15, 2016, CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[t_reporte_stock_anual] ([id_reporte_stock_anual], [fk_producto_canje], [anio], [stock_inicial]) VALUES (36, 16, 2016, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[t_reporte_stock_anual] ([id_reporte_stock_anual], [fk_producto_canje], [anio], [stock_inicial]) VALUES (37, 17, 2016, CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[t_reporte_stock_anual] ([id_reporte_stock_anual], [fk_producto_canje], [anio], [stock_inicial]) VALUES (38, 18, 2016, CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[t_reporte_stock_anual] ([id_reporte_stock_anual], [fk_producto_canje], [anio], [stock_inicial]) VALUES (39, 20, 2016, CAST(16 AS Decimal(18, 0)))
INSERT [dbo].[t_reporte_stock_anual] ([id_reporte_stock_anual], [fk_producto_canje], [anio], [stock_inicial]) VALUES (40, 21, 2016, CAST(6 AS Decimal(18, 0)))
INSERT [dbo].[t_reporte_stock_anual] ([id_reporte_stock_anual], [fk_producto_canje], [anio], [stock_inicial]) VALUES (41, 22, 2016, CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[t_reporte_stock_anual] ([id_reporte_stock_anual], [fk_producto_canje], [anio], [stock_inicial]) VALUES (42, 23, 2016, CAST(12 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[t_reporte_stock_anual] OFF
SET IDENTITY_INSERT [dbo].[t_reporte_stock_producto_canje] ON 

INSERT [dbo].[t_reporte_stock_producto_canje] ([id_reporte_stock_producto_canje], [fk_producto_canje], [fk_tienda], [stock], [fecha]) VALUES (1, 2, 1, CAST(1 AS Numeric(18, 0)), CAST(N'2016-05-10 00:00:00.000' AS DateTime))
INSERT [dbo].[t_reporte_stock_producto_canje] ([id_reporte_stock_producto_canje], [fk_producto_canje], [fk_tienda], [stock], [fecha]) VALUES (2, 4, 1, CAST(0 AS Numeric(18, 0)), CAST(N'2016-05-10 00:00:00.000' AS DateTime))
INSERT [dbo].[t_reporte_stock_producto_canje] ([id_reporte_stock_producto_canje], [fk_producto_canje], [fk_tienda], [stock], [fecha]) VALUES (3, 10, 1, CAST(0 AS Numeric(18, 0)), CAST(N'2016-05-10 00:00:00.000' AS DateTime))
INSERT [dbo].[t_reporte_stock_producto_canje] ([id_reporte_stock_producto_canje], [fk_producto_canje], [fk_tienda], [stock], [fecha]) VALUES (4, 11, 1, CAST(-13 AS Numeric(18, 0)), CAST(N'2016-05-10 00:00:00.000' AS DateTime))
INSERT [dbo].[t_reporte_stock_producto_canje] ([id_reporte_stock_producto_canje], [fk_producto_canje], [fk_tienda], [stock], [fecha]) VALUES (5, 12, 1, CAST(3 AS Numeric(18, 0)), CAST(N'2016-05-10 00:00:00.000' AS DateTime))
INSERT [dbo].[t_reporte_stock_producto_canje] ([id_reporte_stock_producto_canje], [fk_producto_canje], [fk_tienda], [stock], [fecha]) VALUES (6, 16, 1, CAST(6 AS Numeric(18, 0)), CAST(N'2016-05-10 00:00:00.000' AS DateTime))
INSERT [dbo].[t_reporte_stock_producto_canje] ([id_reporte_stock_producto_canje], [fk_producto_canje], [fk_tienda], [stock], [fecha]) VALUES (7, 17, 1, CAST(12 AS Numeric(18, 0)), CAST(N'2016-05-10 00:00:00.000' AS DateTime))
INSERT [dbo].[t_reporte_stock_producto_canje] ([id_reporte_stock_producto_canje], [fk_producto_canje], [fk_tienda], [stock], [fecha]) VALUES (8, 18, 1, CAST(8 AS Numeric(18, 0)), CAST(N'2016-05-10 00:00:00.000' AS DateTime))
INSERT [dbo].[t_reporte_stock_producto_canje] ([id_reporte_stock_producto_canje], [fk_producto_canje], [fk_tienda], [stock], [fecha]) VALUES (14, 20, 1, CAST(4 AS Numeric(18, 0)), CAST(N'2016-05-10 00:00:00.000' AS DateTime))
INSERT [dbo].[t_reporte_stock_producto_canje] ([id_reporte_stock_producto_canje], [fk_producto_canje], [fk_tienda], [stock], [fecha]) VALUES (15, 21, 1, CAST(0 AS Numeric(18, 0)), CAST(N'2016-05-10 00:00:00.000' AS DateTime))
INSERT [dbo].[t_reporte_stock_producto_canje] ([id_reporte_stock_producto_canje], [fk_producto_canje], [fk_tienda], [stock], [fecha]) VALUES (16, 1, 1, CAST(17 AS Numeric(18, 0)), CAST(N'2016-05-04 05:36:30.533' AS DateTime))
INSERT [dbo].[t_reporte_stock_producto_canje] ([id_reporte_stock_producto_canje], [fk_producto_canje], [fk_tienda], [stock], [fecha]) VALUES (17, 3, 1, CAST(15 AS Numeric(18, 0)), CAST(N'2016-05-20 09:18:10.753' AS DateTime))
INSERT [dbo].[t_reporte_stock_producto_canje] ([id_reporte_stock_producto_canje], [fk_producto_canje], [fk_tienda], [stock], [fecha]) VALUES (18, 7, 1, CAST(2 AS Numeric(18, 0)), CAST(N'2016-05-03 22:49:47.923' AS DateTime))
INSERT [dbo].[t_reporte_stock_producto_canje] ([id_reporte_stock_producto_canje], [fk_producto_canje], [fk_tienda], [stock], [fecha]) VALUES (19, 9, 1, CAST(4 AS Numeric(18, 0)), CAST(N'2016-05-18 07:44:48.903' AS DateTime))
INSERT [dbo].[t_reporte_stock_producto_canje] ([id_reporte_stock_producto_canje], [fk_producto_canje], [fk_tienda], [stock], [fecha]) VALUES (20, 13, 1, CAST(2 AS Numeric(18, 0)), CAST(N'2016-05-22 02:44:17.240' AS DateTime))
INSERT [dbo].[t_reporte_stock_producto_canje] ([id_reporte_stock_producto_canje], [fk_producto_canje], [fk_tienda], [stock], [fecha]) VALUES (21, 14, 1, CAST(21 AS Numeric(18, 0)), CAST(N'2016-05-18 22:00:10.947' AS DateTime))
INSERT [dbo].[t_reporte_stock_producto_canje] ([id_reporte_stock_producto_canje], [fk_producto_canje], [fk_tienda], [stock], [fecha]) VALUES (22, 15, 1, CAST(14 AS Numeric(18, 0)), CAST(N'2016-05-13 07:57:21.770' AS DateTime))
INSERT [dbo].[t_reporte_stock_producto_canje] ([id_reporte_stock_producto_canje], [fk_producto_canje], [fk_tienda], [stock], [fecha]) VALUES (23, 22, 1, CAST(1 AS Numeric(18, 0)), CAST(N'2016-05-27 11:25:41.967' AS DateTime))
INSERT [dbo].[t_reporte_stock_producto_canje] ([id_reporte_stock_producto_canje], [fk_producto_canje], [fk_tienda], [stock], [fecha]) VALUES (24, 23, 1, CAST(0 AS Numeric(18, 0)), CAST(N'2016-05-11 04:18:50.807' AS DateTime))
SET IDENTITY_INSERT [dbo].[t_reporte_stock_producto_canje] OFF
SET IDENTITY_INSERT [dbo].[t_tarjera_afiliacion_cuenta] ON 

INSERT [dbo].[t_tarjera_afiliacion_cuenta] ([id_tarjeta_afiliacion_cuenta], [fk_tarjeta_afiliacion], [fk_cuenta], [fecha_afiliacion], [estado]) VALUES (1, 1, 1, CAST(N'2016-05-28 00:00:00.000' AS DateTime), N'A')
INSERT [dbo].[t_tarjera_afiliacion_cuenta] ([id_tarjeta_afiliacion_cuenta], [fk_tarjeta_afiliacion], [fk_cuenta], [fecha_afiliacion], [estado]) VALUES (2, 2, 2, CAST(N'2016-05-28 00:00:00.000' AS DateTime), N'A')
INSERT [dbo].[t_tarjera_afiliacion_cuenta] ([id_tarjeta_afiliacion_cuenta], [fk_tarjeta_afiliacion], [fk_cuenta], [fecha_afiliacion], [estado]) VALUES (3, 3, 3, CAST(N'2016-05-28 00:00:00.000' AS DateTime), N'A')
INSERT [dbo].[t_tarjera_afiliacion_cuenta] ([id_tarjeta_afiliacion_cuenta], [fk_tarjeta_afiliacion], [fk_cuenta], [fecha_afiliacion], [estado]) VALUES (4, 4, 4, CAST(N'2016-05-28 00:00:00.000' AS DateTime), N'A')
SET IDENTITY_INSERT [dbo].[t_tarjera_afiliacion_cuenta] OFF
SET IDENTITY_INSERT [dbo].[t_tarjeta_afiliacion] ON 

INSERT [dbo].[t_tarjeta_afiliacion] ([id_tarjeta_afiliacion], [fecha_vencimiento], [numero_tarjeta], [fecha_emision], [estado], [motivo]) VALUES (1, CAST(N'2021-05-24 00:00:00.000' AS DateTime), N'452010982001', CAST(N'2016-05-24 00:00:00.000' AS DateTime), N'A', N'')
INSERT [dbo].[t_tarjeta_afiliacion] ([id_tarjeta_afiliacion], [fecha_vencimiento], [numero_tarjeta], [fecha_emision], [estado], [motivo]) VALUES (2, CAST(N'2021-05-26 00:00:00.000' AS DateTime), N'452045678900', CAST(N'2016-05-26 00:00:00.000' AS DateTime), N'A', N'')
INSERT [dbo].[t_tarjeta_afiliacion] ([id_tarjeta_afiliacion], [fecha_vencimiento], [numero_tarjeta], [fecha_emision], [estado], [motivo]) VALUES (3, CAST(N'2021-05-26 00:00:00.000' AS DateTime), N'452033333333', CAST(N'2016-05-26 00:00:00.000' AS DateTime), N'A', N'')
INSERT [dbo].[t_tarjeta_afiliacion] ([id_tarjeta_afiliacion], [fecha_vencimiento], [numero_tarjeta], [fecha_emision], [estado], [motivo]) VALUES (4, CAST(N'2021-05-26 00:00:00.000' AS DateTime), N'452011111112', CAST(N'2016-05-26 00:00:00.000' AS DateTime), N'A', NULL)
INSERT [dbo].[t_tarjeta_afiliacion] ([id_tarjeta_afiliacion], [fecha_vencimiento], [numero_tarjeta], [fecha_emision], [estado], [motivo]) VALUES (43, CAST(N'2021-06-13 13:49:48.017' AS DateTime), N'452098765433', CAST(N'2016-06-13 13:49:48.017' AS DateTime), N'A', NULL)
SET IDENTITY_INSERT [dbo].[t_tarjeta_afiliacion] OFF
SET IDENTITY_INSERT [dbo].[t_ticket_canje] ON 

INSERT [dbo].[t_ticket_canje] ([id_ticket_canje], [numero_ticket], [fecha_ticket], [fk_cuenta], [fk_tienda], [puntos], [importe], [estado]) VALUES (3, N'PVCANJE-2016-05-0003          ', CAST(N'2016-05-15' AS Date), 1, 1, CAST(200 AS Numeric(18, 0)), CAST(80.00 AS Numeric(18, 2)), N'C')
INSERT [dbo].[t_ticket_canje] ([id_ticket_canje], [numero_ticket], [fecha_ticket], [fk_cuenta], [fk_tienda], [puntos], [importe], [estado]) VALUES (4, N'PVCANJE-2016-06-0004          ', CAST(N'2016-06-15' AS Date), 3, 1, CAST(0 AS Numeric(18, 0)), CAST(160.00 AS Numeric(18, 2)), N'C')
INSERT [dbo].[t_ticket_canje] ([id_ticket_canje], [numero_ticket], [fecha_ticket], [fk_cuenta], [fk_tienda], [puntos], [importe], [estado]) VALUES (5, N'PVCANJE-2015-08-0005          ', CAST(N'2015-08-21' AS Date), 1, 1, CAST(70 AS Numeric(18, 0)), CAST(30.00 AS Numeric(18, 2)), N'C')
INSERT [dbo].[t_ticket_canje] ([id_ticket_canje], [numero_ticket], [fecha_ticket], [fk_cuenta], [fk_tienda], [puntos], [importe], [estado]) VALUES (6, N'PVCANJE-2015-05-0006          ', CAST(N'2015-12-23' AS Date), 1, 1, CAST(200 AS Numeric(18, 0)), CAST(60.00 AS Numeric(18, 2)), N'C')
INSERT [dbo].[t_ticket_canje] ([id_ticket_canje], [numero_ticket], [fecha_ticket], [fk_cuenta], [fk_tienda], [puntos], [importe], [estado]) VALUES (7, N'PVCANJE-2016-05-0007          ', CAST(N'2016-05-24' AS Date), 1, 1, CAST(330 AS Numeric(18, 0)), CAST(20.00 AS Numeric(18, 2)), N'C')
INSERT [dbo].[t_ticket_canje] ([id_ticket_canje], [numero_ticket], [fecha_ticket], [fk_cuenta], [fk_tienda], [puntos], [importe], [estado]) VALUES (8, N'PVCANJE-2016-05-0008          ', CAST(N'2016-05-28' AS Date), 1, 1, CAST(0 AS Numeric(18, 0)), CAST(80.00 AS Numeric(18, 2)), N'C')
INSERT [dbo].[t_ticket_canje] ([id_ticket_canje], [numero_ticket], [fecha_ticket], [fk_cuenta], [fk_tienda], [puntos], [importe], [estado]) VALUES (9, N'PVCANJE-2016-05-0009          ', CAST(N'2016-05-29' AS Date), 1, 1, CAST(10 AS Numeric(18, 0)), CAST(20.00 AS Numeric(18, 2)), N'C')
INSERT [dbo].[t_ticket_canje] ([id_ticket_canje], [numero_ticket], [fecha_ticket], [fk_cuenta], [fk_tienda], [puntos], [importe], [estado]) VALUES (10, N'PVCANJE-2016-05-0010          ', CAST(N'2016-05-29' AS Date), 1, 1, CAST(120 AS Numeric(18, 0)), CAST(0.00 AS Numeric(18, 2)), N'C')
INSERT [dbo].[t_ticket_canje] ([id_ticket_canje], [numero_ticket], [fecha_ticket], [fk_cuenta], [fk_tienda], [puntos], [importe], [estado]) VALUES (11, N'PVCANJE-2016-05-0011          ', CAST(N'2016-05-29' AS Date), 1, 1, CAST(0 AS Numeric(18, 0)), CAST(80.00 AS Numeric(18, 2)), N'C')
INSERT [dbo].[t_ticket_canje] ([id_ticket_canje], [numero_ticket], [fecha_ticket], [fk_cuenta], [fk_tienda], [puntos], [importe], [estado]) VALUES (13, N'PVCANJE-2016-06-0013          ', CAST(N'2016-06-03' AS Date), 1, 1, CAST(320 AS Numeric(18, 0)), CAST(0.00 AS Numeric(18, 2)), N'C')
INSERT [dbo].[t_ticket_canje] ([id_ticket_canje], [numero_ticket], [fecha_ticket], [fk_cuenta], [fk_tienda], [puntos], [importe], [estado]) VALUES (14, N'PVCANJE-2016-06-0014          ', CAST(N'2016-06-03' AS Date), 1, 1, CAST(320 AS Numeric(18, 0)), CAST(0.00 AS Numeric(18, 2)), N'C')
INSERT [dbo].[t_ticket_canje] ([id_ticket_canje], [numero_ticket], [fecha_ticket], [fk_cuenta], [fk_tienda], [puntos], [importe], [estado]) VALUES (15, N'PVCANJE-2016-06-0015          ', CAST(N'2016-06-03' AS Date), 1, 1, CAST(80 AS Numeric(18, 0)), CAST(0.00 AS Numeric(18, 2)), N'C')
INSERT [dbo].[t_ticket_canje] ([id_ticket_canje], [numero_ticket], [fecha_ticket], [fk_cuenta], [fk_tienda], [puntos], [importe], [estado]) VALUES (16, N'PVCANJE-2016-06-0016          ', CAST(N'2016-06-04' AS Date), 1, 1, CAST(0 AS Numeric(18, 0)), CAST(40.00 AS Numeric(18, 2)), N'C')
INSERT [dbo].[t_ticket_canje] ([id_ticket_canje], [numero_ticket], [fecha_ticket], [fk_cuenta], [fk_tienda], [puntos], [importe], [estado]) VALUES (17, N'PVCANJE-2016-06-0017          ', CAST(N'2016-06-04' AS Date), 1, 1, CAST(160 AS Numeric(18, 0)), CAST(0.00 AS Numeric(18, 2)), N'C')
INSERT [dbo].[t_ticket_canje] ([id_ticket_canje], [numero_ticket], [fecha_ticket], [fk_cuenta], [fk_tienda], [puntos], [importe], [estado]) VALUES (18, N'PVCANJE-2016-06-0018          ', CAST(N'2016-06-04' AS Date), 1, 1, CAST(80 AS Numeric(18, 0)), CAST(0.00 AS Numeric(18, 2)), N'C')
INSERT [dbo].[t_ticket_canje] ([id_ticket_canje], [numero_ticket], [fecha_ticket], [fk_cuenta], [fk_tienda], [puntos], [importe], [estado]) VALUES (19, N'PVCANJE-2016-06-0019          ', CAST(N'2016-06-06' AS Date), 1, 1, CAST(80 AS Numeric(18, 0)), CAST(0.00 AS Numeric(18, 2)), N'C')
INSERT [dbo].[t_ticket_canje] ([id_ticket_canje], [numero_ticket], [fecha_ticket], [fk_cuenta], [fk_tienda], [puntos], [importe], [estado]) VALUES (20, N'PVCANJE-2016-06-0020          ', CAST(N'2016-06-07' AS Date), 1, 1, CAST(80 AS Numeric(18, 0)), CAST(0.00 AS Numeric(18, 2)), N'C')
INSERT [dbo].[t_ticket_canje] ([id_ticket_canje], [numero_ticket], [fecha_ticket], [fk_cuenta], [fk_tienda], [puntos], [importe], [estado]) VALUES (21, N'PVCANJE-2016-06-0021          ', CAST(N'2016-06-07' AS Date), 1, 1, CAST(0 AS Numeric(18, 0)), CAST(40.00 AS Numeric(18, 2)), N'C')
SET IDENTITY_INSERT [dbo].[t_ticket_canje] OFF
SET IDENTITY_INSERT [dbo].[t_ticket_transferencia] ON 

INSERT [dbo].[t_ticket_transferencia] ([id_transferencia], [puntos_transferidos], [numero_ticket], [fecha_transferencia], [motivo_transferencia], [cuenta_origen], [fk_cuenta], [cuenta_destino]) VALUES (1, 200, NULL, CAST(N'2016-05-05 17:09:29.157' AS DateTime), N'', N'PVB-20164254560601', 1, N'PVB-20154567890001')
INSERT [dbo].[t_ticket_transferencia] ([id_transferencia], [puntos_transferidos], [numero_ticket], [fecha_transferencia], [motivo_transferencia], [cuenta_origen], [fk_cuenta], [cuenta_destino]) VALUES (2, 200, N'TRAN-00002', CAST(N'2016-05-05 17:21:55.850' AS DateTime), N'', N'PVB-20164254560601', 1, N'PVB-20154567890001')
INSERT [dbo].[t_ticket_transferencia] ([id_transferencia], [puntos_transferidos], [numero_ticket], [fecha_transferencia], [motivo_transferencia], [cuenta_origen], [fk_cuenta], [cuenta_destino]) VALUES (3, 100, N'TRAN-00003', CAST(N'2016-05-10 23:09:36.993' AS DateTime), N'ninguno', N'PVB-20164254560601', 1, N'PVB-20154567890001')
INSERT [dbo].[t_ticket_transferencia] ([id_transferencia], [puntos_transferidos], [numero_ticket], [fecha_transferencia], [motivo_transferencia], [cuenta_origen], [fk_cuenta], [cuenta_destino]) VALUES (4, 100, N'TRAN-00004', CAST(N'2016-05-24 17:35:51.727' AS DateTime), N'Prueba', N'9020164254560601', 1, N'9020154567890001')
INSERT [dbo].[t_ticket_transferencia] ([id_transferencia], [puntos_transferidos], [numero_ticket], [fecha_transferencia], [motivo_transferencia], [cuenta_origen], [fk_cuenta], [cuenta_destino]) VALUES (5, 100, N'TRAN-00005', CAST(N'2016-05-25 01:48:34.863' AS DateTime), N'Transferir puntos a Cuenta Destino', N'9020164254560601', 1, N'9020154567890001')
INSERT [dbo].[t_ticket_transferencia] ([id_transferencia], [puntos_transferidos], [numero_ticket], [fecha_transferencia], [motivo_transferencia], [cuenta_origen], [fk_cuenta], [cuenta_destino]) VALUES (6, 9, N'TRAN-00006', CAST(N'2016-05-29 06:20:52.223' AS DateTime), N'prueba', N'9020163965254501', 4, N'9020164254560601')
INSERT [dbo].[t_ticket_transferencia] ([id_transferencia], [puntos_transferidos], [numero_ticket], [fecha_transferencia], [motivo_transferencia], [cuenta_origen], [fk_cuenta], [cuenta_destino]) VALUES (7, 100, N'TRAN-00007', CAST(N'2016-05-29 13:57:39.107' AS DateTime), N'Me sobran puntos', N'9020164254560601', 1, N'6912908401238127')
INSERT [dbo].[t_ticket_transferencia] ([id_transferencia], [puntos_transferidos], [numero_ticket], [fecha_transferencia], [motivo_transferencia], [cuenta_origen], [fk_cuenta], [cuenta_destino]) VALUES (8, 14, N'TRAN-00008', CAST(N'2016-06-03 01:51:08.520' AS DateTime), N'asdasdasd', N'9020164254560601', 1, N'5893939254489668')
SET IDENTITY_INSERT [dbo].[t_ticket_transferencia] OFF
SET IDENTITY_INSERT [dbo].[t_tienda] ON 

INSERT [dbo].[t_tienda] ([id_tienda], [nombre_tienda], [nombre_direccion], [fecha_apertura], [distrito], [provincia], [departamento], [tipo_tienda], [pais], [descripcion_tienda], [latitud], [id_zona], [longitud], [horario]) VALUES (1, N'Plaza Vea Risso', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[t_tienda] ([id_tienda], [nombre_tienda], [nombre_direccion], [fecha_apertura], [distrito], [provincia], [departamento], [tipo_tienda], [pais], [descripcion_tienda], [latitud], [id_zona], [longitud], [horario]) VALUES (2, N'Plaza Vea San Miguel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[t_tienda] ([id_tienda], [nombre_tienda], [nombre_direccion], [fecha_apertura], [distrito], [provincia], [departamento], [tipo_tienda], [pais], [descripcion_tienda], [latitud], [id_zona], [longitud], [horario]) VALUES (3, N'Plaza Vea Primavera', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[t_tienda] ([id_tienda], [nombre_tienda], [nombre_direccion], [fecha_apertura], [distrito], [provincia], [departamento], [tipo_tienda], [pais], [descripcion_tienda], [latitud], [id_zona], [longitud], [horario]) VALUES (4, N'Plaza Vea Ate', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[t_tienda] OFF
SET IDENTITY_INSERT [dbo].[t_tipo_comprobante] ON 

INSERT [dbo].[t_tipo_comprobante] ([id_tipo_comprobante], [descripcion], [abreviatura], [correlativo]) VALUES (1, N'Boleta', N'BO', 1)
INSERT [dbo].[t_tipo_comprobante] ([id_tipo_comprobante], [descripcion], [abreviatura], [correlativo]) VALUES (2, N'Factura', N'FA', 1)
SET IDENTITY_INSERT [dbo].[t_tipo_comprobante] OFF
INSERT [dbo].[t_tipo_cuenta] ([id_tipo_cuenta], [tipo_cuenta]) VALUES (1, N'Titular')
INSERT [dbo].[t_tipo_cuenta] ([id_tipo_cuenta], [tipo_cuenta]) VALUES (2, N'Adicional')
INSERT [dbo].[t_tipo_documento] ([id_tipo_documento], [tipo_documento]) VALUES (1, N'DNI')
INSERT [dbo].[t_tipo_documento] ([id_tipo_documento], [tipo_documento]) VALUES (2, N'Carnet de Extrangería')
SET IDENTITY_INSERT [dbo].[t_tipo_servicio] ON 

INSERT [dbo].[t_tipo_servicio] ([id_tipo_servicio], [descripcion], [porcentaje_comision], [tipo], [habilitado ]) VALUES (1, N'Edelnor', CAST(0.00 AS Decimal(18, 2)), N'S', 1)
INSERT [dbo].[t_tipo_servicio] ([id_tipo_servicio], [descripcion], [porcentaje_comision], [tipo], [habilitado ]) VALUES (3, N'Luz del Sur', CAST(0.00 AS Decimal(18, 2)), N'S', 1)
INSERT [dbo].[t_tipo_servicio] ([id_tipo_servicio], [descripcion], [porcentaje_comision], [tipo], [habilitado ]) VALUES (5, N'Movistar Fijo', CAST(0.00 AS Decimal(18, 2)), N'S', 1)
INSERT [dbo].[t_tipo_servicio] ([id_tipo_servicio], [descripcion], [porcentaje_comision], [tipo], [habilitado ]) VALUES (7, N'Sedapal', CAST(0.00 AS Decimal(18, 2)), N'S', 1)
INSERT [dbo].[t_tipo_servicio] ([id_tipo_servicio], [descripcion], [porcentaje_comision], [tipo], [habilitado ]) VALUES (8, N'Claro Fijo', CAST(0.00 AS Decimal(18, 2)), N'S', 1)
INSERT [dbo].[t_tipo_servicio] ([id_tipo_servicio], [descripcion], [porcentaje_comision], [tipo], [habilitado ]) VALUES (9, N'Movistar', CAST(0.00 AS Decimal(18, 2)), N'R', 1)
INSERT [dbo].[t_tipo_servicio] ([id_tipo_servicio], [descripcion], [porcentaje_comision], [tipo], [habilitado ]) VALUES (10, N'Claro', CAST(0.00 AS Decimal(18, 2)), N'R', 1)
INSERT [dbo].[t_tipo_servicio] ([id_tipo_servicio], [descripcion], [porcentaje_comision], [tipo], [habilitado ]) VALUES (11, N'Entel', CAST(0.00 AS Decimal(18, 2)), N'R', 1)
INSERT [dbo].[t_tipo_servicio] ([id_tipo_servicio], [descripcion], [porcentaje_comision], [tipo], [habilitado ]) VALUES (12, N'Bitel', CAST(0.00 AS Decimal(18, 2)), N'R', 1)
INSERT [dbo].[t_tipo_servicio] ([id_tipo_servicio], [descripcion], [porcentaje_comision], [tipo], [habilitado ]) VALUES (13, N'Movistar Movil', CAST(0.00 AS Decimal(18, 2)), N'S', 1)
INSERT [dbo].[t_tipo_servicio] ([id_tipo_servicio], [descripcion], [porcentaje_comision], [tipo], [habilitado ]) VALUES (14, N'Claro Movil', CAST(0.00 AS Decimal(18, 2)), N'S', 1)
SET IDENTITY_INSERT [dbo].[t_tipo_servicio] OFF
SET IDENTITY_INSERT [dbo].[t_transferencia_pago] ON 

INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (601, N'00008086', N'backus', N'16/MAR/2016', 20160316, N'3633.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'704743', N'bCp', N'0010-2001-60-0-1', N'Soles', 8, 1, 1, 1, 7, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (602, N'00007564', N'Cruz del Sur', N'23/AbR/2016', 20160423, N'2638.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'485667', N'bCp', N'0012-2449-88-0-1', N'Soles', 5, 3, 1, 1, 2, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (603, N'00007981', N'Cruz del Sur', N'29/FEb/2016', 20160229, N'3388.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'850627', N'bbVA', N'0012-2449-88-0-1', N'Soles', 5, 4, 2, 1, 1, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (604, N'00007198', N'Edelnor', N'17/MAR/2016', 20160317, N'3250.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'248624', N'bbVA', N'0011-8787-22-0-1', N'Soles', 6, 1, 2, 1, 7, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (605, N'00008993', N'Gloria', N'11/AbR/2016', 20160411, N'3298.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'353573', N'INTERbANK', N'0011-2071-28-0-1', N'Soles', 7, 3, 4, 1, 2, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (606, N'00008401', N'backus', N'12/FEb/2016', 20160212, N'609.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'442733', N'SCOTIA bANK', N'0010-2001-60-0-1', N'Soles', 8, 1, 3, 1, 7, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (607, N'00008694', N'Edelnor', N'17/ENE/2016', 20160117, N'3713.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'218625', N'SCOTIA bANK', N'0011-8787-22-0-1', N'Soles', 6, 4, 3, 1, 1, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (608, N'00007918', N'Gloria', N'14/AbR/2016', 20160414, N'415.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'879747', N'INTERbANK', N'0011-2071-28-0-1', N'Soles', 7, 2, 4, 1, 5, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (609, N'00008872', N'Edelnor', N'12/AbR/2016', 20160412, N'4061.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'209616', N'SCOTIA bANK', N'0011-8787-22-0-1', N'Soles', 6, 2, 3, 1, 5, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (610, N'00007086', N'Gloria', N'21/ENE/2016', 20160121, N'877.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'805609', N'bCp', N'0011-2071-28-0-1', N'Soles', 7, 1, 1, 1, 7, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (611, N'00008299', N'backus', N'27/FEb/2016', 20160227, N'137.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'874468', N'INTERbANK', N'0010-2001-60-0-1', N'Soles', 8, 4, 4, 1, 1, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (612, N'00008045', N'Gloria', N'23/AbR/2016', 20160423, N'1690.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'685428', N'SCOTIA bANK', N'0011-2071-28-0-1', N'Soles', 7, 4, 3, 1, 1, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (613, N'00007100', N'Gloria', N'15/FEb/2016', 20160215, N'1172.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'591746', N'SCOTIA bANK', N'0011-2071-28-0-1', N'Soles', 7, 1, 3, 1, 7, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (614, N'00008623', N'Gloria', N'16/ENE/2016', 20160116, N'1006.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'203737', N'bbVA', N'0011-2071-28-0-1', N'Soles', 7, 4, 2, 1, 1, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (615, N'00007886', N'Gloria', N'17/AbR/2016', 20160417, N'3024.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'358643', N'SCOTIA bANK', N'0011-2071-28-0-1', N'Soles', 7, 4, 3, 1, 1, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (616, N'00007913', N'backus', N'14/MAR/2016', 20160314, N'1719.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'516655', N'bbVA', N'0010-2001-60-0-1', N'Soles', 8, 1, 2, 1, 7, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (617, N'00008810', N'Gloria', N'27/ENE/2016', 20160127, N'1169.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'183619', N'SCOTIA bANK', N'0011-2071-28-0-1', N'Soles', 7, 1, 3, 1, 7, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (618, N'00008938', N'Cruz del Sur', N'12/MAR/2016', 20160312, N'3899.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'820629', N'SCOTIA bANK', N'0012-2449-88-0-1', N'Soles', 5, 1, 3, 1, 7, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (619, N'00008732', N'backus', N'21/FEb/2016', 20160221, N'1965.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'235428', N'bCp', N'0010-2001-60-0-1', N'Soles', 8, 2, 1, 1, 5, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (620, N'00008677', N'Gloria', N'15/ENE/2016', 20160115, N'1633.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'148417', N'bbVA', N'0011-2071-28-0-1', N'Soles', 7, 1, 2, 1, 7, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (621, N'00008354', N'Edelnor', N'22/MAR/2016', 20160322, N'2267.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'147521', N'bbVA', N'0011-8787-22-0-1', N'Soles', 6, 2, 2, 1, 5, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (622, N'00008858', N'Edelnor', N'13/FEb/2016', 20160213, N'2641.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'797481', N'bCp', N'0011-8787-22-0-1', N'Soles', 6, 3, 1, 1, 2, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (623, N'00007690', N'Edelnor', N'29/MAR/2016', 20160329, N'2292.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'463542', N'bbVA', N'0011-8787-22-0-1', N'Soles', 6, 2, 2, 1, 5, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (624, N'00008966', N'Gloria', N'22/ENE/2016', 20160122, N'3763.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'126706', N'INTERbANK', N'0011-2071-28-0-1', N'Soles', 7, 3, 4, 1, 2, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (625, N'00008610', N'Cruz del Sur', N'11/MAR/2016', 20160311, N'366.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'445670', N'bCp', N'0012-2449-88-0-1', N'Soles', 5, 3, 1, 1, 2, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (626, N'00007932', N'Gloria', N'12/AbR/2016', 20160412, N'1058.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'694556', N'SCOTIA bANK', N'0011-2071-28-0-1', N'Soles', 7, 1, 3, 1, 7, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (627, N'00007165', N'Edelnor', N'22/FEb/2016', 20160222, N'1660.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'351578', N'bCp', N'0011-8787-22-0-1', N'Soles', 6, 4, 1, 1, 1, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (628, N'00008112', N'backus', N'20/AbR/2016', 20160420, N'3776.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'262686', N'INTERbANK', N'0010-2001-60-0-1', N'Soles', 8, 1, 4, 1, 7, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (629, N'00008607', N'backus', N'13/AbR/2016', 20160413, N'3415.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'374576', N'bbVA', N'0010-2001-60-0-1', N'Soles', 8, 2, 2, 1, 5, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (630, N'00007590', N'backus', N'27/AbR/2016', 20160427, N'958.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'555504', N'INTERbANK', N'0010-2001-60-0-1', N'Soles', 8, 3, 4, 1, 2, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (631, N'00008457', N'backus', N'27/AbR/2016', 20160427, N'732.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'632572', N'bbVA', N'0010-2001-60-0-1', N'Soles', 8, 3, 2, 1, 2, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (632, N'00007357', N'Cruz del Sur', N'25/ENE/2016', 20160125, N'1379.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'161457', N'INTERbANK', N'0012-2449-88-0-
1', N'Soles', 5, 4, 4, 1, 1, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (633, N'00008519', N'Gloria', N'21/AbR/2016', 20160421, N'1952.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'238573', N'bbVA', N'0011-2071-28-0-1', N'Soles', 7, 3, 2, 1, 2, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (634, N'00007989', N'backus', N'13/MAR/2016', 20160313, N'3401.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'560472', N'INTERbANK', N'0010-2001-60-0-1', N'Soles', 8, 1, 4, 1, 7, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (635, N'00007267', N'backus', N'24/AbR/2016', 20160424, N'424.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'630455', N'INTERbANK', N'0010-2001-60-0-1', N'Soles', 8, 3, 4, 1, 2, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (636, N'00008585', N'backus', N'22/AbR/2016', 20160422, N'3717.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'432714', N'bCp', N'0010-2001-60-0-1', N'Soles', 8, 3, 1, 1, 2, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (637, N'00008235', N'Edelnor', N'28/FEb/2016', 20160228, N'1983.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'211613', N'INTERbANK', N'0011-8787-22-0-1', N'Soles', 6, 3, 4, 1, 2, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (638, N'00008474', N'Gloria', N'13/MAR/2016', 20160313, N'4006.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'428529', N'bCp', N'0011-2071-28-0-1', N'Soles', 7, 2, 1, 1, 5, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (639, N'00008415', N'backus', N'19/FEb/2016', 20160219, N'3170.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'224536', N'bCp', N'0010-2001-60-0-1', N'Soles', 8, 4, 1, 1, 1, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (640, N'00007848', N'backus', N'24/ENE/2016', 20160124, N'1114.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'802713', N'bCp', N'0010-2001-60-0-1', N'Soles', 8, 2, 1, 1, 5, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (641, N'00007515', N'backus', N'18/MAR/2016', 20160318, N'2856.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'788703', N'SCOTIA bANK', N'0010-2001-60-0-1', N'Soles', 8, 2, 3, 1, 5, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (642, N'00008360', N'Gloria', N'16/FEb/2016', 20160216, N'2949.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'829431', N'INTERbANK', N'0011-2071-28-0-1', N'Soles', 7, 2, 4, 1, 5, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (643, N'00007309', N'Gloria', N'24/FEb/2016', 20160224, N'3017.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'883596', N'SCOTIA bANK', N'0011-2071-28-0-1', N'Soles', 7, 4, 3, 1, 1, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (644, N'00008978', N'Gloria', N'20/FEb/2016', 20160220, N'2380.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'689629', N'INTERbANK', N'0011-2071-28-0-1', N'Soles', 7, 3, 4, 1, 2, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (645, N'00007473', N'Gloria', N'19/MAR/2016', 20160319, N'584.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'731587', N'SCOTIA bANK', N'0011-2071-28-0-1', N'Soles', 7, 2, 3, 1, 5, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (646, N'00008243', N'backus', N'22/AbR/2016', 20160422, N'1685.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'327533', N'bCp', N'0010-2001-60-0-1', N'Soles', 8, 4, 1, 1, 1, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (647, N'00008465', N'Cruz del Sur', N'25/AbR/2016', 20160425, N'2090.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'899727', N'SCOTIA bANK', N'0012-2449-88-0-1', N'Soles', 5, 1, 3, 1, 7, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (648, N'00008377', N'backus', N'29/MAR/2016', 20160329, N'549.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'682640', N'bbVA', N'0010-2001-60-0-1', N'Soles', 8, 4, 2, 1, 1, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (649, N'00008453', N'backus', N'12/FEb/2016', 20160212, N'4159.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'170448', N'SCOTIA bANK', N'0010-2001-60-0-1', N'Soles', 8, 3, 3, 1, 2, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (650, N'00007645', N'Gloria', N'12/MAR/2016', 20160312, N'1320.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'274557', N'INTERbANK', N'0011-2071-28-0-1', N'Soles', 7, 3, 4, 1, 2, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (651, N'00008976', N'Edelnor', N'21/AbR/2016', 20160421, N'3613.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'345444', N'bbVA', N'0011-8787-22-0-1', N'Soles', 6, 2, 2, 1, 5, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (652, N'00007087', N'Edelnor', N'16/MAR/2016', 20160316, N'2574.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'115605', N'bbVA', N'0011-8787-22-0-1', N'Soles', 6, 1, 2, 1, 7, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (653, N'00008004', N'Cruz del Sur', N'27/MAR/2016', 20160327, N'2182.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'886443', N'bbVA', N'0012-2449-88-0-1', N'Soles', 5, 2, 2, 1, 5, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (654, N'00007707', N'backus', N'14/AbR/2016', 20160414, N'3758.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'701552', N'SCOTIA bANK', N'0010-2001-60-0-1', N'Soles', 8, 4, 3, 1, 1, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (655, N'00008579', N'Edelnor', N'13/AbR/2016', 20160413, N'1961.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'565681', N'bCp', N'0011-8787-22-0-1', N'Soles', 6, 2, 1, 1, 5, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (656, N'00008935', N'backus', N'24/MAR/2016', 20160324, N'3291.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'682411', N'INTERbANK', N'0010-2001-60-0-1', N'Soles', 8, 3, 4, 1, 2, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (657, N'00007581', N'backus', N'25/MAR/2016', 20160325, N'3417.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'713493', N'SCOTIA bANK', N'0010-2001-60-0-1', N'Soles', 8, 1, 3, 1, 7, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (658, N'00008418', N'Gloria', N'22/AbR/2016', 20160422, N'109.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'586479', N'SCOTIA bANK', N'0011-2071-28-0-1', N'Soles', 7, 4, 3, 1, 1, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (659, N'00008558', N'Cruz del Sur', N'21/MAR/2016', 20160321, N'3359.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'342483', N'bCp', N'0012-2449-88-0-1', N'Soles', 5, 1, 1, 1, 7, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (660, N'00007193', N'Gloria', N'10/AbR/2016', 20160410, N'502.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'253452', N'SCOTIA bANK', N'0011-2071-28-0-1', N'Soles', 7, 1, 3, 1, 7, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (661, N'00008663', N'Cruz del Sur', N'19/FEb/2016', 20160219, N'959.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'773659', N'SCOTIA bANK', N'0012-2449-88-
0-1', N'Soles', 5, 3, 3, 1, 2, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (662, N'00008893', N'backus', N'22/FEb/2016', 20160222, N'2469.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'270547', N'INTERbANK', N'0010-2001-60-0-1', N'Soles', 8, 2, 4, 1, 5, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (663, N'00008813', N'backus', N'24/ENE/2016', 20160124, N'3560.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'738460', N'bCp', N'0010-2001-60-0-1', N'Soles', 8, 4, 1, 1, 1, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (664, N'00007797', N'backus', N'19/AbR/2016', 20160419, N'2403.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'292695', N'INTERbANK', N'0010-2001-60-0-1', N'Soles', 8, 3, 4, 1, 2, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (665, N'00008393', N'Gloria', N'27/MAR/2016', 20160327, N'543.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'815473', N'SCOTIA bANK', N'0011-2071-28-0-1', N'Soles', 7, 3, 3, 1, 2, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (666, N'00008519', N'Edelnor', N'13/AbR/2016', 20160413, N'3156.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'808456', N'bCp', N'0011-8787-22-0-1', N'Soles', 6, 3, 1, 1, 2, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (667, N'00008428', N'Edelnor', N'29/AbR/2016', 20160429, N'3904.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'587624', N'bbVA', N'0011-8787-22-0-1', N'Soles', 6, 3, 2, 1, 2, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (668, N'00008721', N'Edelnor', N'13/MAR/2016', 20160313, N'307.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'225549', N'bCp', N'0011-8787-22-0-1', N'Soles', 6, 4, 1, 1, 1, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (669, N'00008815', N'Gloria', N'24/MAR/2016', 20160324, N'3837.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'747659', N'INTERbANK', N'0011-2071-28-0-1', N'Soles', 7, 1, 4, 1, 7, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (670, N'00008153', N'Edelnor', N'16/MAR/2016', 20160316, N'2974.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'125701', N'SCOTIA bANK', N'0011-8787-22-0-1', N'Soles', 6, 3, 3, 1, 2, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (671, N'00007244', N'Gloria', N'18/FEb/2016', 20160218, N'3779.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'179513', N'SCOTIA bANK', N'0011-2071-28-0-1', N'Soles', 7, 1, 3, 1, 7, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (672, N'00008871', N'Cruz del Sur', N'11/ENE/2016', 20160111, N'3611.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'323586', N'SCOTIA bANK', N'0012-2449-88-0
-1', N'Soles', 5, 4, 3, 1, 1, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (673, N'00008877', N'Gloria', N'22/MAR/2016', 20160322, N'1582.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'102709', N'bCp', N'0011-2071-28-0-1', N'Soles', 7, 2, 1, 1, 5, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (674, N'00008150', N'Edelnor', N'10/FEb/2016', 20160210, N'4100.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'571708', N'bCp', N'0011-8787-22-0-1', N'Soles', 6, 4, 1, 1, 1, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (675, N'00008839', N'backus', N'21/ENE/2016', 20160121, N'1990.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'749490', N'SCOTIA bANK', N'0010-2001-60-0-1', N'Soles', 8, 4, 3, 1, 1, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (676, N'00008905', N'backus', N'25/AbR/2016', 20160425, N'1054.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'245738', N'SCOTIA bANK', N'0010-2001-60-0-1', N'Soles', 8, 1, 3, 1, 7, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (677, N'00008932', N'Edelnor', N'15/AbR/2016', 20160415, N'1939.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'546528', N'SCOTIA bANK', N'0011-8787-22-0-1', N'Soles', 6, 4, 3, 1, 1, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (678, N'00008458', N'Edelnor', N'15/FEb/2016', 20160215, N'3501.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'346603', N'INTERbANK', N'0011-8787-22-0-1', N'Soles', 6, 4, 4, 1, 1, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (679, N'00008769', N'Gloria', N'16/AbR/2016', 20160416, N'2365.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'194585', N'bbVA', N'0011-2071-28-0-1', N'Soles', 7, 2, 2, 1, 5, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (680, N'00008462', N'backus', N'20/FEb/2016', 20160220, N'3877.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'537741', N'SCOTIA bANK', N'0010-2001-60-0-1', N'Soles', 8, 3, 3, 1, 2, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (681, N'00008846', N'Edelnor', N'29/AbR/2016', 20160429, N'1147.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'302615', N'bCp', N'0011-8787-22-0-1', N'Soles', 6, 3, 1, 1, 2, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (682, N'00008885', N'Cruz del Sur', N'22/AbR/2016', 20160422, N'3245.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'735581', N'bCp', N'0012-2449-88-0-1', N'Soles', 5, 1, 1, 1, 7, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (683, N'00007647', N'backus', N'26/AbR/2016', 20160426, N'737.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'361720', N'SCOTIA bANK', N'0010-2001-60-0-1', N'Soles', 8, 3, 3, 1, 2, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (684, N'00008292', N'backus', N'22/AbR/2016', 20160422, N'3817.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'688679', N'bCp', N'0010-2001-60-0-1', N'Soles', 8, 1, 1, 1, 7, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (685, N'00008674', N'Cruz del Sur', N'17/ENE/2016', 20160117, N'1923.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'541493', N'SCOTIA bANK', N'0012-2449-88-0
-1', N'Soles', 5, 4, 3, 1, 1, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (686, N'00007177', N'Gloria', N'20/FEb/2016', 20160220, N'803.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'525432', N'bbVA', N'0011-2071-28-0-1', N'Soles', 7, 3, 2, 1, 2, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (687, N'00008808', N'Edelnor', N'21/FEb/2016', 20160221, N'4077.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'536704', N'INTERbANK', N'0011-8787-22-0-1', N'Soles', 6, 4, 4, 1, 1, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (688, N'00007808', N'Cruz del Sur', N'16/MAR/2016', 20160316, N'870.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'175689', N'bbVA', N'0012-2449-88-0-1', N'Soles', 5, 3, 2, 1, 2, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (689, N'00008292', N'Gloria', N'16/MAR/2016', 20160316, N'4131.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'851682', N'SCOTIA bANK', N'0011-2071-28-0-1', N'Soles', 7, 1, 3, 1, 7, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (690, N'00007402', N'Gloria', N'22/AbR/2016', 20160422, N'913.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'768567', N'SCOTIA bANK', N'0011-2071-28-0-1', N'Soles', 7, 2, 3, 1, 5, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (691, N'00008641', N'backus', N'20/ENE/2016', 20160120, N'1099.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'595582', N'bCp', N'0010-2001-60-0-1', N'Soles', 8, 2, 1, 1, 5, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (692, N'00008169', N'backus', N'26/ENE/2016', 20160126, N'1968.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'872485', N'SCOTIA bANK', N'0010-2001-60-0-1', N'Soles', 8, 1, 3, 1, 7, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (693, N'00008127', N'backus', N'16/ENE/2016', 20160116, N'1772.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'868497', N'SCOTIA bANK', N'0010-2001-60-0-1', N'Soles', 8, 4, 3, 1, 1, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (694, N'00008243', N'Gloria', N'17/MAR/2016', 20160317, N'237.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'146520', N'INTERbANK', N'0011-2071-28-0-1', N'Soles', 7, 2, 4, 1, 5, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (695, N'00008125', N'backus', N'24/AbR/2016', 20160424, N'1367.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'591717', N'INTERbANK', N'0010-2001-60-0-1', N'Soles', 8, 2, 4, 1, 5, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (696, N'00007535', N'backus', N'21/FEb/2016', 20160221, N'2608.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'179464', N'bCp', N'0010-2001-60-0-1', N'Soles', 8, 3, 1, 1, 2, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (697, N'00007885', N'backus', N'27/MAR/2016', 20160327, N'982.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'253713', N'bCp', N'0010-2001-60-0-1', N'Soles', 8, 3, 1, 1, 2, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (698, N'00007011', N'Gloria', N'20/FEb/2016', 20160220, N'2077.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'435670', N'INTERbANK', N'0011-2071-28-0-1', N'Soles', 7, 4, 4, 1, 1, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (699, N'00008196', N'backus', N'16/MAR/2016', 20160316, N'3110.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'612620', N'SCOTIA bANK', N'0010-2001-60-0-1', N'Soles', 8, 2, 3, 1, 5, 11)
GO
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (700, N'00008651', N'Gloria', N'16/FEb/2016', 20160216, N'2381.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'197489', N'bbVA', N'0011-2071-28-0-1', N'Soles', 7, 4, 2, 1, 1, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (701, N'00008912', N'Cruz del Sur', N'23/ENE/2016', 20160123, N'3658.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'772441', N'bCp', N'0012-2449-88-0-1', N'Soles', 5, 2, 1, 1, 5, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (702, N'00008349', N'Cruz del Sur', N'16/AbR/2016', 20160416, N'473.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'249457', N'bbVA', N'0012-2449-88-0-1', N'Soles', 5, 3, 2, 1, 2, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (703, N'00008521', N'Edelnor', N'10/ENE/2016', 20160110, N'4137.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'421638', N'bbVA', N'0011-8787-22-0-1', N'Soles', 6, 3, 2, 1, 2, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (704, N'00007885', N'Gloria', N'25/AbR/2016', 20160425, N'3405.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'840612', N'SCOTIA bANK', N'0011-2071-28-0-1', N'Soles', 7, 2, 3, 1, 5, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (705, N'00007200', N'backus', N'11/FEb/2016', 20160211, N'3446.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'293627', N'SCOTIA bANK', N'0010-2001-60-0-1', N'Soles', 8, 4, 3, 1, 1, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (706, N'00008375', N'backus', N'11/MAR/2016', 20160311, N'1887.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'210551', N'bbVA', N'0010-2001-60-0-1', N'Soles', 8, 2, 2, 1, 5, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (707, N'00008816', N'Edelnor', N'29/AbR/2016', 20160429, N'1517.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'452513', N'SCOTIA bANK', N'0011-8787-22-0-1', N'Soles', 6, 2, 3, 1, 5, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (708, N'00008455', N'backus', N'21/MAR/2016', 20160321, N'3532.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'367481', N'SCOTIA bANK', N'0010-2001-60-0-1', N'Soles', 8, 1, 3, 1, 7, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (709, N'00008551', N'Gloria', N'22/AbR/2016', 20160422, N'1289.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'203666', N'INTERbANK', N'0011-2071-28-0-1', N'Soles', 7, 3, 4, 1, 2, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (710, N'00007856', N'backus', N'22/FEb/2016', 20160222, N'2338.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'347744', N'bCp', N'0010-2001-60-0-1', N'Soles', 8, 3, 1, 1, 2, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (711, N'00008773', N'Cruz del Sur', N'21/ENE/2016', 20160121, N'3428.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'492664', N'bCp', N'0012-2449-88-0-1', N'Soles', 5, 2, 1, 1, 5, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (712, N'00007732', N'backus', N'12/ENE/2016', 20160112, N'3005.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'635395', N'bCp', N'0010-2001-60-0-1', N'Soles', 8, 4, 1, 1, 1, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (713, N'00008808', N'Gloria', N'19/AbR/2016', 20160419, N'2382.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'627632', N'bbVA', N'0011-2071-28-0-1', N'Soles', 7, 3, 2, 1, 2, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (714, N'00008947', N'Cruz del Sur', N'23/MAR/2016', 20160323, N'855.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'207500', N'INTERbANK', N'0012-2449-88-0-1', N'Soles', 5, 4, 4, 1, 1, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (715, N'00008549', N'Gloria', N'14/MAR/2016', 20160314, N'231.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'470422', N'INTERbANK', N'0011-2071-28-0-1', N'Soles', 7, 4, 4, 1, 1, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (716, N'00007172', N'Cruz del Sur', N'23/AbR/2016', 20160423, N'4178.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'474615', N'bbVA', N'0012-2449-88-0-1', N'Soles', 5, 2, 2, 1, 5, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (717, N'00007967', N'backus', N'26/FEb/2016', 20160226, N'1872.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'739589', N'bCp', N'0010-2001-60-0-1', N'Soles', 8, 1, 1, 1, 7, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (718, N'00007407', N'Edelnor', N'29/ENE/2016', 20160129, N'1912.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'443744', N'INTERbANK', N'0011-8787-22-0-1', N'Soles', 6, 2, 4, 1, 5, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (719, N'00008809', N'backus', N'20/FEb/2016', 20160220, N'2695.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'116462', N'bCp', N'0010-2001-60-0-1', N'Soles', 8, 3, 1, 1, 2, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (720, N'00008907', N'backus', N'12/FEb/2016', 20160212, N'2031.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'739444', N'bCp', N'0010-2001-60-0-1', N'Soles', 8, 3, 1, 1, 2, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (721, N'00008066', N'backus', N'15/AbR/2016', 20160415, N'1295.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'401622', N'bCp', N'0010-2001-60-0-1', N'Soles', 8, 1, 1, 1, 7, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (722, N'00008392', N'Cruz del Sur', N'17/AbR/2016', 20160417, N'1246.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'796477', N'SCOTIA bANK', N'0012-2449-88
-0-1', N'Soles', 5, 3, 3, 1, 2, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (723, N'00008133', N'Edelnor', N'23/MAR/2016', 20160323, N'3236.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'270686', N'bbVA', N'0011-8787-22-0-1', N'Soles', 6, 2, 2, 1, 5, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (724, N'00008433', N'backus', N'17/MAR/2016', 20160317, N'1838.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'799554', N'INTERbANK', N'0010-2001-60-0-1', N'Soles', 8, 2, 4, 1, 5, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (725, N'00008674', N'backus', N'23/FEb/2016', 20160223, N'2952.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'760686', N'INTERbANK', N'0010-2001-60-0-1', N'Soles', 8, 4, 4, 1, 1, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (726, N'00007480', N'backus', N'11/ENE/2016', 20160111, N'2049.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'276511', N'bbVA', N'0010-2001-60-0-1', N'Soles', 8, 3, 2, 1, 2, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (727, N'00008977', N'Cruz del Sur', N'19/AbR/2016', 20160419, N'2331.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'812685', N'bbVA', N'0012-2449-88-0-1', N'Soles', 5, 2, 2, 1, 5, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (728, N'00007162', N'Gloria', N'17/AbR/2016', 20160417, N'3342.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'546686', N'bbVA', N'0011-2071-28-0-1', N'Soles', 7, 2, 2, 1, 5, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (729, N'00008956', N'backus', N'19/ENE/2016', 20160119, N'1612.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'178548', N'bbVA', N'0010-2001-60-0-1', N'Soles', 8, 1, 2, 1, 7, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (730, N'00007206', N'Edelnor', N'11/FEb/2016', 20160211, N'3562.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'120652', N'INTERbANK', N'0011-8787-22-0-1', N'Soles', 6, 2, 4, 1, 5, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (731, N'00007475', N'Cruz del Sur', N'29/FEb/2016', 20160229, N'1745.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'534561', N'INTERbANK', N'0012-2449-88-0
-1', N'Soles', 5, 3, 4, 1, 2, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (732, N'00008676', N'backus', N'29/FEb/2016', 20160229, N'2019.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'105438', N'bbVA', N'0010-2001-60-0-1', N'Soles', 8, 2, 2, 1, 5, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (733, N'00007873', N'backus', N'13/FEb/2016', 20160213, N'649.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'853627', N'INTERbANK', N'0010-2001-60-0-1', N'Soles', 8, 4, 4, 1, 1, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (734, N'00007572', N'Edelnor', N'20/AbR/2016', 20160420, N'367.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'339633', N'bbVA', N'0011-8787-22-0-1', N'Soles', 6, 2, 2, 1, 5, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (735, N'00008120', N'backus', N'18/ENE/2016', 20160118, N'1671.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'423702', N'bbVA', N'0010-2001-60-0-1', N'Soles', 8, 1, 2, 1, 7, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (736, N'00008149', N'Cruz del Sur', N'20/AbR/2016', 20160420, N'2075.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'311430', N'INTERbANK', N'0012-2449-88-0-1', N'Soles', 5, 1, 4, 1, 7, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (737, N'00007789', N'Cruz del Sur', N'21/MAR/2016', 20160321, N'2173.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'365439', N'bbVA', N'0012-2449-88-0-1', N'Soles', 5, 3, 2, 1, 2, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (738, N'00008441', N'Cruz del Sur', N'28/AbR/2016', 20160428, N'3327.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'161552', N'INTERbANK', N'0012-2449-88-0-
1', N'Soles', 5, 4, 4, 1, 1, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (739, N'00008852', N'backus', N'14/ENE/2016', 20160114, N'3516.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'228452', N'bCp', N'0010-2001-60-0-1', N'Soles', 8, 2, 1, 1, 5, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (740, N'00007875', N'Gloria', N'26/ENE/2016', 20160126, N'1562.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'559665', N'bbVA', N'0011-2071-28-0-1', N'Soles', 7, 2, 2, 1, 5, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (741, N'00008710', N'backus', N'27/MAR/2016', 20160327, N'445.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'844690', N'INTERbANK', N'0010-2001-60-0-1', N'Soles', 8, 4, 4, 1, 1, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (742, N'00007148', N'Gloria', N'22/FEb/2016', 20160222, N'1146.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'125456', N'bbVA', N'0011-2071-28-0-1', N'Soles', 7, 2, 2, 1, 5, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (743, N'00008183', N'Cruz del Sur', N'25/MAR/2016', 20160325, N'1281.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'433524', N'bCp', N'0012-2449-88-0-1', N'Soles', 5, 3, 1, 1, 2, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (744, N'00008075', N'Edelnor', N'15/AbR/2016', 20160415, N'3892.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'683583', N'SCOTIA bANK', N'0011-8787-22-0-1', N'Soles', 6, 2, 3, 1, 5, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (745, N'00008115', N'backus', N'20/FEb/2016', 20160220, N'727.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'193489', N'INTERbANK', N'0010-2001-60-0-1', N'Soles', 8, 1, 4, 1, 7, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (746, N'00007577', N'backus', N'12/AbR/2016', 20160412, N'3240.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'641524', N'INTERbANK', N'0010-2001-60-0-1', N'Soles', 8, 2, 4, 1, 5, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (747, N'00008492', N'Edelnor', N'27/AbR/2016', 20160427, N'3683.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'398703', N'INTERbANK', N'0011-8787-22-0-1', N'Soles', 6, 1, 4, 1, 7, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (748, N'00008007', N'Edelnor', N'21/FEb/2016', 20160221, N'2480.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'497637', N'bbVA', N'0011-8787-22-0-1', N'Soles', 6, 3, 2, 1, 2, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (749, N'00007720', N'Edelnor', N'14/AbR/2016', 20160414, N'1077.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'799580', N'bbVA', N'0011-8787-22-0-1', N'Soles', 6, 2, 2, 1, 5, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (750, N'00008640', N'backus', N'22/FEb/2016', 20160222, N'446.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'166585', N'bCp', N'0010-2001-60-0-1', N'Soles', 8, 1, 1, 1, 7, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (751, N'00007752', N'backus', N'21/MAR/2016', 20160321, N'797.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'304585', N'bCp', N'0010-2001-60-0-1', N'Soles', 8, 1, 1, 1, 7, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (752, N'00007533', N'Edelnor', N'18/MAR/2016', 20160318, N'3653.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'675663', N'bbVA', N'0011-8787-22-0-1', N'Soles', 6, 2, 2, 1, 5, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (753, N'00008045', N'Edelnor', N'14/FEb/2016', 20160214, N'1374.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'774467', N'INTERbANK', N'0011-8787-22-0-1', N'Soles', 6, 1, 4, 1, 7, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (754, N'00007391', N'backus', N'26/FEb/2016', 20160226, N'2898.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'732725', N'bCp', N'0010-2001-60-0-1', N'Soles', 8, 4, 1, 1, 1, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (755, N'00007461', N'Edelnor', N'23/ENE/2016', 20160123, N'132.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'137574', N'SCOTIA bANK', N'0011-8787-22-0-1', N'Soles', 6, 1, 3, 1, 7, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (756, N'00008570', N'Gloria', N'19/MAR/2016', 20160319, N'3688.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'738521', N'INTERbANK', N'0011-2071-28-0-1', N'Soles', 7, 2, 4, 1, 5, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (757, N'00008664', N'backus', N'26/MAR/2016', 20160326, N'759.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'401445', N'bbVA', N'0010-2001-60-0-1', N'Soles', 8, 1, 2, 1, 7, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (758, N'00007386', N'Edelnor', N'13/AbR/2016', 20160413, N'1415.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'860574', N'SCOTIA bANK', N'0011-8787-22-0-1', N'Soles', 6, 2, 3, 1, 5, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (759, N'00008181', N'Gloria', N'16/AbR/2016', 20160416, N'1054.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'542668', N'INTERbANK', N'0011-2071-28-0-1', N'Soles', 7, 4, 4, 1, 1, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (760, N'00007840', N'Cruz del Sur', N'12/AbR/2016', 20160412, N'2656.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'177537', N'INTERbANK', N'0012-2449-88-0-1', N'Soles', 5, 2, 4, 1, 5, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (761, N'00007973', N'backus', N'17/AbR/2016', 20160417, N'343.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'355493', N'INTERbANK', N'0010-2001-60-0-1', N'Soles', 8, 2, 4, 1, 5, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (762, N'00007915', N'Cruz del Sur', N'19/ENE/2016', 20160119, N'3459.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'247628', N'bCp', N'0012-2449-88-0-1', N'Soles', 5, 3, 1, 1, 2, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (763, N'00007455', N'Gloria', N'27/FEb/2016', 20160227, N'885.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'460534', N'bCp', N'0011-2071-28-0-1', N'Soles', 7, 4, 1, 1, 1, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (764, N'00007701', N'Gloria', N'24/MAR/2016', 20160324, N'2717.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'151407', N'bbVA', N'0011-2071-28-0-1', N'Soles', 7, 2, 2, 1, 5, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (765, N'00007442', N'backus', N'14/ENE/2016', 20160114, N'1923.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'650438', N'INTERbANK', N'0010-2001-60-0-1', N'Soles', 8, 1, 4, 1, 7, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (766, N'00008135', N'Cruz del Sur', N'17/MAR/2016', 20160317, N'2044.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'563518', N'bCp', N'0012-2449-88-0-1', N'Soles', 5, 1, 1, 1, 7, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (767, N'00008380', N'Gloria', N'19/MAR/2016', 20160319, N'971.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'364459', N'bCp', N'0011-2071-28-0-1', N'Soles', 7, 1, 1, 1, 7, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (768, N'00007288', N'Gloria', N'19/ENE/2016', 20160119, N'3001.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'397588', N'bCp', N'0011-2071-28-0-1', N'Soles', 7, 2, 1, 1, 5, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (769, N'00007149', N'Edelnor', N'28/FEb/2016', 20160228, N'1008.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'290518', N'SCOTIA bANK', N'0011-8787-22-0-1', N'Soles', 6, 3, 3, 1, 2, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (770, N'00007392', N'Cruz del Sur', N'28/MAR/2016', 20160328, N'502.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'680621', N'bCp', N'0012-2449-88-0-1', N'Soles', 5, 1, 1, 1, 7, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (771, N'00008133', N'Cruz del Sur', N'10/MAR/2016', 20160310, N'1816.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'869537', N'SCOTIA bANK', N'0012-2449-88-0
-1', N'Soles', 5, 4, 3, 1, 1, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (772, N'00007679', N'backus', N'23/AbR/2016', 20160423, N'1945.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'869732', N'INTERbANK', N'0010-2001-60-0-1', N'Soles', 8, 4, 4, 1, 1, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (773, N'00007380', N'Edelnor', N'17/MAR/2016', 20160317, N'1072.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'499709', N'SCOTIA bANK', N'0011-8787-22-0-1', N'Soles', 6, 3, 3, 1, 2, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (774, N'00007097', N'Cruz del Sur', N'19/MAR/2016', 20160319, N'276.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'689398', N'SCOTIA bANK', N'0012-2449-88-0-
1', N'Soles', 5, 4, 3, 1, 1, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (775, N'00008119', N'Edelnor', N'27/MAR/2016', 20160327, N'2534.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'604571', N'bCp', N'0011-8787-22-0-1', N'Soles', 6, 4, 1, 1, 1, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (776, N'00008450', N'Cruz del Sur', N'15/FEb/2016', 20160215, N'2056.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'665580', N'bCp', N'0012-2449-88-0-1', N'Soles', 5, 2, 1, 1, 5, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (777, N'00007416', N'Edelnor', N'13/AbR/2016', 20160413, N'2653.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'822404', N'bbVA', N'0011-8787-22-0-1', N'Soles', 6, 1, 2, 1, 7, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (778, N'00007240', N'Cruz del Sur', N'25/ENE/2016', 20160125, N'2030.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'204398', N'SCOTIA bANK', N'0012-2449-88
-0-1', N'Soles', 5, 3, 3, 1, 2, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (779, N'00008593', N'backus', N'24/ENE/2016', 20160124, N'1907.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'397452', N'INTERbANK', N'0010-2001-60-0-1', N'Soles', 8, 3, 4, 1, 2, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (780, N'00007424', N'backus', N'28/ENE/2016', 20160128, N'3958.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'589527', N'INTERbANK', N'0010-2001-60-0-1', N'Soles', 8, 2, 4, 1, 5, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (781, N'00007523', N'Gloria', N'19/AbR/2016', 20160419, N'799.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'779701', N'SCOTIA bANK', N'0011-2071-28-0-1', N'Soles', 7, 4, 3, 1, 1, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (782, N'00007585', N'Gloria', N'25/AbR/2016', 20160425, N'986.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'643674', N'bbVA', N'0011-2071-28-0-1', N'Soles', 7, 1, 2, 1, 7, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (783, N'00008031', N'Edelnor', N'25/MAR/2016', 20160325, N'3869.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'595497', N'bCp', N'0011-8787-22-0-1', N'Soles', 6, 2, 1, 1, 5, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (784, N'00008829', N'Gloria', N'26/MAR/2016', 20160326, N'3460.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'586723', N'bbVA', N'0011-2071-28-0-1', N'Soles', 7, 3, 2, 1, 2, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (785, N'00008096', N'Edelnor', N'20/AbR/2016', 20160420, N'423.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'132477', N'SCOTIA bANK', N'0011-8787-22-0-1', N'Soles', 6, 1, 3, 1, 7, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (786, N'00007880', N'Cruz del Sur', N'27/MAR/2016', 20160327, N'3680.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'532445', N'INTERbANK', N'0012-2449-88-0-1', N'Soles', 5, 1, 4, 1, 7, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (787, N'00007537', N'Edelnor', N'25/MAR/2016', 20160325, N'412.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'797655', N'bbVA', N'0011-8787-22-0-1', N'Soles', 6, 3, 2, 1, 2, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (788, N'00008646', N'backus', N'29/AbR/2016', 20160429, N'3015.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'270454', N'SCOTIA bANK', N'0010-2001-60-0-1', N'Soles', 8, 2, 3, 1, 5, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (789, N'00008087', N'Edelnor', N'15/FEb/2016', 20160215, N'1210.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'414514', N'INTERbANK', N'0011-8787-22-0-1', N'Soles', 6, 3, 4, 1, 2, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (790, N'00008318', N'backus', N'23/MAR/2016', 20160323, N'2492.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'646647', N'bCp', N'0010-2001-60-0-1', N'Soles', 8, 2, 1, 1, 5, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (791, N'00008931', N'backus', N'10/MAR/2016', 20160310, N'2592.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'119627', N'INTERbANK', N'0010-2001-60-0-1', N'Soles', 8, 2, 4, 1, 5, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (792, N'00007340', N'backus', N'17/FEb/2016', 20160217, N'2329.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'542446', N'SCOTIA bANK', N'0010-2001-60-0-1', N'Soles', 8, 3, 3, 1, 2, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (793, N'00007010', N'backus', N'19/ENE/2016', 20160119, N'1648.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'716648', N'INTERbANK', N'0010-2001-60-0-1', N'Soles', 8, 4, 4, 1, 1, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (794, N'00007621', N'Cruz del Sur', N'19/ENE/2016', 20160119, N'1449.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'313450', N'bbVA', N'0012-2449-88-0-1', N'Soles', 5, 1, 2, 1, 7, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (795, N'00007742', N'backus', N'26/FEb/2016', 20160226, N'2299.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'563524', N'INTERbANK', N'0010-2001-60-0-1', N'Soles', 8, 2, 4, 1, 5, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (796, N'00007313', N'Edelnor', N'27/MAR/2016', 20160327, N'476.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'371601', N'bCp', N'0011-8787-22-0-1', N'Soles', 6, 1, 1, 1, 7, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (797, N'00007457', N'Cruz del Sur', N'16/ENE/2016', 20160116, N'4056.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'453586', N'bCp', N'0012-2449-88-0-1', N'Soles', 5, 2, 1, 1, 5, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (798, N'00008806', N'Cruz del Sur', N'16/MAR/2016', 20160316, N'1696.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'445591', N'bCp', N'0012-2449-88-0-1', N'Soles', 5, 3, 1, 1, 2, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (799, N'00007877', N'backus', N'19/ENE/2016', 20160119, N'1127.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'416567', N'INTERbANK', N'0010-2001-60-0-1', N'Soles', 8, 1, 4, 1, 7, 11)
GO
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (800, N'00007511', N'Edelnor', N'29/ENE/2016', 20160129, N'4194.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'557401', N'bbVA', N'0011-8787-22-0-1', N'Soles', 6, 1, 2, 1, 7, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (801, N'00007357', N'Cruz del Sur', N'16/ENE/2016', 20160116, N'4163.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'688639', N'SCOTIA bANK', N'0012-2449-88-0-1', N'Soles', 5, 2, 3, 1, 5, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (802, N'00008829', N'Gloria', N'24/MAR/2016', 20160324, N'1872.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'835507', N'INTERbANK', N'0011-2071-28-0-1', N'Soles', 7, 2, 4, 1, 5, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (803, N'00007152', N'backus', N'25/MAR/2016', 20160325, N'392.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'263539', N'INTERbANK', N'0010-2001-60-0-1', N'Soles', 8, 2, 4, 1, 5, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (804, N'00007415', N'Cruz del Sur', N'19/FEb/2016', 20160219, N'3543.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'833562', N'INTERbANK', N'0012-2449-88-0-1', N'Soles', 5, 2, 4, 1, 5, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (805, N'00008924', N'Cruz del Sur', N'18/FEb/2016', 20160218, N'4135.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'501747', N'bCp', N'0012-2449-88-0-1', N'Soles', 5, 4, 1, 1, 1, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (806, N'00008669', N'Edelnor', N'24/FEb/2016', 20160224, N'1893.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'698461', N'SCOTIA bANK', N'0011-8787-22-0-1', N'Soles', 6, 4, 3, 1, 1, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (807, N'00008672', N'Edelnor', N'20/AbR/2016', 20160420, N'3336.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'365397', N'SCOTIA bANK', N'0011-8787-22-0-1', N'Soles', 6, 4, 3, 1, 1, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (808, N'00008280', N'Cruz del Sur', N'15/FEb/2016', 20160215, N'884.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'780640', N'SCOTIA bANK', N'0012-2449-88-0-1', N'Soles', 5, 1, 3, 1, 7, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (809, N'00008693', N'Cruz del Sur', N'18/AbR/2016', 20160418, N'4135.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'121719', N'bCp', N'0012-2449-88-0-1', N'Soles', 5, 1, 1, 1, 7, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (810, N'00008943', N'Gloria', N'12/MAR/2016', 20160312, N'1959.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'412561', N'bbVA', N'0011-2071-28-0-1', N'Soles', 7, 4, 2, 1, 1, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (811, N'00007928', N'Gloria', N'18/FEb/2016', 20160218, N'3753.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'760728', N'bbVA', N'0011-2071-28-0-1', N'Soles', 7, 1, 2, 1, 7, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (812, N'00008749', N'Gloria', N'11/MAR/2016', 20160311, N'3128.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'107588', N'INTERbANK', N'0011-2071-28-0-1', N'Soles', 7, 1, 4, 1, 7, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (813, N'00008694', N'Gloria', N'23/MAR/2016', 20160323, N'2621.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'351483', N'SCOTIA bANK', N'0011-2071-28-0-1', N'Soles', 7, 3, 3, 1, 2, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (814, N'00008357', N'Cruz del Sur', N'19/ENE/2016', 20160119, N'1311.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'824677', N'SCOTIA bANK', N'0012-2449-88-0
-1', N'Soles', 5, 4, 3, 1, 1, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (815, N'00008666', N'Cruz del Sur', N'16/AbR/2016', 20160416, N'626.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'650552', N'SCOTIA bANK', N'0012-2449-88-0-1', N'Soles', 5, 2, 3, 1, 5, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (816, N'00007026', N'Gloria', N'20/MAR/2016', 20160320, N'2345.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'614483', N'bbVA', N'0011-2071-28-0-1', N'Soles', 7, 3, 2, 1, 2, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (817, N'00007567', N'Gloria', N'11/FEb/2016', 20160211, N'4067.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'225743', N'INTERbANK', N'0011-2071-28-0-1', N'Soles', 7, 2, 4, 1, 5, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (818, N'00008588', N'Edelnor', N'12/FEb/2016', 20160212, N'1678.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'743485', N'bCp', N'0011-8787-22-0-1', N'Soles', 6, 2, 1, 1, 5, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (819, N'00007953', N'Edelnor', N'27/ENE/2016', 20160127, N'2580.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'103637', N'INTERbANK', N'0011-8787-22-0-1', N'Soles', 6, 1, 4, 1, 7, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (820, N'00008685', N'backus', N'25/ENE/2016', 20160125, N'2179.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'526605', N'INTERbANK', N'0010-2001-60-0-1', N'Soles', 8, 4, 4, 1, 1, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (821, N'00007077', N'backus', N'16/MAR/2016', 20160316, N'1207.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'757637', N'bCp', N'0010-2001-60-0-1', N'Soles', 8, 4, 1, 1, 1, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (822, N'00008881', N'Cruz del Sur', N'20/ENE/2016', 20160120, N'280.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'173470', N'INTERbANK', N'0012-2449-88-0-1', N'Soles', 5, 1, 4, 1, 7, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (823, N'00008410', N'Gloria', N'12/ENE/2016', 20160112, N'2786.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'661556', N'bbVA', N'0011-2071-28-0-1', N'Soles', 7, 4, 2, 1, 1, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (824, N'00007711', N'Gloria', N'25/ENE/2016', 20160125, N'143.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'655414', N'bbVA', N'0011-2071-28-0-1', N'Soles', 7, 2, 2, 1, 5, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (825, N'00007746', N'Edelnor', N'11/ENE/2016', 20160111, N'3000.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'678677', N'SCOTIA bANK', N'0011-8787-22-0-1', N'Soles', 6, 2, 3, 1, 5, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (826, N'00007490', N'Cruz del Sur', N'22/MAR/2016', 20160322, N'1408.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'565445', N'bbVA', N'0012-2449-88-0-1', N'Soles', 5, 4, 2, 1, 1, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (827, N'00008590', N'Edelnor', N'20/AbR/2016', 20160420, N'2600.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'369558', N'bbVA', N'0011-8787-22-0-1', N'Soles', 6, 2, 2, 1, 5, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (828, N'00007038', N'Edelnor', N'25/FEb/2016', 20160225, N'374.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'163635', N'SCOTIA bANK', N'0011-8787-22-0-1', N'Soles', 6, 2, 3, 1, 5, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (829, N'00008666', N'Gloria', N'11/FEb/2016', 20160211, N'816.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'358610', N'bCp', N'0011-2071-28-0-1', N'Soles', 7, 4, 1, 1, 1, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (830, N'00008000', N'Cruz del Sur', N'20/FEb/2016', 20160220, N'3393.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'238523', N'bbVA', N'0012-2449-88-0-1', N'Soles', 5, 4, 2, 1, 1, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (831, N'00008812', N'backus', N'20/ENE/2016', 20160120, N'1185.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'340721', N'INTERbANK', N'0010-2001-60-0-1', N'Soles', 8, 1, 4, 1, 7, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (832, N'00007820', N'Gloria', N'15/FEb/2016', 20160215, N'2376.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'697634', N'bbVA', N'0011-2071-28-0-1', N'Soles', 7, 2, 2, 1, 5, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (833, N'00007489', N'Edelnor', N'19/FEb/2016', 20160219, N'3420.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'657715', N'bCp', N'0011-8787-22-0-1', N'Soles', 6, 3, 1, 1, 2, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (834, N'00007236', N'Cruz del Sur', N'27/MAR/2016', 20160327, N'3726.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'621488', N'bbVA', N'0012-2449-88-0-1', N'Soles', 5, 1, 2, 1, 7, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (835, N'00008403', N'backus', N'25/MAR/2016', 20160325, N'3467.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'863415', N'bCp', N'0010-2001-60-0-1', N'Soles', 8, 2, 1, 1, 5, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (836, N'00008414', N'backus', N'12/MAR/2016', 20160312, N'3586.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'668556', N'SCOTIA bANK', N'0010-2001-60-0-1', N'Soles', 8, 1, 3, 1, 7, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (837, N'00007294', N'Edelnor', N'11/ENE/2016', 20160111, N'3927.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'436472', N'INTERbANK', N'0011-8787-22-0-1', N'Soles', 6, 1, 4, 1, 7, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (838, N'00007016', N'backus', N'29/FEb/2016', 20160229, N'2160.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'455566', N'bCp', N'0010-2001-60-0-1', N'Soles', 8, 3, 1, 1, 2, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (839, N'00007134', N'Cruz del Sur', N'27/ENE/2016', 20160127, N'3789.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'431650', N'SCOTIA bANK', N'0012-2449-88-0
-1', N'Soles', 5, 4, 3, 1, 1, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (840, N'00007083', N'backus', N'15/ENE/2016', 20160115, N'3014.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'739505', N'INTERbANK', N'0010-2001-60-0-1', N'Soles', 8, 1, 4, 1, 7, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (841, N'00008053', N'backus', N'11/FEb/2016', 20160211, N'2421.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'800410', N'INTERbANK', N'0010-2001-60-0-1', N'Soles', 8, 1, 4, 1, 7, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (842, N'00008473', N'Gloria', N'10/ENE/2016', 20160110, N'883.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'339485', N'bbVA', N'0011-2071-28-0-1', N'Soles', 7, 2, 2, 1, 5, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (843, N'00008384', N'Cruz del Sur', N'11/AbR/2016', 20160411, N'1466.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'459546', N'bbVA', N'0012-2449-88-0-1', N'Soles', 5, 2, 2, 1, 5, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (844, N'00007281', N'Cruz del Sur', N'12/MAR/2016', 20160312, N'3366.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'181737', N'bbVA', N'0012-2449-88-0-1', N'Soles', 5, 1, 2, 1, 7, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (845, N'00007174', N'backus', N'26/AbR/2016', 20160426, N'3444.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'474673', N'bbVA', N'0010-2001-60-0-1', N'Soles', 8, 1, 2, 1, 7, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (846, N'00007351', N'backus', N'28/MAR/2016', 20160328, N'864.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'450716', N'SCOTIA bANK', N'0010-2001-60-0-1', N'Soles', 8, 4, 3, 1, 1, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (847, N'00007693', N'Gloria', N'11/ENE/2016', 20160111, N'2647.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'573697', N'INTERbANK', N'0011-2071-28-0-1', N'Soles', 7, 3, 4, 1, 2, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (848, N'00007736', N'backus', N'25/FEb/2016', 20160225, N'814.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'544612', N'bCp', N'0010-2001-60-0-1', N'Soles', 8, 2, 1, 1, 5, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (849, N'00007550', N'backus', N'21/ENE/2016', 20160121, N'1771.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'229605', N'bCp', N'0010-2001-60-0-1', N'Soles', 8, 3, 1, 1, 2, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (850, N'00008775', N'backus', N'27/FEb/2016', 20160227, N'2728.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'134743', N'bCp', N'0010-2001-60-0-1', N'Soles', 8, 3, 1, 1, 2, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (851, N'00008852', N'Cruz del Sur', N'19/ENE/2016', 20160119, N'252.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'460675', N'bCp', N'0012-2449-88-0-1', N'Soles', 5, 3, 1, 1, 2, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (852, N'00008681', N'backus', N'13/ENE/2016', 20160113, N'2836.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'366537', N'INTERbANK', N'0010-2001-60-0-1', N'Soles', 8, 2, 4, 1, 5, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (853, N'00007327', N'Cruz del Sur', N'19/AbR/2016', 20160419, N'2880.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'582500', N'bCp', N'0012-2449-88-0-1', N'Soles', 5, 3, 1, 1, 2, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (854, N'00008422', N'Gloria', N'19/ENE/2016', 20160119, N'3754.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'638484', N'SCOTIA bANK', N'0011-2071-28-0-1', N'Soles', 7, 4, 3, 1, 1, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (855, N'00007575', N'backus', N'28/MAR/2016', 20160328, N'4185.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'149717', N'bbVA', N'0010-2001-60-0-1', N'Soles', 8, 4, 2, 1, 1, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (856, N'00007125', N'Edelnor', N'12/AbR/2016', 20160412, N'3692.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'504461', N'INTERbANK', N'0011-8787-22-0-1', N'Soles', 6, 1, 4, 1, 7, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (857, N'00008651', N'Gloria', N'27/ENE/2016', 20160127, N'2779.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'896573', N'INTERbANK', N'0011-2071-28-0-1', N'Soles', 7, 4, 4, 1, 1, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (858, N'00008556', N'Edelnor', N'22/MAR/2016', 20160322, N'2283.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'481706', N'bCp', N'0011-8787-22-0-1', N'Soles', 6, 2, 1, 1, 5, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (859, N'00008338', N'Gloria', N'10/ENE/2016', 20160110, N'869.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'559478', N'bbVA', N'0011-2071-28-0-1', N'Soles', 7, 3, 2, 1, 2, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (860, N'00008879', N'backus', N'17/FEb/2016', 20160217, N'3805.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'840498', N'bbVA', N'0010-2001-60-0-1', N'Soles', 8, 3, 2, 1, 2, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (861, N'00008999', N'Gloria', N'25/MAR/2016', 20160325, N'4029.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'338434', N'SCOTIA bANK', N'0011-2071-28-0-1', N'Soles', 7, 2, 3, 1, 5, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (862, N'00008784', N'Gloria', N'14/AbR/2016', 20160414, N'562.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'328748', N'bbVA', N'0011-2071-28-0-1', N'Soles', 7, 3, 2, 1, 2, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (863, N'00008722', N'backus', N'18/MAR/2016', 20160318, N'3363.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'135479', N'bCp', N'0010-2001-60-0-1', N'Soles', 8, 3, 1, 1, 2, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (864, N'00007659', N'backus', N'26/AbR/2016', 20160426, N'2967.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'264643', N'bCp', N'0010-2001-60-0-1', N'Soles', 8, 2, 1, 1, 5, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (865, N'00008251', N'Cruz del Sur', N'28/MAR/2016', 20160328, N'3723.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'570733', N'INTERbANK', N'0012-2449-88-0-1', N'Soles', 5, 2, 4, 1, 5, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (866, N'00008644', N'backus', N'19/FEb/2016', 20160219, N'1890.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'495407', N'SCOTIA bANK', N'0010-2001-60-0-1', N'Soles', 8, 1, 3, 1, 7, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (867, N'00008682', N'Edelnor', N'22/AbR/2016', 20160422, N'595.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'414407', N'INTERbANK', N'0011-8787-22-0-1', N'Soles', 6, 3, 4, 1, 2, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (868, N'00007941', N'Edelnor', N'22/MAR/2016', 20160322, N'3053.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'826694', N'bCp', N'0011-8787-22-0-1', N'Soles', 6, 1, 1, 1, 7, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (869, N'00007923', N'Gloria', N'25/AbR/2016', 20160425, N'4009.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'372405', N'bbVA', N'0011-2071-28-0-1', N'Soles', 7, 1, 2, 1, 7, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (870, N'00007207', N'Edelnor', N'15/FEb/2016', 20160215, N'3641.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'809530', N'bCp', N'0011-8787-22-0-1', N'Soles', 6, 2, 1, 1, 5, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (871, N'00007303', N'backus', N'15/MAR/2016', 20160315, N'2582.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'613643', N'INTERbANK', N'0010-2001-60-0-1', N'Soles', 8, 1, 4, 1, 7, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (872, N'00007470', N'Cruz del Sur', N'26/ENE/2016', 20160126, N'2698.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'421624', N'bbVA', N'0012-2449-88-0-1', N'Soles', 5, 2, 2, 1, 5, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (873, N'00007798', N'Edelnor', N'27/AbR/2016', 20160427, N'282.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'366734', N'bCp', N'0011-8787-22-0-1', N'Soles', 6, 2, 1, 1, 5, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (874, N'00008790', N'Cruz del Sur', N'19/ENE/2016', 20160119, N'318.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'752452', N'bCp', N'0012-2449-88-0-1', N'Soles', 5, 1, 1, 1, 7, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (875, N'00007958', N'backus', N'25/AbR/2016', 20160425, N'3229.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'418611', N'INTERbANK', N'0010-2001-60-0-1', N'Soles', 8, 4, 4, 1, 1, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (876, N'00007092', N'backus', N'14/FEb/2016', 20160214, N'3829.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'391710', N'bbVA', N'0010-2001-60-0-1', N'Soles', 8, 2, 2, 1, 5, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (877, N'00008362', N'backus', N'12/ENE/2016', 20160112, N'2294.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'414727', N'bbVA', N'0010-2001-60-0-1', N'Soles', 8, 1, 2, 1, 7, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (878, N'00007882', N'backus', N'14/MAR/2016', 20160314, N'2585.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'491544', N'SCOTIA bANK', N'0010-2001-60-0-1', N'Soles', 8, 3, 3, 1, 2, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (879, N'00007607', N'backus', N'17/AbR/2016', 20160417, N'1229.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'547551', N'SCOTIA bANK', N'0010-2001-60-0-1', N'Soles', 8, 2, 3, 1, 5, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (880, N'00007545', N'Edelnor', N'10/ENE/2016', 20160110, N'737.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'230748', N'bCp', N'0011-8787-22-0-1', N'Soles', 6, 2, 1, 1, 5, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (881, N'00007756', N'backus', N'18/AbR/2016', 20160418, N'110.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'104710', N'INTERbANK', N'0010-2001-60-0-1', N'Soles', 8, 1, 4, 1, 7, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (882, N'00008111', N'Gloria', N'12/AbR/2016', 20160412, N'2061.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'518555', N'INTERbANK', N'0011-2071-28-0-1', N'Soles', 7, 1, 4, 1, 7, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (883, N'00007542', N'Cruz del Sur', N'17/ENE/2016', 20160117, N'566.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'732699', N'INTERbANK', N'0012-2449-88-0-
1', N'Soles', 5, 3, 4, 1, 2, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (884, N'00007980', N'Gloria', N'18/ENE/2016', 20160118, N'218.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'843412', N'bCp', N'0011-2071-28-0-1', N'Soles', 7, 1, 1, 1, 7, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (885, N'00008091', N'Cruz del Sur', N'15/MAR/2016', 20160315, N'2717.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'596722', N'bbVA', N'0012-2449-88-0-1', N'Soles', 5, 3, 2, 1, 2, 16)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (886, N'00008090', N'Edelnor', N'14/MAR/2016', 20160314, N'520.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'189696', N'SCOTIA bANK', N'0011-8787-22-0-1', N'Soles', 6, 2, 3, 1, 5, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (887, N'00007106', N'backus', N'17/ENE/2016', 20160117, N'2182.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'576664', N'SCOTIA bANK', N'0010-2001-60-0-1', N'Soles', 8, 1, 3, 1, 7, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (888, N'00008301', N'Edelnor', N'24/MAR/2016', 20160324, N'3073.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'235704', N'INTERbANK', N'0011-8787-22-0-1', N'Soles', 6, 2, 4, 1, 5, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (889, N'00008733', N'Edelnor', N'28/FEb/2016', 20160228, N'1195.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'438667', N'bbVA', N'0011-8787-22-0-1', N'Soles', 6, 4, 2, 1, 1, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (890, N'00008623', N'Gloria', N'24/ENE/2016', 20160124, N'1602.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'713645', N'bCp', N'0011-2071-28-0-1', N'Soles', 7, 2, 1, 1, 5, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (891, N'00007131', N'Gloria', N'17/MAR/2016', 20160317, N'2854.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'362529', N'bbVA', N'0011-2071-28-0-1', N'Soles', 7, 3, 2, 1, 2, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (892, N'00008082', N'backus', N'27/MAR/2016', 20160327, N'1981.00', N'SCOTIA bANK', N'0011-1127-73-0-1', N'Soles', N'450688', N'bCp', N'0010-2001-60-0-1', N'Soles', 8, 3, 1, 1, 2, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (893, N'00007365', N'Gloria', N'22/MAR/2016', 20160322, N'300.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'762715', N'bCp', N'0011-2071-28-0-1', N'Soles', 7, 1, 1, 1, 7, 15)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (894, N'00007683', N'backus', N'27/AbR/2016', 20160427, N'3855.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'846524', N'bbVA', N'0010-2001-60-0-1', N'Soles', 8, 1, 2, 1, 7, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (895, N'00008226', N'Edelnor', N'18/MAR/2016', 20160318, N'2971.00', N'INTERbANK', N'0010-3063-54-0-1', N'Soles', N'705560', N'bbVA', N'0011-8787-22-0-1', N'Soles', 6, 4, 2, 1, 1, 14)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (896, N'00007052', N'backus', N'21/AbR/2016', 20160421, N'2500.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'481402', N'SCOTIA bANK', N'0010-2001-60-0-1', N'Soles', 8, 1, 3, 1, 7, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (897, N'00008977', N'backus', N'28/ENE/2016', 20160128, N'1749.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'242586', N'bCp', N'0010-2001-60-0-1', N'Soles', 8, 1, 1, 1, 7, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (898, N'00008587', N'backus', N'24/AbR/2016', 20160424, N'1609.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'721635', N'SCOTIA bANK', N'0010-2001-60-0-1', N'Soles', 8, 2, 3, 1, 5, 11)
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (899, N'00008785', N'Edelnor', N'12/FEb/2016', 20160212, N'3594.00', N'bbVA', N'0011-2071-28-0-1', N'Soles', N'414409', N'bCp', N'0011-8787-22-0-1', N'Soles', 6, 2, 1, 1, 5, 14)
GO
INSERT [dbo].[t_transferencia_pago] ([id_Transferenciapago], [orden_pago], [proveedor], [fecha_registro], [ffecha_registro], [importe], [banco], [cuenta_corriente], [moneda], [nro_transferencia], [banco_proveedor], [cuenta_corriente_proveedor], [moneda_proveedor], [id_proveedor], [id_banco], [id_banco_proveedor], [id_moneda], [id_cuenta_origen], [id_cuenta_destino]) VALUES (900, N'00007212', N'Edelnor', N'28/ENE/2016', 20160128, N'3096.00', N'bCp', N'0011-2733-75-0-1', N'Soles', N'323620', N'INTERbANK', N'0011-8787-22-0-1', N'Soles', 6, 1, 4, 1, 7, 14)
SET IDENTITY_INSERT [dbo].[t_transferencia_pago] OFF
ALTER TABLE [dbo].[t_campana]  WITH CHECK ADD  CONSTRAINT [FK_t_campana_t_solicitud_campana] FOREIGN KEY([fk_solicitud_campana])
REFERENCES [dbo].[t_solicitud_campana] ([id_solicitud_campana])
GO
ALTER TABLE [dbo].[t_campana] CHECK CONSTRAINT [FK_t_campana_t_solicitud_campana]
GO
ALTER TABLE [dbo].[t_campana]  WITH CHECK ADD  CONSTRAINT [FK_t_campana_t_tienda] FOREIGN KEY([fk_tienda])
REFERENCES [dbo].[t_tienda] ([id_tienda])
GO
ALTER TABLE [dbo].[t_campana] CHECK CONSTRAINT [FK_t_campana_t_tienda]
GO
ALTER TABLE [dbo].[t_campana_producto]  WITH CHECK ADD  CONSTRAINT [fk_campana_producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[t_producto] ([id_producto])
GO
ALTER TABLE [dbo].[t_campana_producto] CHECK CONSTRAINT [fk_campana_producto]
GO
ALTER TABLE [dbo].[t_cheque]  WITH CHECK ADD  CONSTRAINT [FK_t_cheque_t_banco] FOREIGN KEY([id_banco])
REFERENCES [dbo].[t_banco] ([id_banco])
GO
ALTER TABLE [dbo].[t_cheque] CHECK CONSTRAINT [FK_t_cheque_t_banco]
GO
ALTER TABLE [dbo].[t_cheque]  WITH CHECK ADD  CONSTRAINT [FK_t_cheque_t_moneda] FOREIGN KEY([id_moneda])
REFERENCES [dbo].[t_moneda] ([id_moneda])
GO
ALTER TABLE [dbo].[t_cheque] CHECK CONSTRAINT [FK_t_cheque_t_moneda]
GO
ALTER TABLE [dbo].[t_cheque]  WITH CHECK ADD  CONSTRAINT [FK_t_cheque_t_proveedor] FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[t_proveedor] ([id_proveedor])
GO
ALTER TABLE [dbo].[t_cheque] CHECK CONSTRAINT [FK_t_cheque_t_proveedor]
GO
ALTER TABLE [dbo].[t_contrato]  WITH CHECK ADD  CONSTRAINT [FK_t_contrato_t_cuenta] FOREIGN KEY([fk_cuenta])
REFERENCES [dbo].[t_cuenta] ([id_cuenta])
GO
ALTER TABLE [dbo].[t_contrato] CHECK CONSTRAINT [FK_t_contrato_t_cuenta]
GO
ALTER TABLE [dbo].[t_cuenta]  WITH CHECK ADD  CONSTRAINT [FK_t_cuenta_t_cuenta] FOREIGN KEY([fk_cuenta])
REFERENCES [dbo].[t_cuenta] ([id_cuenta])
GO
ALTER TABLE [dbo].[t_cuenta] CHECK CONSTRAINT [FK_t_cuenta_t_cuenta]
GO
ALTER TABLE [dbo].[t_cuenta]  WITH CHECK ADD  CONSTRAINT [FK_t_cuenta_t_ficha_afiliacion] FOREIGN KEY([fk_ficha_afiliacion])
REFERENCES [dbo].[t_ficha_afiliacion] ([id_ficha_afiliacion])
GO
ALTER TABLE [dbo].[t_cuenta] CHECK CONSTRAINT [FK_t_cuenta_t_ficha_afiliacion]
GO
ALTER TABLE [dbo].[t_cuenta]  WITH CHECK ADD  CONSTRAINT [FK_t_cuenta_t_tipo_cuenta] FOREIGN KEY([fk_tipo_cuenta])
REFERENCES [dbo].[t_tipo_cuenta] ([id_tipo_cuenta])
GO
ALTER TABLE [dbo].[t_cuenta] CHECK CONSTRAINT [FK_t_cuenta_t_tipo_cuenta]
GO
ALTER TABLE [dbo].[t_detalle_pago]  WITH CHECK ADD  CONSTRAINT [fk_detalle_pago_medio_pago] FOREIGN KEY([id_medio_pago])
REFERENCES [dbo].[t_medio_pago] ([id_medio_pago])
GO
ALTER TABLE [dbo].[t_detalle_pago] CHECK CONSTRAINT [fk_detalle_pago_medio_pago]
GO
ALTER TABLE [dbo].[t_detalle_pago]  WITH CHECK ADD  CONSTRAINT [fk_detalle_pago_moneda] FOREIGN KEY([id_moneda])
REFERENCES [dbo].[t_moneda] ([id_moneda])
GO
ALTER TABLE [dbo].[t_detalle_pago] CHECK CONSTRAINT [fk_detalle_pago_moneda]
GO
ALTER TABLE [dbo].[t_detalle_pago]  WITH CHECK ADD  CONSTRAINT [FK_t_detalle_pago_t_pago] FOREIGN KEY([id_pago])
REFERENCES [dbo].[t_pago] ([id_pago])
GO
ALTER TABLE [dbo].[t_detalle_pago] CHECK CONSTRAINT [FK_t_detalle_pago_t_pago]
GO
ALTER TABLE [dbo].[t_detalle_ticket_canje]  WITH CHECK ADD  CONSTRAINT [FK_t_detalle_ticket_canje_t_modalidad_canje] FOREIGN KEY([id_modalidad_canje])
REFERENCES [dbo].[t_modalidad_canje] ([id_modalidad_canje])
GO
ALTER TABLE [dbo].[t_detalle_ticket_canje] CHECK CONSTRAINT [FK_t_detalle_ticket_canje_t_modalidad_canje]
GO
ALTER TABLE [dbo].[t_detalle_ticket_canje]  WITH CHECK ADD  CONSTRAINT [FK_t_detalle_ticket_canje_t_ticket_canje] FOREIGN KEY([id_ticket_canje])
REFERENCES [dbo].[t_ticket_canje] ([id_ticket_canje])
GO
ALTER TABLE [dbo].[t_detalle_ticket_canje] CHECK CONSTRAINT [FK_t_detalle_ticket_canje_t_ticket_canje]
GO
ALTER TABLE [dbo].[t_detalle_venta]  WITH CHECK ADD  CONSTRAINT [fk_detalle_venta_producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[t_producto] ([id_producto])
GO
ALTER TABLE [dbo].[t_detalle_venta] CHECK CONSTRAINT [fk_detalle_venta_producto]
GO
ALTER TABLE [dbo].[t_detalle_venta]  WITH NOCHECK ADD  CONSTRAINT [fk_detalle_venta_venta] FOREIGN KEY([id_venta])
REFERENCES [dbo].[t_venta] ([id_venta])
GO
ALTER TABLE [dbo].[t_detalle_venta] CHECK CONSTRAINT [fk_detalle_venta_venta]
GO
ALTER TABLE [dbo].[t_deuda]  WITH CHECK ADD  CONSTRAINT [fk_deuda_tipo_servicio] FOREIGN KEY([id_tipo_servicio])
REFERENCES [dbo].[t_tipo_servicio] ([id_tipo_servicio])
GO
ALTER TABLE [dbo].[t_deuda] CHECK CONSTRAINT [fk_deuda_tipo_servicio]
GO
ALTER TABLE [dbo].[t_ficha_afiliacion]  WITH CHECK ADD  CONSTRAINT [FK_t_ficha_afiliacion_t_tipo_documento] FOREIGN KEY([fk_tipo_documento])
REFERENCES [dbo].[t_tipo_documento] ([id_tipo_documento])
GO
ALTER TABLE [dbo].[t_ficha_afiliacion] CHECK CONSTRAINT [FK_t_ficha_afiliacion_t_tipo_documento]
GO
ALTER TABLE [dbo].[t_modalidad_canje]  WITH CHECK ADD  CONSTRAINT [FK_t_modalidad_canje_t_producto_canje] FOREIGN KEY([fk_producto_canje])
REFERENCES [dbo].[t_producto_canje] ([id_producto_canje])
GO
ALTER TABLE [dbo].[t_modalidad_canje] CHECK CONSTRAINT [FK_t_modalidad_canje_t_producto_canje]
GO
ALTER TABLE [dbo].[t_orden_despacho]  WITH CHECK ADD  CONSTRAINT [FK_dbo.t_orden_despacho_dbo.t_orden_despacho_estado_id_orden_despacho_estado] FOREIGN KEY([id_orden_despacho_estado])
REFERENCES [dbo].[t_orden_despacho_estado] ([id_orden_despacho_estado])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[t_orden_despacho] CHECK CONSTRAINT [FK_dbo.t_orden_despacho_dbo.t_orden_despacho_estado_id_orden_despacho_estado]
GO
ALTER TABLE [dbo].[t_orden_despacho]  WITH CHECK ADD  CONSTRAINT [FK_dbo.t_orden_despacho_dbo.t_transporte_id_transporte] FOREIGN KEY([id_transporte])
REFERENCES [dbo].[t_transporte] ([id_transporte])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[t_orden_despacho] CHECK CONSTRAINT [FK_dbo.t_orden_despacho_dbo.t_transporte_id_transporte]
GO
ALTER TABLE [dbo].[t_orden_despacho_detalle]  WITH CHECK ADD  CONSTRAINT [FK_dbo.t_orden_despacho_detalle_dbo.t_orden_despacho_id_orden_despacho] FOREIGN KEY([id_orden_despacho])
REFERENCES [dbo].[t_orden_despacho] ([id_orden_despacho])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[t_orden_despacho_detalle] CHECK CONSTRAINT [FK_dbo.t_orden_despacho_detalle_dbo.t_orden_despacho_id_orden_despacho]
GO
ALTER TABLE [dbo].[t_orden_despacho_detalle]  WITH CHECK ADD  CONSTRAINT [FK_dbo.t_orden_despacho_detalle_dbo.t_producto_id_producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[t_producto] ([id_producto])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[t_orden_despacho_detalle] CHECK CONSTRAINT [FK_dbo.t_orden_despacho_detalle_dbo.t_producto_id_producto]
GO
ALTER TABLE [dbo].[t_orden_despacho_incidencia]  WITH CHECK ADD  CONSTRAINT [FK_dbo.t_orden_despacho_incidencia_dbo.t_orden_despacho_id_orden_despacho] FOREIGN KEY([id_orden_despacho])
REFERENCES [dbo].[t_orden_despacho] ([id_orden_despacho])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[t_orden_despacho_incidencia] CHECK CONSTRAINT [FK_dbo.t_orden_despacho_incidencia_dbo.t_orden_despacho_id_orden_despacho]
GO
ALTER TABLE [dbo].[t_orden_despacho_personal]  WITH CHECK ADD  CONSTRAINT [FK_dbo.t_orden_despacho_personal_dbo.t_orden_despacho_id_orden_despacho] FOREIGN KEY([id_orden_despacho])
REFERENCES [dbo].[t_orden_despacho] ([id_orden_despacho])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[t_orden_despacho_personal] CHECK CONSTRAINT [FK_dbo.t_orden_despacho_personal_dbo.t_orden_despacho_id_orden_despacho]
GO
ALTER TABLE [dbo].[t_orden_despacho_personal]  WITH CHECK ADD  CONSTRAINT [FK_dbo.t_orden_despacho_personal_dbo.t_programar_personal_id_programar_persona] FOREIGN KEY([id_programar_persona])
REFERENCES [dbo].[t_programar_personal] ([id_programar_persona])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[t_orden_despacho_personal] CHECK CONSTRAINT [FK_dbo.t_orden_despacho_personal_dbo.t_programar_personal_id_programar_persona]
GO
ALTER TABLE [dbo].[t_orden_despacho_ruta]  WITH CHECK ADD  CONSTRAINT [FK_dbo.t_orden_despacho_ruta_dbo.t_orden_despacho_id_orden_despacho] FOREIGN KEY([id_orden_despacho])
REFERENCES [dbo].[t_orden_despacho] ([id_orden_despacho])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[t_orden_despacho_ruta] CHECK CONSTRAINT [FK_dbo.t_orden_despacho_ruta_dbo.t_orden_despacho_id_orden_despacho]
GO
ALTER TABLE [dbo].[t_orden_despacho_solicitud]  WITH CHECK ADD  CONSTRAINT [FK_dbo.t_orden_despacho_solicitud_dbo.t_orden_despacho_id_orden_despacho] FOREIGN KEY([id_orden_despacho])
REFERENCES [dbo].[t_orden_despacho] ([id_orden_despacho])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[t_orden_despacho_solicitud] CHECK CONSTRAINT [FK_dbo.t_orden_despacho_solicitud_dbo.t_orden_despacho_id_orden_despacho]
GO
ALTER TABLE [dbo].[t_orden_despacho_solicitud]  WITH CHECK ADD  CONSTRAINT [FK_dbo.t_orden_despacho_solicitud_dbo.t_solicitud_compra_id_solicitud_compra] FOREIGN KEY([id_solicitud_compra])
REFERENCES [dbo].[t_solicitud_compra] ([id_solicitud_compra])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[t_orden_despacho_solicitud] CHECK CONSTRAINT [FK_dbo.t_orden_despacho_solicitud_dbo.t_solicitud_compra_id_solicitud_compra]
GO
ALTER TABLE [dbo].[t_orden_pago]  WITH CHECK ADD  CONSTRAINT [FK_t_orden_pago_t_banco] FOREIGN KEY([id_banco])
REFERENCES [dbo].[t_banco] ([id_banco])
GO
ALTER TABLE [dbo].[t_orden_pago] CHECK CONSTRAINT [FK_t_orden_pago_t_banco]
GO
ALTER TABLE [dbo].[t_orden_pago]  WITH CHECK ADD  CONSTRAINT [FK_t_orden_pago_t_cronograma] FOREIGN KEY([id_cronograma])
REFERENCES [dbo].[t_cronograma] ([id_Cronograma])
GO
ALTER TABLE [dbo].[t_orden_pago] CHECK CONSTRAINT [FK_t_orden_pago_t_cronograma]
GO
ALTER TABLE [dbo].[t_orden_pago]  WITH CHECK ADD  CONSTRAINT [FK_t_orden_pago_t_cuenta_bancaria] FOREIGN KEY([id_cuenta_origen])
REFERENCES [dbo].[t_cuenta_bancaria] ([id_Cuentabancaria])
GO
ALTER TABLE [dbo].[t_orden_pago] CHECK CONSTRAINT [FK_t_orden_pago_t_cuenta_bancaria]
GO
ALTER TABLE [dbo].[t_orden_pago]  WITH CHECK ADD  CONSTRAINT [FK_t_orden_pago_t_cuenta_bancaria1] FOREIGN KEY([id_cuenta_destino])
REFERENCES [dbo].[t_cuenta_bancaria] ([id_Cuentabancaria])
GO
ALTER TABLE [dbo].[t_orden_pago] CHECK CONSTRAINT [FK_t_orden_pago_t_cuenta_bancaria1]
GO
ALTER TABLE [dbo].[t_orden_pago]  WITH CHECK ADD  CONSTRAINT [FK_t_orden_pago_t_modalidad] FOREIGN KEY([id_modalidad])
REFERENCES [dbo].[t_modalidad] ([id_Modalidad])
GO
ALTER TABLE [dbo].[t_orden_pago] CHECK CONSTRAINT [FK_t_orden_pago_t_modalidad]
GO
ALTER TABLE [dbo].[t_orden_pago]  WITH CHECK ADD  CONSTRAINT [FK_t_orden_pago_t_moneda] FOREIGN KEY([id_moneda])
REFERENCES [dbo].[t_moneda] ([id_moneda])
GO
ALTER TABLE [dbo].[t_orden_pago] CHECK CONSTRAINT [FK_t_orden_pago_t_moneda]
GO
ALTER TABLE [dbo].[t_orden_pago]  WITH CHECK ADD  CONSTRAINT [FK_t_orden_pago_t_proveedor] FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[t_proveedor] ([id_proveedor])
GO
ALTER TABLE [dbo].[t_orden_pago] CHECK CONSTRAINT [FK_t_orden_pago_t_proveedor]
GO
ALTER TABLE [dbo].[t_pago]  WITH CHECK ADD  CONSTRAINT [fk_pago_tipo_comprobante] FOREIGN KEY([id_tipo_comprobante])
REFERENCES [dbo].[t_tipo_comprobante] ([id_tipo_comprobante])
GO
ALTER TABLE [dbo].[t_pago] CHECK CONSTRAINT [fk_pago_tipo_comprobante]
GO
ALTER TABLE [dbo].[t_pago]  WITH CHECK ADD  CONSTRAINT [fk_t_pago_t_empresa] FOREIGN KEY([id_empresa])
REFERENCES [dbo].[t_empresa] ([id_empresa])
GO
ALTER TABLE [dbo].[t_pago] CHECK CONSTRAINT [fk_t_pago_t_empresa]
GO
ALTER TABLE [dbo].[t_persona]  WITH CHECK ADD  CONSTRAINT [FK_dbo.t_persona_dbo.t_puesto_id_puesto] FOREIGN KEY([id_puesto])
REFERENCES [dbo].[t_puesto] ([id_puesto])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[t_persona] CHECK CONSTRAINT [FK_dbo.t_persona_dbo.t_puesto_id_puesto]
GO
ALTER TABLE [dbo].[t_producto]  WITH CHECK ADD  CONSTRAINT [FK_dbo.t_producto_dbo.t_categoria_producto_id_categoria_producto] FOREIGN KEY([id_categoria_producto])
REFERENCES [dbo].[t_categoria_producto] ([id_categoria_producto])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[t_producto] CHECK CONSTRAINT [FK_dbo.t_producto_dbo.t_categoria_producto_id_categoria_producto]
GO
ALTER TABLE [dbo].[t_producto]  WITH CHECK ADD  CONSTRAINT [FK_dbo.t_producto_dbo.t_unidad_medida_id_unidad_medida] FOREIGN KEY([id_unidad_medida])
REFERENCES [dbo].[t_unidad_medida] ([id_unidad_medida])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[t_producto] CHECK CONSTRAINT [FK_dbo.t_producto_dbo.t_unidad_medida_id_unidad_medida]
GO
ALTER TABLE [dbo].[t_producto_canje]  WITH CHECK ADD  CONSTRAINT [FK_t_producto_canje_t_categoria_producto_canje] FOREIGN KEY([fk_categoria_producto_canje])
REFERENCES [dbo].[t_categoria_producto_canje] ([id_categoria_producto_canje])
GO
ALTER TABLE [dbo].[t_producto_canje] CHECK CONSTRAINT [FK_t_producto_canje_t_categoria_producto_canje]
GO
ALTER TABLE [dbo].[t_programar_personal]  WITH CHECK ADD  CONSTRAINT [FK_dbo.t_programar_personal_dbo.t_persona_id_persona] FOREIGN KEY([id_persona])
REFERENCES [dbo].[t_persona] ([id_persona])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[t_programar_personal] CHECK CONSTRAINT [FK_dbo.t_programar_personal_dbo.t_persona_id_persona]
GO
ALTER TABLE [dbo].[t_programar_personal]  WITH CHECK ADD  CONSTRAINT [FK_dbo.t_programar_personal_dbo.t_turno_id_turno] FOREIGN KEY([id_turno])
REFERENCES [dbo].[t_turno] ([id_turno])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[t_programar_personal] CHECK CONSTRAINT [FK_dbo.t_programar_personal_dbo.t_turno_id_turno]
GO
ALTER TABLE [dbo].[t_puntos_producto]  WITH CHECK ADD  CONSTRAINT [fk_puntos_producto_producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[t_producto] ([id_producto])
GO
ALTER TABLE [dbo].[t_puntos_producto] CHECK CONSTRAINT [fk_puntos_producto_producto]
GO
ALTER TABLE [dbo].[t_recarga_servicio]  WITH CHECK ADD  CONSTRAINT [fk_recarga_tipo_servicio] FOREIGN KEY([id_tipo_servicio])
REFERENCES [dbo].[t_tipo_servicio] ([id_tipo_servicio])
GO
ALTER TABLE [dbo].[t_recarga_servicio] CHECK CONSTRAINT [fk_recarga_tipo_servicio]
GO
ALTER TABLE [dbo].[t_recarga_servicio]  WITH CHECK ADD  CONSTRAINT [fk_recarga_venta] FOREIGN KEY([id_venta])
REFERENCES [dbo].[t_venta] ([id_venta])
GO
ALTER TABLE [dbo].[t_recarga_servicio] CHECK CONSTRAINT [fk_recarga_venta]
GO
ALTER TABLE [dbo].[t_reporte_stock_anual]  WITH CHECK ADD  CONSTRAINT [FK_t_reporte_stock_anual_t_producto_canje] FOREIGN KEY([fk_producto_canje])
REFERENCES [dbo].[t_producto_canje] ([id_producto_canje])
GO
ALTER TABLE [dbo].[t_reporte_stock_anual] CHECK CONSTRAINT [FK_t_reporte_stock_anual_t_producto_canje]
GO
ALTER TABLE [dbo].[t_reporte_stock_producto_canje]  WITH CHECK ADD  CONSTRAINT [FK_t_reporte_stock_producto_canje_t_producto_canje] FOREIGN KEY([fk_producto_canje])
REFERENCES [dbo].[t_producto_canje] ([id_producto_canje])
GO
ALTER TABLE [dbo].[t_reporte_stock_producto_canje] CHECK CONSTRAINT [FK_t_reporte_stock_producto_canje_t_producto_canje]
GO
ALTER TABLE [dbo].[t_reporte_stock_producto_canje]  WITH CHECK ADD  CONSTRAINT [FK_t_reporte_stock_producto_canje_t_tienda] FOREIGN KEY([fk_tienda])
REFERENCES [dbo].[t_tienda] ([id_tienda])
GO
ALTER TABLE [dbo].[t_reporte_stock_producto_canje] CHECK CONSTRAINT [FK_t_reporte_stock_producto_canje_t_tienda]
GO
ALTER TABLE [dbo].[t_solicitud_atencion]  WITH NOCHECK ADD  CONSTRAINT [FK_SOLICITUD_AFILIACION_TIENDA] FOREIGN KEY([fk_tienda])
REFERENCES [dbo].[t_tienda] ([id_tienda])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[t_solicitud_atencion] NOCHECK CONSTRAINT [FK_SOLICITUD_AFILIACION_TIENDA]
GO
ALTER TABLE [dbo].[t_solicitud_atencion]  WITH CHECK ADD  CONSTRAINT [FK_t_solicitud_atencion_t_ficha_afiliacion] FOREIGN KEY([fk_ficha_afiliacion])
REFERENCES [dbo].[t_ficha_afiliacion] ([id_ficha_afiliacion])
GO
ALTER TABLE [dbo].[t_solicitud_atencion] CHECK CONSTRAINT [FK_t_solicitud_atencion_t_ficha_afiliacion]
GO
ALTER TABLE [dbo].[t_solicitud_compra]  WITH CHECK ADD  CONSTRAINT [FK_dbo.t_solicitud_compra_dbo.t_tienda_id_tienda] FOREIGN KEY([id_tienda])
REFERENCES [dbo].[t_tienda] ([id_tienda])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[t_solicitud_compra] CHECK CONSTRAINT [FK_dbo.t_solicitud_compra_dbo.t_tienda_id_tienda]
GO
ALTER TABLE [dbo].[t_solicitud_compra_detalle]  WITH CHECK ADD  CONSTRAINT [FK_dbo.t_solicitud_compra_detalle_dbo.t_producto_id_producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[t_producto] ([id_producto])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[t_solicitud_compra_detalle] CHECK CONSTRAINT [FK_dbo.t_solicitud_compra_detalle_dbo.t_producto_id_producto]
GO
ALTER TABLE [dbo].[t_solicitud_compra_detalle]  WITH CHECK ADD  CONSTRAINT [FK_dbo.t_solicitud_compra_detalle_dbo.t_solicitud_compra_id_solicitud_compra] FOREIGN KEY([id_solicitud_compra])
REFERENCES [dbo].[t_solicitud_compra] ([id_solicitud_compra])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[t_solicitud_compra_detalle] CHECK CONSTRAINT [FK_dbo.t_solicitud_compra_detalle_dbo.t_solicitud_compra_id_solicitud_compra]
GO
ALTER TABLE [dbo].[t_stock_producto]  WITH CHECK ADD  CONSTRAINT [fk_stock_producto_producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[t_producto] ([id_producto])
GO
ALTER TABLE [dbo].[t_stock_producto] CHECK CONSTRAINT [fk_stock_producto_producto]
GO
ALTER TABLE [dbo].[t_stock_producto_almacen]  WITH CHECK ADD  CONSTRAINT [FK_dbo.t_stock_producto_almacen_dbo.t_producto_id_producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[t_producto] ([id_producto])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[t_stock_producto_almacen] CHECK CONSTRAINT [FK_dbo.t_stock_producto_almacen_dbo.t_producto_id_producto]
GO
ALTER TABLE [dbo].[t_tarjera_afiliacion_cuenta]  WITH CHECK ADD  CONSTRAINT [FK_t_tarjera_afiliacion_cuenta_t_cuenta] FOREIGN KEY([fk_cuenta])
REFERENCES [dbo].[t_cuenta] ([id_cuenta])
GO
ALTER TABLE [dbo].[t_tarjera_afiliacion_cuenta] CHECK CONSTRAINT [FK_t_tarjera_afiliacion_cuenta_t_cuenta]
GO
ALTER TABLE [dbo].[t_tarjera_afiliacion_cuenta]  WITH CHECK ADD  CONSTRAINT [FK_t_tarjera_afiliacion_cuenta_t_tarjera_afiliacion] FOREIGN KEY([fk_tarjeta_afiliacion])
REFERENCES [dbo].[t_tarjeta_afiliacion] ([id_tarjeta_afiliacion])
GO
ALTER TABLE [dbo].[t_tarjera_afiliacion_cuenta] CHECK CONSTRAINT [FK_t_tarjera_afiliacion_cuenta_t_tarjera_afiliacion]
GO
ALTER TABLE [dbo].[t_ticket_canje]  WITH CHECK ADD  CONSTRAINT [FK_t_ticket_canje_t_cuenta] FOREIGN KEY([fk_cuenta])
REFERENCES [dbo].[t_cuenta] ([id_cuenta])
GO
ALTER TABLE [dbo].[t_ticket_canje] CHECK CONSTRAINT [FK_t_ticket_canje_t_cuenta]
GO
ALTER TABLE [dbo].[t_ticket_canje]  WITH CHECK ADD  CONSTRAINT [FK_t_ticket_canje_t_tienda] FOREIGN KEY([fk_tienda])
REFERENCES [dbo].[t_tienda] ([id_tienda])
GO
ALTER TABLE [dbo].[t_ticket_canje] CHECK CONSTRAINT [FK_t_ticket_canje_t_tienda]
GO
ALTER TABLE [dbo].[t_ticket_transferencia]  WITH CHECK ADD  CONSTRAINT [FK_t_ticket_transferencia_t_cuenta] FOREIGN KEY([fk_cuenta])
REFERENCES [dbo].[t_cuenta] ([id_cuenta])
GO
ALTER TABLE [dbo].[t_ticket_transferencia] CHECK CONSTRAINT [FK_t_ticket_transferencia_t_cuenta]
GO
ALTER TABLE [dbo].[t_tienda]  WITH CHECK ADD  CONSTRAINT [FK_t_tienda_t_zona] FOREIGN KEY([id_zona])
REFERENCES [dbo].[t_zona] ([id_zona])
GO
ALTER TABLE [dbo].[t_tienda] CHECK CONSTRAINT [FK_t_tienda_t_zona]
GO
ALTER TABLE [dbo].[t_transferencia_pago]  WITH CHECK ADD  CONSTRAINT [FK_t_transferencia_pago_t_banco] FOREIGN KEY([id_banco])
REFERENCES [dbo].[t_banco] ([id_banco])
GO
ALTER TABLE [dbo].[t_transferencia_pago] CHECK CONSTRAINT [FK_t_transferencia_pago_t_banco]
GO
ALTER TABLE [dbo].[t_transferencia_pago]  WITH CHECK ADD  CONSTRAINT [FK_t_transferencia_pago_t_banco1] FOREIGN KEY([id_banco_proveedor])
REFERENCES [dbo].[t_banco] ([id_banco])
GO
ALTER TABLE [dbo].[t_transferencia_pago] CHECK CONSTRAINT [FK_t_transferencia_pago_t_banco1]
GO
ALTER TABLE [dbo].[t_transferencia_pago]  WITH CHECK ADD  CONSTRAINT [FK_t_transferencia_pago_t_cuenta_bancaria] FOREIGN KEY([id_cuenta_origen])
REFERENCES [dbo].[t_cuenta_bancaria] ([id_Cuentabancaria])
GO
ALTER TABLE [dbo].[t_transferencia_pago] CHECK CONSTRAINT [FK_t_transferencia_pago_t_cuenta_bancaria]
GO
ALTER TABLE [dbo].[t_transferencia_pago]  WITH CHECK ADD  CONSTRAINT [FK_t_transferencia_pago_t_cuenta_bancaria1] FOREIGN KEY([id_cuenta_destino])
REFERENCES [dbo].[t_cuenta_bancaria] ([id_Cuentabancaria])
GO
ALTER TABLE [dbo].[t_transferencia_pago] CHECK CONSTRAINT [FK_t_transferencia_pago_t_cuenta_bancaria1]
GO
ALTER TABLE [dbo].[t_transferencia_pago]  WITH CHECK ADD  CONSTRAINT [FK_t_transferencia_pago_t_moneda] FOREIGN KEY([id_moneda])
REFERENCES [dbo].[t_moneda] ([id_moneda])
GO
ALTER TABLE [dbo].[t_transferencia_pago] CHECK CONSTRAINT [FK_t_transferencia_pago_t_moneda]
GO
ALTER TABLE [dbo].[t_transferencia_pago]  WITH CHECK ADD  CONSTRAINT [FK_t_transferencia_pago_t_proveedor] FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[t_proveedor] ([id_proveedor])
GO
ALTER TABLE [dbo].[t_transferencia_pago] CHECK CONSTRAINT [FK_t_transferencia_pago_t_proveedor]
GO
ALTER TABLE [dbo].[t_venta]  WITH CHECK ADD  CONSTRAINT [fk_t_pago_t_venta] FOREIGN KEY([id_pago])
REFERENCES [dbo].[t_pago] ([id_pago])
GO
ALTER TABLE [dbo].[t_venta] CHECK CONSTRAINT [fk_t_pago_t_venta]
GO
ALTER TABLE [dbo].[t_venta]  WITH CHECK ADD  CONSTRAINT [fk_t_venta_t_cajero] FOREIGN KEY([id_cajero])
REFERENCES [dbo].[t_cajero] ([id_cajero])
GO
ALTER TABLE [dbo].[t_venta] CHECK CONSTRAINT [fk_t_venta_t_cajero]
GO
ALTER TABLE [dbo].[t_venta]  WITH CHECK ADD  CONSTRAINT [fk_t_venta_t_tarjeta_afiliacion] FOREIGN KEY([id_tarjeta_afiliacion])
REFERENCES [dbo].[t_tarjeta_afiliacion] ([id_tarjeta_afiliacion])
GO
ALTER TABLE [dbo].[t_venta] CHECK CONSTRAINT [fk_t_venta_t_tarjeta_afiliacion]
GO
ALTER TABLE [dbo].[t_venta]  WITH CHECK ADD  CONSTRAINT [fk_t_venta_t_tienda] FOREIGN KEY([id_tienda])
REFERENCES [dbo].[t_tienda] ([id_tienda])
GO
ALTER TABLE [dbo].[t_venta] CHECK CONSTRAINT [fk_t_venta_t_tienda]
GO
/****** Object:  StoredProcedure [dbo].[proc_actualizar_estado_deuda]    Script Date: 15/06/2016 12:00:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create PROCEDURE [dbo].[proc_actualizar_estado_deuda]
(
@numero_documento nvarchar(20),
@id_tipo_servicio int,
@estado nvarchar(20)
)
as
update dbo.t_deuda set estado = @estado where id_tipo_servicio = @id_tipo_servicio and numero_documento = @numero_documento

GO
/****** Object:  StoredProcedure [dbo].[proc_actualizar_tipo_servicio]    Script Date: 15/06/2016 12:00:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[proc_actualizar_tipo_servicio]
( 
@id_tipo_servicio int, 
@descripcion nvarchar(20), 
@porcentaje_comision decimal(18,2),
@tipo char(1),
@habilitado bit
) 
as 
 
if @id_tipo_servicio = 0 
begin 
 insert into dbo.t_tipo_servicio 
 (descripcion, porcentaje_comision, tipo, habilitado) 
 values 
 (@descripcion, @porcentaje_comision, @tipo, @habilitado) 
 set @id_tipo_servicio = SCOPE_IDENTITY() 
end 
else 
begin 
 update dbo.t_tipo_servicio set 
 descripcion = @descripcion, 
 porcentaje_comision = @porcentaje_comision,
 tipo =@tipo,
 habilitado = @habilitado 
 where  
 id_tipo_servicio = @id_tipo_servicio 
end 
select @id_tipo_servicio 

GO
/****** Object:  StoredProcedure [dbo].[proc_obtener_codigo_autorizacion]    Script Date: 15/06/2016 12:00:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


		
Create Procedure [dbo].[proc_obtener_codigo_autorizacion]
(
	@accion nvarchar(50)
)
as
select *
from dbo.t_autorizacion where accion = @accion;

GO
/****** Object:  StoredProcedure [dbo].[proc_obtener_deuda]    Script Date: 15/06/2016 12:00:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
		
Create Procedure [dbo].[proc_obtener_deuda]
(
	@id_tipo_servicio int,
	@numero_documento nvarchar(20)
)
as
select id_deuda, id_tipo_servicio, monto_soles, estado, numero_documento, fecha_vencimiento
from dbo.t_deuda where id_tipo_servicio = @id_tipo_servicio and numero_documento = @numero_documento

GO
/****** Object:  StoredProcedure [dbo].[proc_obtener_tipo_servicio]    Script Date: 15/06/2016 12:00:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[proc_obtener_tipo_servicio]
(
@id_tipo_servicio int,
@descripcion nvarchar(20)
)
as
select ts.id_tipo_servicio,descripcion,ts.porcentaje_comision, ts.tipo, ts.habilitado
 from [dbo].[t_tipo_servicio] as ts
 left join
 (
 select max(id_tipo_servicio_historico) as id_tipo_servicio_historico, id_tipo_servicio
 from t_tipo_servicio_historico group by id_tipo_servicio
 ) as tsh1 on tsh1.id_tipo_servicio = ts.id_tipo_servicio
 LEFT join t_tipo_servicio_historico as tsh2 on tsh2.id_tipo_servicio_historico = tsh1.id_tipo_servicio_historico
 
 where (ts.id_tipo_servicio = @id_tipo_servicio or @id_tipo_servicio = 0)
 and (descripcion like '%' + @descripcion + '%')

GO
/****** Object:  StoredProcedure [dbo].[proc_obtenerCampanaXProducto]    Script Date: 15/06/2016 12:00:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[proc_obtenerCampanaXProducto]
@idProducto int
as
SELECT * FROM dbo.t_campana_producto d
where d.id_producto=@idProducto


GO
/****** Object:  StoredProcedure [dbo].[proc_obtenerDatoscuentaXtarjeta]    Script Date: 15/06/2016 12:00:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[proc_obtenerDatoscuentaXtarjeta]
@numerotarjeta bigint
as
SELECT t.id_tarjeta_afiliacion as idtarjeta,
t.numero_tarjeta,
a.id_cuenta as idcuenta,
f.numero_documento,f.[nombre]+' '+f.[apellidos] as nombre_completo,
a.puntos as puntos
 FROM 
 dbo.t_tarjeta_afiliacion t inner join dbo.t_tarjeta_afiliacion_cuenta t2 on t.id_tarjeta_afiliacion=t2.fk_tarjeta_afiliacion
 inner join dbo.t_cuenta a  on a.id_cuenta=t2.fk_cuenta
 inner join t_ficha_afiliacion f on f.id_ficha_afiliacion=a.fk_ficha_afiliacion

where t.numero_tarjeta=@numerotarjeta

GO
/****** Object:  StoredProcedure [dbo].[proc_obtenerEmpresaxRuc]    Script Date: 15/06/2016 12:00:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[proc_obtenerEmpresaxRuc]
@ruc nvarchar(11)
as
SELECT [id_empresa]
      ,[razon_social]
      ,[ruc]
  FROM [dbo].[t_empresa] d
where d.ruc=@ruc


GO
/****** Object:  StoredProcedure [dbo].[proc_obtenerMediosPagos]    Script Date: 15/06/2016 12:00:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_obtenerMediosPagos]
as
SELECT [id_medio_pago]
      ,[descripcion]
  FROM [dbo].[t_medio_pago]


GO
/****** Object:  StoredProcedure [dbo].[proc_obtenerMonedas]    Script Date: 15/06/2016 12:00:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_obtenerMonedas]
as

SELECT [id_moneda]
      ,[descripcion]
      ,[simbolo]
  FROM [dbo].[t_moneda]

GO
/****** Object:  StoredProcedure [dbo].[proc_obtenerProducto]    Script Date: 15/06/2016 12:00:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[proc_obtenerProducto]
@idProducto int
as
SELECT d.id_producto,
d.descripcion_producto as descripcion,
d.precio FROM dbo.t_producto d
where d.id_producto=@idProducto


GO
/****** Object:  StoredProcedure [dbo].[proc_obtenerPuntosXProducto]    Script Date: 15/06/2016 12:00:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[proc_obtenerPuntosXProducto]
@idProducto int
as
SELECT * FROM dbo.t_puntos_producto d
where d.id_producto=@idProducto

GO
/****** Object:  StoredProcedure [dbo].[proc_obtenerStockXProducto]    Script Date: 15/06/2016 12:00:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[proc_obtenerStockXProducto]
@idProducto int
as
SELECT * FROM dbo.stock_producto d
where d.id_producto=@idProducto

GO
/****** Object:  StoredProcedure [dbo].[proc_obtenerTipoCambio]    Script Date: 15/06/2016 12:00:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_obtenerTipoCambio]
@fecha as date,    
@idMoneda as int
as
select  * from t_tipo_cambio where fecha=@fecha

GO
/****** Object:  StoredProcedure [dbo].[proc_obtenerTipoComprobante]    Script Date: 15/06/2016 12:00:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[proc_obtenerTipoComprobante]
as

SELECT [id_tipo_comprobante]
      ,[descripcion]
  FROM [dbo].[t_tipo_comprobante]

GO
/****** Object:  StoredProcedure [dbo].[proc_puntos_ganados]    Script Date: 15/06/2016 12:00:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_puntos_ganados]
@idcuenta int,
@puntos int
as
update dbo.t_cuenta
          set puntos=puntos + @puntos
		  where id_cuenta=@idcuenta

GO
/****** Object:  StoredProcedure [dbo].[proc_registrar_detalle]    Script Date: 15/06/2016 12:00:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_registrar_detalle]
@idVenta int,
@idProducto int,
@cantidad int
as
INSERT INTO [dbo].[t_detalle_venta]
           ([id_venta]
           ,[id_producto]
           ,[cantidad])
     VALUES
           (@idVenta,@idProducto,@cantidad)

GO
/****** Object:  StoredProcedure [dbo].[proc_registrar_detalle_pago]    Script Date: 15/06/2016 12:00:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[proc_registrar_detalle_pago]
@idPago int,
@idMedio int,
@idMoneda int,
@monto decimal(18,2),
@marca varchar(50),
@entidad varchar(100)
as

INSERT INTO [dbo].[t_detalle_pago]
           ([id_pago]
           ,[id_medio_pago]
           ,[monto],
		   [id_moneda],
		    [marca_tarjeta],
			 [entidad_bancaria])
     VALUES
           (@idPago
           ,@idMedio
           ,@monto
		   ,@idMoneda
		    ,@marca
			 ,@entidad)



GO
/****** Object:  StoredProcedure [dbo].[proc_registrar_Empresa]    Script Date: 15/06/2016 12:00:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[proc_registrar_Empresa]
@razonS VarChar(100),
@ruc VarChar(11),
@new_identity   int    OUTPUT
as

INSERT INTO [dbo].[t_empresa]
           ([razon_social]
           ,[ruc])
     VALUES
           (@razonS
           ,@ruc )
		   SELECT @new_identity = SCOPE_IDENTITY()

GO
/****** Object:  StoredProcedure [dbo].[proc_registrar_Pago]    Script Date: 15/06/2016 12:00:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[proc_registrar_Pago]

@idEmpresa int,
@idComprobante decimal(18,2),
@vueltoS decimal(18,2),
@vueltoD decimal(18,2),
@monto decimal(18,2),
@fecha datetime,
@estado nvarchar(10),
@comision decimal(18,2),
@new_identity   int    OUTPUT,
@numero_comprobante varchar(100)    OUTPUT

as
BEGIN
DECLARE 
@Correl varchar,
@Abrev varchar
SELECT  @Correl=correlativo,@Abrev=abreviatura FROM t_tipo_comprobante WHERE id_tipo_comprobante=@idComprobante

SET @numero_comprobante=@Abrev+ '-'+ @Correl
IF (@idEmpresa =0)
   SET @idEmpresa = NULL

INSERT INTO [dbo].[t_pago]
           ([fecha]
           ,[id_tipo_comprobante]
           ,[vuelto_soles]
		   ,[vuelto_dolares]
           ,[monto_pagado]
		   ,[estado]
		   ,[id_empresa]
		       ,[comision]
		    ,[numero_comprobante])
     VALUES
           (@fecha
           ,@idComprobante
           ,@vueltoS
		   ,@vueltoD
           ,@monto
		   ,@estado
		   ,@idEmpresa
		   ,@comision
		   ,@numero_comprobante)


SELECT @new_identity = SCOPE_IDENTITY()
select @numero_comprobante
update t_tipo_comprobante set correlativo=@Correl+1 where id_tipo_comprobante=@idComprobante

END

GO
/****** Object:  StoredProcedure [dbo].[proc_registrar_recarga_servicio]    Script Date: 15/06/2016 12:00:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_registrar_recarga_servicio]  
  @id_recarga int,
  @id_tipo_servicio int,
  @monto_soles decimal(18,2),
  @estado nvarchar(20),
  @numero_telefono nvarchar(20),
  @id_venta int
as  
INSERT INTO dbo.t_recarga_servicio
(id_tipo_servicio, monto_soles, estado, numero_telefono, id_venta)
values
(@id_tipo_servicio, @monto_soles, @estado, @numero_telefono, @id_venta) 

GO
/****** Object:  StoredProcedure [dbo].[proc_registrar_Venta]    Script Date: 15/06/2016 12:00:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[proc_registrar_Venta]    Script Date: 4/7/2016 6:14:50 PM ******/


create procedure [dbo].[proc_registrar_Venta]
@cajero VarChar(50),
@montoSoles decimal(18,2),
@montoDolares decimal(18,2),
@subtotal decimal(18,2),
@igv decimal(18,2),
@descuento decimal(18,2),
@estado  VarChar(20),
@fecha datetime,
@puntos int,
@idTarjeta int,
@idPago int,
@idTienda int,
@tipoVenta int,
@new_identity   int    OUTPUT
as

IF (@idTienda =0)
   SET @idTienda = NULL

   IF (@idTarjeta =0)
   SET @idTarjeta = NULL

    IF (@idPago =0)
   SET @idPago = NULL

insert into t_venta  (
            [fecha_hora]
           ,[id_cajero]
           ,[monto_soles]
           ,[monto_dolares]
           ,[subtotal]
           ,[igv]
		   ,[estado]
           ,[descuento]
		   ,[puntos_acumulados]
		   ,[id_tarjeta_afiliacion]
			,[id_pago]
			,[id_tienda]
			,[tipo_venta])
values(@fecha,@cajero,@montoSoles,@montoDolares,@subtotal,@igv,@estado,@descuento,@puntos,@idTarjeta,@idPago,@idTienda,@tipoVenta)

SELECT @new_identity = SCOPE_IDENTITY()


GO
/****** Object:  StoredProcedure [dbo].[proc_tipo_servicio_historico]    Script Date: 15/06/2016 12:00:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 
 
create procedure [dbo].[proc_tipo_servicio_historico]
(
      @id_tipo_servicio int,
      @porcentaje_comision decimal(18,2),
      @Usuario nvarchar(100)
)
as
 
insert into dbo.t_tipo_servicio_historico
(id_tipo_servicio,porcentaje_comision,      Fecha_registro,   Usuario)
values
(@id_tipo_servicio,@porcentaje_comision,      GETDATE(),  @Usuario)

GO
/****** Object:  StoredProcedure [dbo].[proc_update_stock]    Script Date: 15/06/2016 12:00:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[proc_update_stock]
@idProducto int,
@cantidadVendida int
as
update dbo.t_stock_producto
          set stock_actual=stock_actual - @cantidadVendida

		  where id_producto=@idProducto


GO
/****** Object:  StoredProcedure [dbo].[usp_banco_proveedore_LST]    Script Date: 15/06/2016 12:00:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_banco_proveedore_LST] 
as     
Select id_proveedor,RUC  ,Razon_Social  
From T_proveedor    
    
Select id_banco,Nombre    
From T_banco

GO
/****** Object:  StoredProcedure [dbo].[usp_cheque_LST_por_fecha_proveedor_banco]    Script Date: 15/06/2016 12:00:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_cheque_LST_por_fecha_proveedor_banco]  
@pIdproveedor as int,  
@pIdbanco as int,  
@pFechaDesde as int,  
@pFechaHasta as int  
as  
Select C.numero_cheque,C.fecha_emision,C.importe ,p.razon_social ,M.moneda  , b.nombre
From t_cheque C inner join t_moneda M on C.id_moneda = M.id_moneda  
inner join t_proveedor p on C.id_proveedor = p.id_proveedor inner join t_banco b  
on C.id_banco = b.id_banco  
where  
C.id_proveedor = case @pIdproveedor when -1 then C.id_proveedor else @pIdproveedor end  
and C.id_banco = case @pIdbanco when -1 then C.id_banco else @pIdbanco end  
and c.ffecha_emision >= @pFechaDesde and c.ffecha_emision <= @pFechaHasta
order by C.ffecha_emision asc

GO
/****** Object:  StoredProcedure [dbo].[usp_consultarOrdenpago]    Script Date: 15/06/2016 12:00:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_consultarOrdenpago]
@FFechaInicio as int,
@FFechaFin as int,
@Estado as varchar(100),
@NroOrden as varchar(100),
@proveedor as varchar(100)
as 
Select id_ordenpago,    
NroOrden,Descripcion,proveedor,    
FechaRegistro,FFechaRegistro,Fechapago,FFechapago,    
banco,Moneda,Montopago,Estado,CuentaOrigen,SaldoCuentaOrigen,  MonedaDestino, MontoDestino,   
CuentaDestino,Modalidadpago,DocumentoAnexo,    
NroOperacion,Diferencia,MontoDiferencia,Comentario,Motivo,FechaComentario    ,NroCronograma
From T_Ordenpago    
where FFechaRegistro >= @FFechaInicio and FFechaRegistro <= @FFechaFin and     
Estado = case @Estado when '-' then Estado else @Estado end and    
proveedor = case @proveedor when '-' then proveedor else @proveedor end and    
NroOrden = case @NroOrden when '-' then NroOrden else @NroOrden end

GO
/****** Object:  StoredProcedure [dbo].[usp_cronograma_LST_por_fechas_estado]    Script Date: 15/06/2016 12:00:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_cronograma_LST_por_fechas_estado]  
@pFFechaInicio as int,        
@pFFechaFin as int    ,    
@pEstado as varchar(100)    
as        
Select id_Cronograma,Nro_Cronograma,Fecha_Inicio,FFecha_Inicio,Fecha_Fin,FFecha_Fin,Estado, Observaciones        
From T_Cronograma        
Where FFecha_Inicio >= @pFFechaInicio and FFecha_Fin <= @pFFechaFin And Estado = @pEstado ORDER bY FFecha_inicio asc

GO
/****** Object:  StoredProcedure [dbo].[usp_cronograma_set_comentario]    Script Date: 15/06/2016 12:00:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_cronograma_set_comentario]  
@pIdCronograma as int,    
@pObservaciones as varchar(max)    
as    
Update t_cronograma set Observaciones = @pObservaciones where id_Cronograma = @pIdCronograma

GO
/****** Object:  StoredProcedure [dbo].[usp_cronograma_set_estado]    Script Date: 15/06/2016 12:00:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure  [dbo].[usp_cronograma_set_estado]  
@pIdCronograma as int,    
@pEstado as varchar(100)    
as    
update t_cronograma set estado = @pEstado where id_Cronograma = @pIdCronograma

GO
/****** Object:  StoredProcedure [dbo].[usp_listarOrdenesCompraObservadas]    Script Date: 15/06/2016 12:00:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_listarOrdenesCompraObservadas]
as      
Select NroOrden + '|' + Comentario + '|' + Motivo + '|' + FechaComentario + '^'
From T_ordenPago
where Comentario != '-' or motivo != '-'

GO
/****** Object:  StoredProcedure [dbo].[usp_ordenpago_LST]    Script Date: 15/06/2016 12:00:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ordenpago_LST]
@pFFechaInicio as int,  
@pFFechaFin as int,  
@pEstado as varchar(100),  
@pNroOrden as varchar(100),  
@pproveedor as varchar(100)  
as   
Select id_ordenpago,      
Nro_Orden,Descripcion,proveedor,      
Fecha_Registro,FFecha_Registro,Fecha_pago,FFecha_pago,      
banco,Moneda,Monto_pago,Estado,Cuenta_Origen,Saldo_Cuenta_Origen,  Moneda_Destino, Monto_Destino,     
Cuenta_Destino,Modalidad_pago,Documento_Anexo,      
Nro_Operacion,Diferencia,Monto_Diferencia,Comentario,Motivo,Fecha_Comentario    ,Nro_Cronograma  
From T_Orden_pago      
where FFecha_Registro >= @pFFechaInicio and FFecha_Registro <= @pFFechaFin and       
Estado = case @pEstado when '-' then Estado else @pEstado end and      
proveedor = case @pproveedor when '-' then proveedor else @pproveedor end and      
Nro_Orden = case @pNroOrden when '-' then Nro_Orden else @pNroOrden end

GO
/****** Object:  StoredProcedure [dbo].[usp_ordenpago_LST_observadas]    Script Date: 15/06/2016 12:00:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure  [dbo].[usp_ordenpago_LST_observadas]  
as          
Select Nro_Orden + '~' + Comentario + '~' + Motivo + '~' + Fecha_Comentario + '^'    
From T_orden_Pago        
where Comentario != '-' or motivo != '-'  
GO
/****** Object:  StoredProcedure [dbo].[usp_ordenpago_LST_por_cronograma]    Script Date: 15/06/2016 12:00:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ordenpago_LST_por_cronograma]  
@pNroCronograma as varchar(100)      
as      
Select id_Ordenpago,          
Nro_Orden,Descripcion,proveedor,          
Fecha_Registro,FFecha_Registro,Fecha_pago,FFecha_pago,          
banco,Moneda,Monto_pago,Estado,Cuenta_Origen,Saldo_Cuenta_Origen,  Moneda_Destino, Monto_Destino,         
Cuenta_Destino,Modalidad_pago,Documento_Anexo,          
Nro_Operacion,Diferencia,Monto_Diferencia,Comentario,Motivo,Fecha_Comentario    ,Nro_Cronograma      
From t_Orden_pago       
where Nro_Cronograma = @pNroCronograma order by FFecha_pago asc

GO
/****** Object:  StoredProcedure [dbo].[usp_ordenpago_LST_por_fecha_estado_proveedor_banco]    Script Date: 15/06/2016 12:00:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure  [dbo].[usp_ordenpago_LST_por_fecha_estado_proveedor_banco]
@pFechaDesde as int,      
@pFechaHasta as int,      
@pEstado as varchar(100),      
@pproveedor as varchar(100),      
@pbanco as varchar(100)      
as      
Select id_ordenpAgo,      
Nro_Orden,Descripcion,proveedor,      
Fecha_Registro,FFecha_Registro,Fecha_pago,FFecha_pago,      
banco,Moneda,Monto_pago,Estado,Cuenta_Origen,Saldo_Cuenta_Origen,  Moneda_Destino, Monto_Destino,     
Cuenta_Destino,Modalidad_pago,Documento_Anexo,      
Nro_Operacion,Diferencia,Monto_Diferencia,Comentario,Motivo,Fecha_Comentario    ,Nro_Cronograma  
From t_Orden_pago      
where FFecha_Registro >= @pFechaDesde and FFecha_Registro <= @pFechaHasta and       
Estado = case @pEstado when '-' then Estado else @pEstado end and      
proveedor = case @pproveedor when '-' then proveedor else @pproveedor end and      
banco = case @pbanco when '-' then banco else @pbanco end

GO
/****** Object:  StoredProcedure [dbo].[usp_ordenpago_set_comentario]    Script Date: 15/06/2016 12:00:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ordenpago_set_comentario]
@pOrdenpagoID as int,    
@pComentario as varchar(100),    
@pMotivo as varchar(100),    
@pFechaComentario as varchar(100)    
as    
Update T_Orden_pago  
set Comentario = @pComentario, Motivo = @pMotivo, Fecha_Comentario = @pFechaComentario    
Where id_ordenpago = @pOrdenpagoID

GO
/****** Object:  StoredProcedure [dbo].[usp_transferencias_LST_por_fecha_proveedor_banco]    Script Date: 15/06/2016 12:00:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  procedure [dbo].[usp_transferencias_LST_por_fecha_proveedor_banco]
@pFFechaDesde as int,     
@pFFechaHasta as int,    
@pproveedor as varchar(100),    
@pbanco as varchar(100)    
as    
Select id_Transferenciapago,Orden_pago,proveedor,Fecha_Registro,FFecha_Registro,Importe,
banco,Cuenta_Corriente,Moneda,Nro_Transferencia,banco_proveedor,Cuenta_Corriente_proveedor,Moneda_proveedor    
From t_transferencia_pago    
Where FFecha_Registro >= @pFFechaDesde And FFecha_Registro <= @pFFechaHasta and   
proveedor = case @pproveedor when '-' then proveedor else @pproveedor end   
and banco = case @pbanco when '-' then banco else @pbanco end    
Order by FFecha_Registro desc

GO
USE [master]
GO
ALTER DATABASE [plazavea] SET  READ_WRITE 
GO
