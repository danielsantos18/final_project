USE [master]
GO
/****** Object:  Database [sistema_ventas_online]    Script Date: 20/05/2024 12:25:37 ******/
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
/****** Object:  Table [dbo].[Categoria]    Script Date: 20/05/2024 12:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[id_categoria] [int] NOT NULL,
	[nombre_categoria] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto_Categoria]    Script Date: 20/05/2024 12:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto_Categoria](
	[id_producto_categoria] [int] NOT NULL,
	[producto_id] [int] NULL,
	[categoria_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_producto_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 20/05/2024 12:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[id_producto] [int] NOT NULL,
	[nombre] [varchar](100) NULL,
	[descripcion] [text] NULL,
	[precio] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[Vista_ProductosConCategoria]    Script Date: 20/05/2024 12:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[Vista_ProductosConCategoria] AS
SELECT 
    p.id_producto, 
    c.nombre_categoria AS categoria, 
    p.nombre, 
    p.descripcion, 
    p.precio 
FROM 
    Producto p
JOIN 
    Producto_Categoria pc ON p.id_producto = pc.producto_id
JOIN 
    Categoria c ON pc.categoria_id = c.id_categoria;
GO
/****** Object:  Table [dbo].[Puesto]    Script Date: 20/05/2024 12:25:37 ******/
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
/****** Object:  Table [dbo].[Empleado]    Script Date: 20/05/2024 12:25:37 ******/
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
/****** Object:  Table [dbo].[Tarea]    Script Date: 20/05/2024 12:25:37 ******/
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
/****** Object:  Table [dbo].[Empleado_Tarea]    Script Date: 20/05/2024 12:25:37 ******/
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
/****** Object:  View [dbo].[Vista_Empleados_Con_Tareas]    Script Date: 20/05/2024 12:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[Vista_Empleados_Con_Tareas] AS
SELECT 
    e.id_empleado,
    e.nombre AS nombre_empleado,
    e.apellido AS apellido_empleado,
    p.nombre_puesto AS puesto,
    t.nombre_tarea AS tarea_asignada
FROM 
    Empleado e
JOIN 
    Puesto p ON e.puesto_id = p.id_puesto
LEFT JOIN 
    Empleado_Tarea et ON e.id_empleado = et.empleado_id
LEFT JOIN 
    Tarea t ON et.tarea_id = t.id_tarea;
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 20/05/2024 12:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[id_cliente] [int] NOT NULL,
	[tipo_documento] [varchar](30) NULL,
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
/****** Object:  Table [dbo].[Pedido]    Script Date: 20/05/2024 12:25:37 ******/
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
	[total] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalles_de_Pedido]    Script Date: 20/05/2024 12:25:37 ******/
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
/****** Object:  View [dbo].[Vista_Pedido_Cliente]    Script Date: 20/05/2024 12:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[Vista_Pedido_Cliente] AS
SELECT 
    c.nombre AS nombre_cliente,
    c.apellido AS apellido_cliente,
    p.nombre AS nombre_producto,
    d.cantidad,
    d.subtotal AS subtotal_pedido,
    pd.estado AS estado_pedido
FROM 
    Pedido pd
JOIN 
    Cliente c ON pd.cliente_id = c.id_cliente
JOIN 
    Detalles_de_Pedido d ON pd.id_pedido = d.pedido_id
JOIN 
    Producto p ON d.producto_id = p.id_producto;
GO
/****** Object:  View [dbo].[Vista_Pedido_Cliente_id]    Script Date: 20/05/2024 12:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[Vista_Pedido_Cliente_id] AS
SELECT 
    pd.id_pedido,
    c.nombre AS nombre_cliente,
    c.apellido AS apellido_cliente,
    p.nombre AS nombre_producto,
    d.cantidad,
    d.subtotal AS subtotal_pedido,
    pd.estado AS estado_pedido
FROM 
    Pedido pd
JOIN 
    Cliente c ON pd.cliente_id = c.id_cliente
JOIN 
    Detalles_de_Pedido d ON pd.id_pedido = d.pedido_id
JOIN 
    Producto p ON d.producto_id = p.id_producto;
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 20/05/2024 12:25:37 ******/
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
	[precio_venta] [decimal](10, 2) NULL,
	[id_proveedor] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_inventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 20/05/2024 12:25:37 ******/
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
/****** Object:  View [dbo].[Vista_Inventario_Proveedor]    Script Date: 20/05/2024 12:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[Vista_Inventario_Proveedor] AS
SELECT 
    I.id_inventario,
    P.nombre AS nombre_producto,
    PR.nombre AS nombre_proveedor,
    I.precio_adquisicion,
    I.precio_venta,
    I.disponibilidad
FROM 
    Inventario I
JOIN 
    Producto P ON I.producto_id = P.id_producto
JOIN 
    Proveedor PR ON I.id_proveedor = PR.id_proveedor;
GO
/****** Object:  Table [dbo].[Envio]    Script Date: 20/05/2024 12:25:37 ******/
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
	[id_entidad_transporte] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_envio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entidad_de_Transporte]    Script Date: 20/05/2024 12:25:37 ******/
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
/****** Object:  View [dbo].[Vista_Entidad_Pedido]    Script Date: 20/05/2024 12:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[Vista_Entidad_Pedido] AS
SELECT 
    ET.id_transporte AS id_entidad_transporte,
    ET.nombre AS nombre_entidad_transporte,
    E.id_envio,
    E.costo_envio,
    E.tipo AS tipo_envio,
    E.fecha_envio,
    E.estado AS estado_envio,
    P.id_pedido,
    P.estado AS estado_pedido
FROM 
    Entidad_de_Transporte ET
JOIN 
    Envio E ON ET.id_transporte = E.id_entidad_transporte
JOIN 
    Pedido P ON E.pedido_id = P.id_pedido;
GO
/****** Object:  Table [dbo].[Pago]    Script Date: 20/05/2024 12:25:37 ******/
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
	[pedido_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Vista_Pagos_Por_Pedido]    Script Date: 20/05/2024 12:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[Vista_Pagos_Por_Pedido] AS
