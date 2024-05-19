USE [master]
GO
/****** Object:  Database [sistema_ventas_online]    Script Date: 18/05/2024 21:11:05 ******/
CREATE DATABASE [sistema_ventas_online]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sistema_ventas_online', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\sistema_ventas_online.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'sistema_ventas_online_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\sistema_ventas_online_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [sistema_ventas_online] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sistema_ventas_online].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sistema_ventas_online] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sistema_ventas_online] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sistema_ventas_online] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sistema_ventas_online] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sistema_ventas_online] SET ARITHABORT OFF 
GO
ALTER DATABASE [sistema_ventas_online] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [sistema_ventas_online] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sistema_ventas_online] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sistema_ventas_online] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sistema_ventas_online] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sistema_ventas_online] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sistema_ventas_online] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sistema_ventas_online] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sistema_ventas_online] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sistema_ventas_online] SET  DISABLE_BROKER 
GO
ALTER DATABASE [sistema_ventas_online] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sistema_ventas_online] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sistema_ventas_online] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sistema_ventas_online] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sistema_ventas_online] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sistema_ventas_online] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sistema_ventas_online] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sistema_ventas_online] SET RECOVERY FULL 
GO
ALTER DATABASE [sistema_ventas_online] SET  MULTI_USER 
GO
ALTER DATABASE [sistema_ventas_online] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sistema_ventas_online] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sistema_ventas_online] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sistema_ventas_online] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [sistema_ventas_online] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [sistema_ventas_online] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'sistema_ventas_online', N'ON'
GO
ALTER DATABASE [sistema_ventas_online] SET QUERY_STORE = ON
GO
ALTER DATABASE [sistema_ventas_online] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [sistema_ventas_online]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 18/05/2024 21:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[id_cliente] [int] NOT NULL,
	[tipo_documento] [varchar](20) NULL,
	[numero_documento] [varchar](20) NULL,
	[fecha_registro] [date] NULL,
	[direccion] [varchar](100) NULL,
	[telefono] [varchar](20) NULL,
	[contraseña] [varchar](100) NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalles_de_Pedido]    Script Date: 18/05/2024 21:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalles_de_Pedido](
	[id_detalle_pedido] [int] NOT NULL,
	[pedido_id] [int] NULL,
	[producto_id] [int] NULL,
	[cantidad] [int] NULL,
	[subtotal] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_detalle_pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 18/05/2024 21:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[id_empleado] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[correo] [varchar](100) NULL,
	[contraseña] [varchar](100) NULL,
	[documento] [varchar](20) NULL,
	[puesto_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado_Tarea]    Script Date: 18/05/2024 21:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado_Tarea](
	[id_empleado_tarea] [int] NOT NULL,
	[empleado_id] [int] NULL,
	[tarea_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_empleado_tarea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entidad_de_Transporte]    Script Date: 18/05/2024 21:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entidad_de_Transporte](
	[id_transporte] [int] NOT NULL,
	[nombre] [varchar](100) NULL,
	[correo] [varchar](100) NULL,
	[telefono] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_transporte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entidad_Financiera]    Script Date: 18/05/2024 21:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entidad_Financiera](
	[id_entidad_financiera] [int] NOT NULL,
	[codigo] [varchar](20) NULL,
	[nombre] [varchar](100) NULL,
	[correo] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_entidad_financiera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Envio]    Script Date: 18/05/2024 21:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Envio](
	[id_envio] [int] NOT NULL,
	[costo_envio] [decimal](10, 2) NULL,
	[tipo] [varchar](50) NULL,
	[fecha_envio] [date] NULL,
	[estado] [varchar](50) NULL,
	[pedido_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_envio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 18/05/2024 21:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[id_factura] [int] NOT NULL,
	[pago_id] [int] NULL,
	[fecha_vencimiento] [date] NULL,
	[fecha_emision] [date] NULL,
	[impuesto] [decimal](10, 2) NULL,
	[total] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 18/05/2024 21:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[id_inventario] [int] NOT NULL,
	[producto_id] [int] NULL,
	[disponibilidad] [int] NULL,
	[fecha_entrada] [date] NULL,
	[precio_adquisicion] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_inventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Metodo_de_Pago]    Script Date: 18/05/2024 21:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Metodo_de_Pago](
	[id_metodo_pago] [int] NOT NULL,
	[pago_id] [int] NULL,
	[nombre_titular] [varchar](100) NULL,
	[numero_referencia] [varchar](50) NULL,
	[codigo_seguridad] [varchar](10) NULL,
	[numero_tarjeta] [varchar](20) NULL,
	[fecha_vencimiento] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_metodo_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orden_de_Envio]    Script Date: 18/05/2024 21:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orden_de_Envio](
	[id_orden_envio] [int] NOT NULL,
	[envio_id] [int] NULL,
	[barrio] [varchar](100) NULL,
	[departamento] [varchar](100) NULL,
	[municipio] [varchar](100) NULL,
	[codigo_postal] [varchar](20) NULL,
	[tipo_direccion] [varchar](50) NULL,
	[piso] [varchar](20) NULL,
	[calle] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_orden_envio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pago]    Script Date: 18/05/2024 21:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pago](
	[id_pago] [int] NOT NULL,
	[estado] [varchar](50) NULL,
	[metodo_de_pago] [varchar](50) NULL,
	[fecha_pago] [date] NULL,
	[monto] [decimal](10, 2) NULL,
	[cliente_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 18/05/2024 21:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[id_pedido] [int] NOT NULL,
	[estado] [varchar](50) NULL,
	[fecha_creacion] [date] NULL,
	[fecha_envio] [date] NULL,
	[cliente_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 18/05/2024 21:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[id_producto] [int] NOT NULL,
	[categoria] [varchar](50) NULL,
	[nombre] [varchar](100) NULL,
	[descripcion] [text] NULL,
	[precio] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 18/05/2024 21:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[id_proveedor] [int] NOT NULL,
	[nombre] [varchar](100) NULL,
	[correo] [varchar](100) NULL,
	[telefono] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publicidad]    Script Date: 18/05/2024 21:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publicidad](
	[id_publicidad] [int] NOT NULL,
	[estado] [varchar](50) NULL,
	[tipo] [varchar](50) NULL,
	[empleado_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_publicidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Puesto]    Script Date: 18/05/2024 21:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Puesto](
	[id_puesto] [int] NOT NULL,
	[nombre_puesto] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_puesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tarea]    Script Date: 18/05/2024 21:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarea](
	[id_tarea] [int] NOT NULL,
	[nombre_tarea] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_tarea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Volante_de_Pago]    Script Date: 18/05/2024 21:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Volante_de_Pago](
	[id_volante_pago] [int] NOT NULL,
	[pago_id] [int] NULL,
	[fecha_emision] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_volante_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Detalles_de_Pedido]  WITH CHECK ADD FOREIGN KEY([pedido_id])
