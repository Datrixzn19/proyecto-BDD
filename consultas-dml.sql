--Mostrar las computadoras que están en uso junto con el cliente, su gama y el local
SELECT 
    comp.no_computadora,
    comp.estado,
    cli.nombres AS nombre_cliente,
    g.nombre AS gama,
    l.ciudad AS local
FROM Computadora comp
JOIN Gama g ON comp.id_gama = g.id_gama
JOIN Local l ON comp.id_local = l.id_local
LEFT JOIN Cliente cli ON comp.id_cliente = cli.id_cliente
WHERE comp.estado = 'en uso'
ORDER BY l.ciudad, g.nombre;


-- Mostar los productos mas vendidos 
SELECT 
    p.nombre AS producto,
    p.tipo,
    SUM(c.cantidad) AS total_vendido,
    ROUND(SUM(c.cantidad * p.precio), 2) AS total_generado
FROM Compra c
JOIN Producto p ON c.id_producto = p.id_producto
GROUP BY p.nombre, p.tipo
HAVING total_vendido > 0
ORDER BY total_vendido DESC
LIMIT 5;