SELECT pedido_id AS id_pedido,
       COUNT(id_pago) AS cantidad_pagos,
       SUM(monto) AS total_pagado
FROM Pago
GROUP BY pedido_id;
GO
/****** Object:  View [dbo].[Vista_Pagos_Pedido]    Script Date: 20/05/2024 12:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[Vista_Pagos_Pedido] AS
SELECT p.id_pedido,
       COUNT(pg.id_pago) AS cantidad_pagos,
       SUM(pg.monto) AS total_pagado,
       MAX(p.estado) AS estado_pedido,
       MAX(pg.metodo_de_pago) AS metodo_de_pago
FROM Pedido p
LEFT JOIN Pago pg ON p.id_pedido = pg.pedido_id
GROUP BY p.id_pedido;
GO
/****** Object:  Table [dbo].[Entidad_Financiera]    Script Date: 20/05/2024 12:25:37 ******/
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
/****** Object:  Table [dbo].[Factura]    Script Date: 20/05/2024 12:25:37 ******/
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
	[costo_envio] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Metodo_de_Pago]    Script Date: 20/05/2024 12:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Metodo_de_Pago](
	[id_metodo_pago] [int] NOT NULL,
	[pago_id] [int] NULL,
	[nombre_titular] [varchar](100) NULL,
	[numero_referencia] [varchar](50) NULL,
	[codigo_seguridad] [varchar](20) NULL,
	[numero_tarjeta] [varchar](20) NULL,
	[fecha_vencimiento] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_metodo_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orden_de_Envio]    Script Date: 20/05/2024 12:25:37 ******/
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
/****** Object:  Table [dbo].[Publicidad]    Script Date: 20/05/2024 12:25:37 ******/
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
/****** Object:  Table [dbo].[Volante_de_Pago]    Script Date: 20/05/2024 12:25:37 ******/
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
INSERT [dbo].[Categoria] ([id_categoria], [nombre_categoria]) VALUES (1, N'Ropa Mujer')
INSERT [dbo].[Categoria] ([id_categoria], [nombre_categoria]) VALUES (2, N'Ropa Hombre')
INSERT [dbo].[Categoria] ([id_categoria], [nombre_categoria]) VALUES (3, N'Ropa Niño')
INSERT [dbo].[Categoria] ([id_categoria], [nombre_categoria]) VALUES (4, N'Ropa Niña')
INSERT [dbo].[Categoria] ([id_categoria], [nombre_categoria]) VALUES (5, N'Ropa Bebé')
INSERT [dbo].[Categoria] ([id_categoria], [nombre_categoria]) VALUES (6, N'Ropa Adolescente')
GO
INSERT [dbo].[Cliente] ([id_cliente], [tipo_documento], [numero_documento], [fecha_registro], [direccion], [telefono], [contraseña], [nombre], [apellido]) VALUES (1, N'Cédula de Ciudadanía', N'123456789', CAST(N'2023-05-10' AS Date), N'Calle 45 #12-34, Barranquilla', N'3001234567', N'clave123', N'María', N'García')
INSERT [dbo].[Cliente] ([id_cliente], [tipo_documento], [numero_documento], [fecha_registro], [direccion], [telefono], [contraseña], [nombre], [apellido]) VALUES (2, N'Cédula de Ciudadanía', N'987654321', CAST(N'2023-05-12' AS Date), N'Avenida 10 #5-67, Cartagena', N'3109876543', N'segura456', N'Juan', N'Pérez')
INSERT [dbo].[Cliente] ([id_cliente], [tipo_documento], [numero_documento], [fecha_registro], [direccion], [telefono], [contraseña], [nombre], [apellido]) VALUES (3, N'Tarjeta de Identidad', N'456789012', CAST(N'2023-05-15' AS Date), N'Carrera 20 #8-90, Santa Marta', N'3204567890', N'contraseña789', N'Andrés', N'Díaz')
INSERT [dbo].[Cliente] ([id_cliente], [tipo_documento], [numero_documento], [fecha_registro], [direccion], [telefono], [contraseña], [nombre], [apellido]) VALUES (7, N'Cédula de Ciudadanía', N'753951852', CAST(N'2023-06-01' AS Date), N'Calle 50 #20-30, Barranquilla', N'3027539518', N'clave321', N'Camila', N'Morales')
INSERT [dbo].[Cliente] ([id_cliente], [tipo_documento], [numero_documento], [fecha_registro], [direccion], [telefono], [contraseña], [nombre], [apellido]) VALUES (8, N'Cédula de Ciudadanía', N'951357258', CAST(N'2023-06-05' AS Date), N'Avenida 7 #8-25, Cartagena', N'3129513572', N'segura123', N'Luis', N'Torres')
INSERT [dbo].[Cliente] ([id_cliente], [tipo_documento], [numero_documento], [fecha_registro], [direccion], [telefono], [contraseña], [nombre], [apellido]) VALUES (9, N'Tarjeta de Identidad', N'852963741', CAST(N'2023-06-10' AS Date), N'Carrera 25 #5-35, Santa Marta', N'3228529637', N'contraseñaxyz', N'Sara', N'Ramírez')
GO
INSERT [dbo].[Detalles_de_Pedido] ([id_detalle_pedido], [pedido_id], [producto_id], [cantidad], [subtotal]) VALUES (1, 1, 5, 2, CAST(170000.00 AS Decimal(10, 2)))
INSERT [dbo].[Detalles_de_Pedido] ([id_detalle_pedido], [pedido_id], [producto_id], [cantidad], [subtotal]) VALUES (2, 1, 6, 1, CAST(120000.00 AS Decimal(10, 2)))
INSERT [dbo].[Detalles_de_Pedido] ([id_detalle_pedido], [pedido_id], [producto_id], [cantidad], [subtotal]) VALUES (3, 2, 8, 1, CAST(145000.00 AS Decimal(10, 2)))
INSERT [dbo].[Detalles_de_Pedido] ([id_detalle_pedido], [pedido_id], [producto_id], [cantidad], [subtotal]) VALUES (4, 3, 10, 2, CAST(210000.00 AS Decimal(10, 2)))
INSERT [dbo].[Detalles_de_Pedido] ([id_detalle_pedido], [pedido_id], [producto_id], [cantidad], [subtotal]) VALUES (5, 4, 26, 1, CAST(85000.00 AS Decimal(10, 2)))
INSERT [dbo].[Detalles_de_Pedido] ([id_detalle_pedido], [pedido_id], [producto_id], [cantidad], [subtotal]) VALUES (6, 5, 27, 3, CAST(195000.00 AS Decimal(10, 2)))
INSERT [dbo].[Detalles_de_Pedido] ([id_detalle_pedido], [pedido_id], [producto_id], [cantidad], [subtotal]) VALUES (7, 6, 22, 1, CAST(125000.00 AS Decimal(10, 2)))
INSERT [dbo].[Detalles_de_Pedido] ([id_detalle_pedido], [pedido_id], [producto_id], [cantidad], [subtotal]) VALUES (8, 6, 24, 2, CAST(110000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Empleado] ([id_empleado], [nombre], [apellido], [correo], [contraseña], [documento], [puesto_id]) VALUES (1, N'xiomara', N'zabala', N'xiomara_admin@gmail.com', N'contraseña123', N'123456789', 1)
INSERT [dbo].[Empleado] ([id_empleado], [nombre], [apellido], [correo], [contraseña], [documento], [puesto_id]) VALUES (2, N'María', N'López', N'maria_contador@gmail.com', N'contraseña456', N'987654321', 2)
INSERT [dbo].[Empleado] ([id_empleado], [nombre], [apellido], [correo], [contraseña], [documento], [puesto_id]) VALUES (3, N'Juan', N'Martínez', N'juan_publicista@hotmail.com', N'contraseña789', N'654321987', 3)
INSERT [dbo].[Empleado] ([id_empleado], [nombre], [apellido], [correo], [contraseña], [documento], [puesto_id]) VALUES (4, N'Ana', N'García', N'ana_asesor@gmail.com', N'contraseñaabc', N'456789012', 4)
GO
INSERT [dbo].[Empleado_Tarea] ([id_empleado_tarea], [empleado_id], [tarea_id]) VALUES (1, 1, 1)
INSERT [dbo].[Empleado_Tarea] ([id_empleado_tarea], [empleado_id], [tarea_id]) VALUES (2, 2, 2)
INSERT [dbo].[Empleado_Tarea] ([id_empleado_tarea], [empleado_id], [tarea_id]) VALUES (3, 3, 3)
INSERT [dbo].[Empleado_Tarea] ([id_empleado_tarea], [empleado_id], [tarea_id]) VALUES (4, 4, 4)
GO
INSERT [dbo].[Entidad_de_Transporte] ([id_transporte], [nombre], [correo], [telefono]) VALUES (1, N'Transportes Rápidos S.A.', N'info@transportesrapidos.com', N'1234567890')
INSERT [dbo].[Entidad_de_Transporte] ([id_transporte], [nombre], [correo], [telefono]) VALUES (2, N'Envíos Seguros Ltda.', N'contacto@enviosseguros.com', N'0987654321')
INSERT [dbo].[Entidad_de_Transporte] ([id_transporte], [nombre], [correo], [telefono]) VALUES (3, N'Transporte Expreso S.A.S.', N'ventas@transporteexpreso.com', N'5678901234')
GO
INSERT [dbo].[Entidad_Financiera] ([id_entidad_financiera], [codigo], [nombre], [correo]) VALUES (1, N'001', N'Banco Nacional', N'info@banconacional.com')
INSERT [dbo].[Entidad_Financiera] ([id_entidad_financiera], [codigo], [nombre], [correo]) VALUES (2, N'002', N'Banco Internacional', N'info@bancointernacional.com')
INSERT [dbo].[Entidad_Financiera] ([id_entidad_financiera], [codigo], [nombre], [correo]) VALUES (3, N'003', N'Caja de Ahorros', N'info@cajadeahorros.com')
GO
INSERT [dbo].[Envio] ([id_envio], [costo_envio], [tipo], [fecha_envio], [estado], [pedido_id], [id_entidad_transporte]) VALUES (1, CAST(15000.00 AS Decimal(10, 2)), N'Express', CAST(N'2024-05-05' AS Date), N'En camino', 1, 1)
INSERT [dbo].[Envio] ([id_envio], [costo_envio], [tipo], [fecha_envio], [estado], [pedido_id], [id_entidad_transporte]) VALUES (2, CAST(10000.00 AS Decimal(10, 2)), N'Estándar', CAST(N'2024-05-06' AS Date), N'Enviado', 2, 2)
INSERT [dbo].[Envio] ([id_envio], [costo_envio], [tipo], [fecha_envio], [estado], [pedido_id], [id_entidad_transporte]) VALUES (3, CAST(20000.00 AS Decimal(10, 2)), N'Express', CAST(N'2024-05-07' AS Date), N'Entregado', 3, 3)
INSERT [dbo].[Envio] ([id_envio], [costo_envio], [tipo], [fecha_envio], [estado], [pedido_id], [id_entidad_transporte]) VALUES (4, CAST(12000.00 AS Decimal(10, 2)), N'Estándar', CAST(N'2024-05-08' AS Date), N'En camino', 4, 1)
INSERT [dbo].[Envio] ([id_envio], [costo_envio], [tipo], [fecha_envio], [estado], [pedido_id], [id_entidad_transporte]) VALUES (5, CAST(13000.00 AS Decimal(10, 2)), N'Express', CAST(N'2024-05-09' AS Date), N'En camino', 5, 2)
INSERT [dbo].[Envio] ([id_envio], [costo_envio], [tipo], [fecha_envio], [estado], [pedido_id], [id_entidad_transporte]) VALUES (6, CAST(11000.00 AS Decimal(10, 2)), N'Estándar', CAST(N'2024-05-10' AS Date), N'En proceso', 6, 3)
GO
INSERT [dbo].[Factura] ([id_factura], [pago_id], [fecha_vencimiento], [fecha_emision], [impuesto], [total], [costo_envio]) VALUES (1, 1, CAST(N'2024-05-26' AS Date), CAST(N'2024-05-19' AS Date), CAST(55100.00 AS Decimal(10, 2)), CAST(360100.00 AS Decimal(10, 2)), CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Factura] ([id_factura], [pago_id], [fecha_vencimiento], [fecha_emision], [impuesto], [total], [costo_envio]) VALUES (2, 2, CAST(N'2024-05-26' AS Date), CAST(N'2024-05-19' AS Date), CAST(27550.00 AS Decimal(10, 2)), CAST(182550.00 AS Decimal(10, 2)), CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Factura] ([id_factura], [pago_id], [fecha_vencimiento], [fecha_emision], [impuesto], [total], [costo_envio]) VALUES (3, 3, CAST(N'2024-05-26' AS Date), CAST(N'2024-05-19' AS Date), CAST(39900.00 AS Decimal(10, 2)), CAST(269900.00 AS Decimal(10, 2)), CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Factura] ([id_factura], [pago_id], [fecha_vencimiento], [fecha_emision], [impuesto], [total], [costo_envio]) VALUES (4, 4, CAST(N'2024-05-26' AS Date), CAST(N'2024-05-19' AS Date), CAST(16150.00 AS Decimal(10, 2)), CAST(113150.00 AS Decimal(10, 2)), CAST(12000.00 AS Decimal(10, 2)))
INSERT [dbo].[Factura] ([id_factura], [pago_id], [fecha_vencimiento], [fecha_emision], [impuesto], [total], [costo_envio]) VALUES (5, 5, CAST(N'2024-05-26' AS Date), CAST(N'2024-05-19' AS Date), CAST(37050.00 AS Decimal(10, 2)), CAST(245050.00 AS Decimal(10, 2)), CAST(13000.00 AS Decimal(10, 2)))
INSERT [dbo].[Factura] ([id_factura], [pago_id], [fecha_vencimiento], [fecha_emision], [impuesto], [total], [costo_envio]) VALUES (6, 6, CAST(N'2024-05-26' AS Date), CAST(N'2024-05-19' AS Date), CAST(44650.00 AS Decimal(10, 2)), CAST(290650.00 AS Decimal(10, 2)), CAST(11000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Inventario] ([id_inventario], [producto_id], [disponibilidad], [fecha_entrada], [precio_adquisicion], [precio_venta], [id_proveedor]) VALUES (1, 5, 20, CAST(N'2024-05-01' AS Date), CAST(75000.00 AS Decimal(10, 2)), CAST(85000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Inventario] ([id_inventario], [producto_id], [disponibilidad], [fecha_entrada], [precio_adquisicion], [precio_venta], [id_proveedor]) VALUES (2, 6, 15, CAST(N'2024-05-02' AS Date), CAST(100000.00 AS Decimal(10, 2)), CAST(120000.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[Inventario] ([id_inventario], [producto_id], [disponibilidad], [fecha_entrada], [precio_adquisicion], [precio_venta], [id_proveedor]) VALUES (3, 8, 30, CAST(N'2024-05-03' AS Date), CAST(130000.00 AS Decimal(10, 2)), CAST(145000.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[Inventario] ([id_inventario], [producto_id], [disponibilidad], [fecha_entrada], [precio_adquisicion], [precio_venta], [id_proveedor]) VALUES (4, 10, 25, CAST(N'2024-05-04' AS Date), CAST(95000.00 AS Decimal(10, 2)), CAST(105000.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[Inventario] ([id_inventario], [producto_id], [disponibilidad], [fecha_entrada], [precio_adquisicion], [precio_venta], [id_proveedor]) VALUES (5, 26, 20, CAST(N'2024-05-05' AS Date), CAST(75000.00 AS Decimal(10, 2)), CAST(85000.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[Inventario] ([id_inventario], [producto_id], [disponibilidad], [fecha_entrada], [precio_adquisicion], [precio_venta], [id_proveedor]) VALUES (6, 27, 35, CAST(N'2024-05-06' AS Date), CAST(60000.00 AS Decimal(10, 2)), CAST(65000.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[Inventario] ([id_inventario], [producto_id], [disponibilidad], [fecha_entrada], [precio_adquisicion], [precio_venta], [id_proveedor]) VALUES (7, 22, 10, CAST(N'2024-05-07' AS Date), CAST(115000.00 AS Decimal(10, 2)), CAST(125000.00 AS Decimal(10, 2)), 3)
INSERT [dbo].[Inventario] ([id_inventario], [producto_id], [disponibilidad], [fecha_entrada], [precio_adquisicion], [precio_venta], [id_proveedor]) VALUES (8, 24, 15, CAST(N'2024-05-08' AS Date), CAST(50000.00 AS Decimal(10, 2)), CAST(55000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Inventario] ([id_inventario], [producto_id], [disponibilidad], [fecha_entrada], [precio_adquisicion], [precio_venta], [id_proveedor]) VALUES (9, 7, 25, CAST(N'2024-05-09' AS Date), CAST(65000.00 AS Decimal(10, 2)), CAST(75000.00 AS Decimal(10, 2)), 3)
INSERT [dbo].[Inventario] ([id_inventario], [producto_id], [disponibilidad], [fecha_entrada], [precio_adquisicion], [precio_venta], [id_proveedor]) VALUES (10, 11, 20, CAST(N'2024-05-10' AS Date), CAST(70000.00 AS Decimal(10, 2)), CAST(75000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Inventario] ([id_inventario], [producto_id], [disponibilidad], [fecha_entrada], [precio_adquisicion], [precio_venta], [id_proveedor]) VALUES (11, 12, 30, CAST(N'2024-05-11' AS Date), CAST(30000.00 AS Decimal(10, 2)), CAST(35000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Inventario] ([id_inventario], [producto_id], [disponibilidad], [fecha_entrada], [precio_adquisicion], [precio_venta], [id_proveedor]) VALUES (12, 23, 25, CAST(N'2024-05-12' AS Date), CAST(90000.00 AS Decimal(10, 2)), CAST(99000.00 AS Decimal(10, 2)), 3)
INSERT [dbo].[Inventario] ([id_inventario], [producto_id], [disponibilidad], [fecha_entrada], [precio_adquisicion], [precio_venta], [id_proveedor]) VALUES (13, 25, 15, CAST(N'2024-05-13' AS Date), CAST(40000.00 AS Decimal(10, 2)), CAST(45000.00 AS Decimal(10, 2)), 3)
INSERT [dbo].[Inventario] ([id_inventario], [producto_id], [disponibilidad], [fecha_entrada], [precio_adquisicion], [precio_venta], [id_proveedor]) VALUES (14, 9, 20, CAST(N'2024-05-14' AS Date), CAST(90000.00 AS Decimal(10, 2)), CAST(95000.00 AS Decimal(10, 2)), 2)
GO
INSERT [dbo].[Metodo_de_Pago] ([id_metodo_pago], [pago_id], [nombre_titular], [numero_referencia], [codigo_seguridad], [numero_tarjeta], [fecha_vencimiento]) VALUES (1, 1, N'María García', N'REF123456', N'1234', N'1234567890123456', CAST(N'2025-05-31' AS Date))
INSERT [dbo].[Metodo_de_Pago] ([id_metodo_pago], [pago_id], [nombre_titular], [numero_referencia], [codigo_seguridad], [numero_tarjeta], [fecha_vencimiento]) VALUES (2, 2, N'Juan Pérez', N'REF987654', N'5678', N'9876543210987654', CAST(N'2025-06-30' AS Date))
INSERT [dbo].[Metodo_de_Pago] ([id_metodo_pago], [pago_id], [nombre_titular], [numero_referencia], [codigo_seguridad], [numero_tarjeta], [fecha_vencimiento]) VALUES (3, 3, N'Andrés Díaz', N'REF456789', N'9012', N'4567890123456789', CAST(N'2025-07-31' AS Date))
INSERT [dbo].[Metodo_de_Pago] ([id_metodo_pago], [pago_id], [nombre_titular], [numero_referencia], [codigo_seguridad], [numero_tarjeta], [fecha_vencimiento]) VALUES (4, 4, N'Camila Morales', N'REF753951', N'3456', N'7539518527539518', CAST(N'2025-08-31' AS Date))
INSERT [dbo].[Metodo_de_Pago] ([id_metodo_pago], [pago_id], [nombre_titular], [numero_referencia], [codigo_seguridad], [numero_tarjeta], [fecha_vencimiento]) VALUES (5, 5, N'Luis Torres', N'REF951357', N'7890', N'9513572589513572', CAST(N'2025-09-30' AS Date))
INSERT [dbo].[Metodo_de_Pago] ([id_metodo_pago], [pago_id], [nombre_titular], [numero_referencia], [codigo_seguridad], [numero_tarjeta], [fecha_vencimiento]) VALUES (6, 6, N'Sara Ramírez', N'REF852963', N'2345', N'8529637418529637', CAST(N'2025-10-31' AS Date))
GO
INSERT [dbo].[Orden_de_Envio] ([id_orden_envio], [envio_id], [barrio], [departamento], [municipio], [codigo_postal], [tipo_direccion], [piso], [calle]) VALUES (1, 1, N'Centro', N'Atlántico', N'Barranquilla', N'080001', N'Casa', NULL, N'Calle 45 #12-34')
INSERT [dbo].[Orden_de_Envio] ([id_orden_envio], [envio_id], [barrio], [departamento], [municipio], [codigo_postal], [tipo_direccion], [piso], [calle]) VALUES (2, 2, N'Residencial', N'Bolívar', N'Cartagena', N'130001', N'Apartamento', N'4', N'Avenida 10 #5-67')
INSERT [dbo].[Orden_de_Envio] ([id_orden_envio], [envio_id], [barrio], [departamento], [municipio], [codigo_postal], [tipo_direccion], [piso], [calle]) VALUES (3, 3, N'Playa', N'Magdalena', N'Santa Marta', N'470001', N'Casa', NULL, N'Carrera 20 #8-90')
INSERT [dbo].[Orden_de_Envio] ([id_orden_envio], [envio_id], [barrio], [departamento], [municipio], [codigo_postal], [tipo_direccion], [piso], [calle]) VALUES (4, 4, N'Comercial', N'Atlántico', N'Barranquilla', N'080002', N'Oficina', N'10', N'Calle 50 #20-30')
INSERT [dbo].[Orden_de_Envio] ([id_orden_envio], [envio_id], [barrio], [departamento], [municipio], [codigo_postal], [tipo_direccion], [piso], [calle]) VALUES (5, 5, N'Residencial', N'Bolívar', N'Cartagena', N'130002', N'Casa', NULL, N'Avenida 7 #8-25')
INSERT [dbo].[Orden_de_Envio] ([id_orden_envio], [envio_id], [barrio], [departamento], [municipio], [codigo_postal], [tipo_direccion], [piso], [calle]) VALUES (6, 6, N'Residencial', N'Magdalena', N'Santa Marta', N'470002', N'Apartamento', N'3', N'Carrera 25 #5-35')
GO
INSERT [dbo].[Pago] ([id_pago], [estado], [metodo_de_pago], [fecha_pago], [monto], [pedido_id]) VALUES (1, N'Procesando', N'Tarjeta de crédito', CAST(N'2024-05-05' AS Date), CAST(360100.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Pago] ([id_pago], [estado], [metodo_de_pago], [fecha_pago], [monto], [pedido_id]) VALUES (2, N'Enviado', N'Transferencia bancaria', CAST(N'2024-06-05' AS Date), CAST(182550.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[Pago] ([id_pago], [estado], [metodo_de_pago], [fecha_pago], [monto], [pedido_id]) VALUES (3, N'Entregado', N'PSE', CAST(N'2024-07-05' AS Date), CAST(269900.00 AS Decimal(10, 2)), 3)
INSERT [dbo].[Pago] ([id_pago], [estado], [metodo_de_pago], [fecha_pago], [monto], [pedido_id]) VALUES (4, N'En Proceso', N'Tarjeta de débito', CAST(N'2024-05-19' AS Date), CAST(113150.00 AS Decimal(10, 2)), 4)
INSERT [dbo].[Pago] ([id_pago], [estado], [metodo_de_pago], [fecha_pago], [monto], [pedido_id]) VALUES (5, N'En Proceso', N'PayPal', CAST(N'2024-05-19' AS Date), CAST(245050.00 AS Decimal(10, 2)), 5)
INSERT [dbo].[Pago] ([id_pago], [estado], [metodo_de_pago], [fecha_pago], [monto], [pedido_id]) VALUES (6, N'Pendiente', N'PSE', CAST(N'2024-05-19' AS Date), CAST(290650.00 AS Decimal(10, 2)), 6)
GO
INSERT [dbo].[Pedido] ([id_pedido], [estado], [fecha_creacion], [fecha_envio], [cliente_id], [total]) VALUES (1, N'Procesando', CAST(N'2024-05-01' AS Date), CAST(N'2024-05-05' AS Date), 1, CAST(290000.00 AS Decimal(10, 2)))
INSERT [dbo].[Pedido] ([id_pedido], [estado], [fecha_creacion], [fecha_envio], [cliente_id], [total]) VALUES (2, N'Enviado', CAST(N'2024-05-02' AS Date), CAST(N'2024-05-06' AS Date), 2, CAST(145000.00 AS Decimal(10, 2)))
INSERT [dbo].[Pedido] ([id_pedido], [estado], [fecha_creacion], [fecha_envio], [cliente_id], [total]) VALUES (3, N'Entregado', CAST(N'2024-05-03' AS Date), CAST(N'2024-05-07' AS Date), 3, CAST(210000.00 AS Decimal(10, 2)))
INSERT [dbo].[Pedido] ([id_pedido], [estado], [fecha_creacion], [fecha_envio], [cliente_id], [total]) VALUES (4, N'En Proceso', CAST(N'2024-05-04' AS Date), NULL, 7, CAST(85000.00 AS Decimal(10, 2)))
INSERT [dbo].[Pedido] ([id_pedido], [estado], [fecha_creacion], [fecha_envio], [cliente_id], [total]) VALUES (5, N'En Proceso', CAST(N'2024-05-05' AS Date), NULL, 8, CAST(195000.00 AS Decimal(10, 2)))
INSERT [dbo].[Pedido] ([id_pedido], [estado], [fecha_creacion], [fecha_envio], [cliente_id], [total]) VALUES (6, N'Pendiente', CAST(N'2024-05-06' AS Date), NULL, 9, CAST(235000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Producto] ([id_producto], [nombre], [descripcion], [precio]) VALUES (5, N'Suéter tejido de lana', N'Suéter unisex de lana suave y cálida, disponible en varios colores.', CAST(85000.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([id_producto], [nombre], [descripcion], [precio]) VALUES (6, N'Pantalón vaquero ajustado', N'Pantalón vaquero para hombre o mujer, estilo ajustado y moderno.', CAST(120000.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([id_producto], [nombre], [descripcion], [precio]) VALUES (7, N'Camisa de manga larga', N'Camisa de algodón con diseño a rayas y botones en contraste.', CAST(75000.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([id_producto], [nombre], [descripcion], [precio]) VALUES (8, N'Vestido floral estampado', N'Vestido femenino con estampado floral y corte acinturado.', CAST(145000.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([id_producto], [nombre], [descripcion], [precio]) VALUES (9, N'Falda plisada de moda', N'Falda corta plisada de tela ligera, perfecta para ocasiones casuales.', CAST(95000.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([id_producto], [nombre], [descripcion], [precio]) VALUES (10, N'Blusa elegante con lazo', N'Blusa femenina con lazo en el cuello y detalles en encaje.', CAST(105000.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([id_producto], [nombre], [descripcion], [precio]) VALUES (11, N'Conjunto de sudadera y pantalón para niño', N'Conjunto cómodo de sudadera con capucha y pantalón deportivo para niños.', CAST(75000.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([id_producto], [nombre], [descripcion], [precio]) VALUES (12, N'Camiseta estampada para niño', N'Camiseta de algodón con divertido estampado para niños de todas las edades.', CAST(35000.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([id_producto], [nombre], [descripcion], [precio]) VALUES (22, N'Vestido de princesa para niñas', N'Vestido elegante de princesa con falda de tul y detalles de encaje, ideal para ocasiones especiales.', CAST(125000.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([id_producto], [nombre], [descripcion], [precio]) VALUES (23, N'Conjunto de blusa y falda para niñas', N'Conjunto de blusa con estampado floral y falda plisada, perfecto para un look femenino.', CAST(99000.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([id_producto], [nombre], [descripcion], [precio]) VALUES (24, N'Conjunto de body y pantalón para bebé', N'Conjunto adorable de body manga larga y pantalón con estampado de animalitos.', CAST(55000.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([id_producto], [nombre], [descripcion], [precio]) VALUES (25, N'Mameluco de algodón para recién nacido', N'Mameluco suave y cómodo para bebés recién nacidos, con cierre frontal y estampado divertido.', CAST(45000.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([id_producto], [nombre], [descripcion], [precio]) VALUES (26, N'Jeans skinny rasgados para adolescentes', N'Jeans ajustados para adolescentes con efecto desgastado y detalles rasgados.', CAST(85000.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([id_producto], [nombre], [descripcion], [precio]) VALUES (27, N'Sudadera con capucha estilo urbano para adolescentes', N'Sudadera de estilo urbano con capucha y bolsillo canguro, ideal para el día a día.', CAST(65000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Producto_Categoria] ([id_producto_categoria], [producto_id], [categoria_id]) VALUES (1, 5, 1)
INSERT [dbo].[Producto_Categoria] ([id_producto_categoria], [producto_id], [categoria_id]) VALUES (2, 8, 1)
INSERT [dbo].[Producto_Categoria] ([id_producto_categoria], [producto_id], [categoria_id]) VALUES (3, 10, 1)
INSERT [dbo].[Producto_Categoria] ([id_producto_categoria], [producto_id], [categoria_id]) VALUES (4, 6, 2)
INSERT [dbo].[Producto_Categoria] ([id_producto_categoria], [producto_id], [categoria_id]) VALUES (5, 7, 2)
INSERT [dbo].[Producto_Categoria] ([id_producto_categoria], [producto_id], [categoria_id]) VALUES (6, 11, 3)
INSERT [dbo].[Producto_Categoria] ([id_producto_categoria], [producto_id], [categoria_id]) VALUES (7, 12, 3)
INSERT [dbo].[Producto_Categoria] ([id_producto_categoria], [producto_id], [categoria_id]) VALUES (8, 22, 4)
INSERT [dbo].[Producto_Categoria] ([id_producto_categoria], [producto_id], [categoria_id]) VALUES (9, 23, 4)
INSERT [dbo].[Producto_Categoria] ([id_producto_categoria], [producto_id], [categoria_id]) VALUES (10, 24, 5)
INSERT [dbo].[Producto_Categoria] ([id_producto_categoria], [producto_id], [categoria_id]) VALUES (11, 25, 5)
INSERT [dbo].[Producto_Categoria] ([id_producto_categoria], [producto_id], [categoria_id]) VALUES (12, 26, 6)
INSERT [dbo].[Producto_Categoria] ([id_producto_categoria], [producto_id], [categoria_id]) VALUES (13, 27, 6)
GO
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre], [correo], [telefono]) VALUES (1, N'Textiles S.A.', N'textiles@email.com', N'1234567890')
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre], [correo], [telefono]) VALUES (2, N'Moda y Estilo', N'moda_estilo@email.com', N'9876543210')
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre], [correo], [telefono]) VALUES (3, N'Telas del Caribe', N'telas_caribe@email.com', N'5678901234')
GO
INSERT [dbo].[Publicidad] ([id_publicidad], [estado], [tipo], [empleado_id]) VALUES (1, N'Activa', N'Redes Sociales', 3)
GO
INSERT [dbo].[Puesto] ([id_puesto], [nombre_puesto]) VALUES (1, N'administrador')
INSERT [dbo].[Puesto] ([id_puesto], [nombre_puesto]) VALUES (2, N'contador')
INSERT [dbo].[Puesto] ([id_puesto], [nombre_puesto]) VALUES (3, N'publicista')
INSERT [dbo].[Puesto] ([id_puesto], [nombre_puesto]) VALUES (4, N'asesor')
GO
INSERT [dbo].[Tarea] ([id_tarea], [nombre_tarea]) VALUES (1, N'Gestionar inventario')
INSERT [dbo].[Tarea] ([id_tarea], [nombre_tarea]) VALUES (2, N'Preparar informes financieros')
INSERT [dbo].[Tarea] ([id_tarea], [nombre_tarea]) VALUES (3, N'Diseñar campañas publicitarias')
INSERT [dbo].[Tarea] ([id_tarea], [nombre_tarea]) VALUES (4, N'Atender clientes')
GO
INSERT [dbo].[Volante_de_Pago] ([id_volante_pago], [pago_id], [fecha_emision]) VALUES (1, 1, CAST(N'2024-05-05' AS Date))
INSERT [dbo].[Volante_de_Pago] ([id_volante_pago], [pago_id], [fecha_emision]) VALUES (2, 2, CAST(N'2024-06-05' AS Date))
INSERT [dbo].[Volante_de_Pago] ([id_volante_pago], [pago_id], [fecha_emision]) VALUES (3, 3, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[Volante_de_Pago] ([id_volante_pago], [pago_id], [fecha_emision]) VALUES (4, 4, CAST(N'2024-05-19' AS Date))
INSERT [dbo].[Volante_de_Pago] ([id_volante_pago], [pago_id], [fecha_emision]) VALUES (5, 5, CAST(N'2024-05-19' AS Date))
INSERT [dbo].[Volante_de_Pago] ([id_volante_pago], [pago_id], [fecha_emision]) VALUES (6, 6, CAST(N'2024-05-19' AS Date))
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
ALTER TABLE [dbo].[Envio]  WITH CHECK ADD FOREIGN KEY([id_entidad_transporte])
REFERENCES [dbo].[Entidad_de_Transporte] ([id_transporte])
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
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD  CONSTRAINT [fk_proveedor] FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[Proveedor] ([id_proveedor])
GO
ALTER TABLE [dbo].[Inventario] CHECK CONSTRAINT [fk_proveedor]
GO
ALTER TABLE [dbo].[Metodo_de_Pago]  WITH CHECK ADD FOREIGN KEY([pago_id])
REFERENCES [dbo].[Pago] ([id_pago])
GO
ALTER TABLE [dbo].[Orden_de_Envio]  WITH CHECK ADD FOREIGN KEY([envio_id])
REFERENCES [dbo].[Envio] ([id_envio])
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [FK_Pago_Pedido] FOREIGN KEY([pedido_id])
REFERENCES [dbo].[Pedido] ([id_pedido])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [FK_Pago_Pedido]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD FOREIGN KEY([cliente_id])
REFERENCES [dbo].[Cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[Producto_Categoria]  WITH CHECK ADD FOREIGN KEY([categoria_id])
REFERENCES [dbo].[Categoria] ([id_categoria])
GO
ALTER TABLE [dbo].[Producto_Categoria]  WITH CHECK ADD FOREIGN KEY([producto_id])
REFERENCES [dbo].[Producto] ([id_producto])
GO
ALTER TABLE [dbo].[Publicidad]  WITH CHECK ADD FOREIGN KEY([empleado_id])
REFERENCES [dbo].[Empleado] ([id_empleado])
GO
ALTER TABLE [dbo].[Volante_de_Pago]  WITH CHECK ADD FOREIGN KEY([pago_id])
REFERENCES [dbo].[Pago] ([id_pago])
GO
/****** Object:  StoredProcedure [dbo].[ActualizarEmpleado]    Script Date: 20/05/2024 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

-- Stored Procedure para actualizar la información de un empleado
CREATE PROCEDURE [dbo].[ActualizarEmpleado] 
    @id_empleado INT,
    @nombre VARCHAR(50),
    @apellido VARCHAR(50),
    @correo VARCHAR(100),
    @contraseña VARCHAR(100),
    @documento VARCHAR(20),
    @puesto_id INT
AS
BEGIN
    UPDATE Empleado 
    SET nombre = @nombre, apellido = @apellido, correo = @correo, contraseña = @contraseña, documento = @documento, puesto_id = @puesto_id
    WHERE id_empleado = @id_empleado
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarEmpleadoTarea]    Script Date: 20/05/2024 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[ActualizarEmpleadoTarea]
    @id_empleado_tarea INT,
    @empleado_id INT,
    @tarea_id INT
AS
BEGIN
    UPDATE Empleado_Tarea 
    SET empleado_id = @empleado_id, tarea_id = @tarea_id 
    WHERE id_empleado_tarea = @id_empleado_tarea;
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarPuesto]    Script Date: 20/05/2024 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[ActualizarPuesto]
    @id_puesto INT,
    @nombre_puesto VARCHAR(50)
AS
BEGIN
    UPDATE Puesto SET nombre_puesto = @nombre_puesto WHERE id_puesto = @id_puesto;
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarTarea]    Script Date: 20/05/2024 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[ActualizarTarea]
    @id_tarea INT,
    @nombre_tarea VARCHAR(50)
AS
BEGIN
    UPDATE Tarea SET nombre_tarea = @nombre_tarea WHERE id_tarea = @id_tarea;
END
GO
/****** Object:  StoredProcedure [dbo].[CrearEmpleado]    Script Date: 20/05/2024 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Stored Procedure para crear un nuevo empleado
CREATE PROCEDURE [dbo].[CrearEmpleado] 
    @nombre VARCHAR(50),
    @apellido VARCHAR(50),
    @correo VARCHAR(100),
    @contraseña VARCHAR(100),
    @documento VARCHAR(20),
    @puesto_id INT
AS
BEGIN
    INSERT INTO Empleado (nombre, apellido, correo, contraseña, documento, puesto_id)
    VALUES (@nombre, @apellido, @correo, @contraseña, @documento, @puesto_id)
END
GO
/****** Object:  StoredProcedure [dbo].[CrearEmpleadoTarea]    Script Date: 20/05/2024 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[CrearEmpleadoTarea]
    @empleado_id INT,
    @tarea_id INT
AS
BEGIN
    INSERT INTO Empleado_Tarea (empleado_id, tarea_id) VALUES (@empleado_id, @tarea_id);
END
GO
/****** Object:  StoredProcedure [dbo].[CrearPuesto]    Script Date: 20/05/2024 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[CrearPuesto]
    @nombre_puesto VARCHAR(50)
AS
BEGIN
    INSERT INTO Puesto (nombre_puesto) VALUES (@nombre_puesto);
END
GO
/****** Object:  StoredProcedure [dbo].[CrearTarea]    Script Date: 20/05/2024 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[CrearTarea]
    @nombre_tarea VARCHAR(50)
AS
BEGIN
    INSERT INTO Tarea (nombre_tarea) VALUES (@nombre_tarea);
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarEmpleado]    Script Date: 20/05/2024 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

-- Stored Procedure para eliminar un empleado por su ID
CREATE PROCEDURE [dbo].[EliminarEmpleado] 
    @id_empleado INT
AS
BEGIN
    DELETE FROM Empleado WHERE id_empleado = @id_empleado
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarEmpleadoTarea]    Script Date: 20/05/2024 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[EliminarEmpleadoTarea]
    @id_empleado_tarea INT
AS
BEGIN
    DELETE FROM Empleado_Tarea WHERE id_empleado_tarea = @id_empleado_tarea;
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarPuesto]    Script Date: 20/05/2024 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[EliminarPuesto]
    @id_puesto INT
AS
BEGIN
    DELETE FROM Puesto WHERE id_puesto = @id_puesto;
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarTarea]    Script Date: 20/05/2024 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[EliminarTarea]
    @id_tarea INT
AS
BEGIN
    DELETE FROM Tarea WHERE id_tarea = @id_tarea;
END
GO
/****** Object:  StoredProcedure [dbo].[LeerEmpleadoPorID]    Script Date: 20/05/2024 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

-- Stored Procedure para leer información de un empleado por su ID
CREATE PROCEDURE [dbo].[LeerEmpleadoPorID] 
    @id_empleado INT
AS
BEGIN
    SELECT * FROM Empleado WHERE id_empleado = @id_empleado
END
GO
/****** Object:  StoredProcedure [dbo].[LeerEmpleadoTareaPorID]    Script Date: 20/05/2024 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LeerEmpleadoTareaPorID]
    @id_empleado_tarea INT
AS
BEGIN
    SELECT * FROM Empleado_Tarea WHERE id_empleado_tarea = @id_empleado_tarea;
END
GO
/****** Object:  StoredProcedure [dbo].[LeerPuestoPorID]    Script Date: 20/05/2024 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LeerPuestoPorID]
    @id_puesto INT
AS
BEGIN
    SELECT * FROM Puesto WHERE id_puesto = @id_puesto;
END
GO
/****** Object:  StoredProcedure [dbo].[LeerTareaPorID]    Script Date: 20/05/2024 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LeerTareaPorID]
    @id_tarea INT
AS
BEGIN
    SELECT * FROM Tarea WHERE id_tarea = @id_tarea;
END
GO
/****** Object:  StoredProcedure [dbo].[ListarEmpleados]    Script Date: 20/05/2024 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

-- Stored Procedure para listar todos los empleados
CREATE PROCEDURE [dbo].[ListarEmpleados] 
AS
BEGIN
    SELECT * FROM Empleado
END
GO
/****** Object:  StoredProcedure [dbo].[ListarEmpleadoTareas]    Script Date: 20/05/2024 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[ListarEmpleadoTareas]
AS
BEGIN
    SELECT * FROM Empleado_Tarea;
END
GO
/****** Object:  StoredProcedure [dbo].[ListarPuestos]    Script Date: 20/05/2024 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[ListarPuestos]
AS
BEGIN
    SELECT * FROM Puesto;
END
GO
/****** Object:  StoredProcedure [dbo].[ListarTareas]    Script Date: 20/05/2024 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[ListarTareas]
AS
BEGIN
    SELECT * FROM Tarea;
END
GO
USE [master]
GO
ALTER DATABASE [sistema_ventas_online] SET  READ_WRITE 
GO
