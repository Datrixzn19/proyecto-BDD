 --             CODIGO PARA LA VISTA IMPLEMENTADA EN LA BDD
CREATE VIEW VentasPorCliente AS
SELECT 
    c.id_cliente,
    c.nombres AS nombre_cliente,
    c.correo,
    COUNT(comp.id_compra) AS numero_compras,
    SUM(comp.cantidad * p.precio) AS total_gastado,
    MAX(comp.fecha) AS ultima_compra
FROM 
    Cliente c
LEFT JOIN 
    Compra comp ON c.id_cliente = comp.id_cliente
LEFT JOIN 
    Producto p ON comp.id_producto = p.id_producto
GROUP BY 
    c.id_cliente, c.nombres, c.correo
ORDER BY 
    total_gastado DESC;
