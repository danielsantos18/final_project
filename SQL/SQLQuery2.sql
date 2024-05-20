use sistema_ventas_online
SELECT * FROM Vista_ProductosConCategoria;

use sistema_ventas_online
SELECT * FROM Tarea;

USE sistema_ventas_online
SELECT * FROM Categoria;


use sistema_ventas_online;
SELECT * FROM Vista_Empleados_Con_Tareas;

use sistema_ventas_online;
SELECT * FROM Detalles_de_Pedido;

use sistema_ventas_online;
SELECT * FROM empleado;

use sistema_ventas_online
SELECT * FROM Cliente;

use sistema_ventas_online
SELECT * FROM Inventario;

use sistema_ventas_online
SELECT * FROM Producto;

use sistema_ventas_online
SELECT * FROM Pedido;

use sistema_ventas_online
SELECT * FROM Detalles_de_Pedido;

use sistema_ventas_online
SELECT * FROM Vista_Pedido_Cliente WHERE nombre_cliente = 'María' AND apellido_cliente = 'García';

use sistema_ventas_online
SELECT * FROM Vista_Pedido_Cliente_id;

SELECT *
FROM sys.views;

use sistema_ventas_online
SELECT * FROM Vista_Inventario_Proveedor;

use sistema_ventas_online
SELECT * FROM Orden_de_Envio;

use sistema_ventas_online
SELECT * FROM Envio;

use sistema_ventas_online
SELECT * FROM Entidad_de_Transporte;

use sistema_ventas_online
SELECT * FROM Vista_Entidad_Pedido;

use sistema_ventas_online
SELECT * FROM Pago;

use sistema_ventas_online
SELECT * FROM Vista_Pagos_Pedido;

use sistema_ventas_online
SELECT * FROM Metodo_de_Pago;

use sistema_ventas_online
SELECT * FROM Factura;

use sistema_ventas_online
SELECT * FROM Volante_de_Pago;

use sistema_ventas_online
EXEC sp_help;