REFERENCES [dbo].[Pedido] ([id_pedido])
GO
ALTER TABLE [dbo].[Detalles_de_Pedido]  WITH CHECK ADD FOREIGN KEY([producto_id])
REFERENCES [dbo].[Producto] ([id_producto])
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD FOREIGN KEY([puesto_id])
REFERENCES [dbo].[Puesto] ([id_puesto])
GO
ALTER TABLE [dbo].[Empleado_Tarea]  WITH CHECK ADD FOREIGN KEY([empleado_id])
REFERENCES [dbo].[Empleado] ([id_empleado])
GO
ALTER TABLE [dbo].[Empleado_Tarea]  WITH CHECK ADD FOREIGN KEY([tarea_id])
REFERENCES [dbo].[Tarea] ([id_tarea])
GO
ALTER TABLE [dbo].[Envio]  WITH CHECK ADD FOREIGN KEY([pedido_id])
REFERENCES [dbo].[Pedido] ([id_pedido])
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD FOREIGN KEY([pago_id])
REFERENCES [dbo].[Pago] ([id_pago])
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD FOREIGN KEY([producto_id])
REFERENCES [dbo].[Producto] ([id_producto])
GO
ALTER TABLE [dbo].[Metodo_de_Pago]  WITH CHECK ADD FOREIGN KEY([pago_id])
REFERENCES [dbo].[Pago] ([id_pago])
GO
ALTER TABLE [dbo].[Orden_de_Envio]  WITH CHECK ADD FOREIGN KEY([envio_id])
REFERENCES [dbo].[Envio] ([id_envio])
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD FOREIGN KEY([cliente_id])
REFERENCES [dbo].[Cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD FOREIGN KEY([cliente_id])
REFERENCES [dbo].[Cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[Publicidad]  WITH CHECK ADD FOREIGN KEY([empleado_id])
REFERENCES [dbo].[Empleado] ([id_empleado])
GO
ALTER TABLE [dbo].[Volante_de_Pago]  WITH CHECK ADD FOREIGN KEY([pago_id])
REFERENCES [dbo].[Pago] ([id_pago])
GO
USE [master]
GO
ALTER DATABASE [sistema_ventas_online] SET  READ_WRITE 
GO
