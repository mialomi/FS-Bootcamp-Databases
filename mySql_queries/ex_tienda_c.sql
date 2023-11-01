USE tienda;
SELECT producto.nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre, precio €, ROUND(1.10 * precio) USD FROM producto;
SELECT nombre, precio AS euros, ROUND (1.10 * precio) AS dolars_americans FROM producto;
SELECT upper(nombre), precio FROM producto;
SELECT lower(nombre), precio FROM producto;
SELECT nombre, upper(substr(nombre, 1, 2)) FROM fabricante;
SELECT nombre, round(precio) FROM producto;
SELECT nombre, truncate(precio, 0) FROM producto;
SELECT codigo FROM fabricante WHERE codigo IN(SELECT codigo_fabricante FROM producto);
SELECT codigo FROM fabricante WHERE codigo IN(SELECT DISTINCT codigo_fabricante FROM producto);
SELECT nombre FROM fabricante order by nombre ASC;
SELECT nombre FROM fabricante order by nombre DESC;
SELECT nombre, precio FROM producto order by nombre ASC, precio DESC;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante LIMIT 4, 2;
SELECT nombre, precio FROM producto order by precio ASC LIMIT 1;
SELECT nombre, precio FROM producto order by precio DESC LIMIT 1;
SELECT codigo, nombre FROM fabricante WHERE codigo = 2;
SELECT fabricante.nombre, producto.nombre, producto.precio FROM producto INNER JOIN fabricante ON fabricante.codigo=producto.codigo_fabricante;
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo=producto.codigo_fabricante order by fabricante.nombre ASC;
SELECT producto.codigo, producto.nombre, fabricante.codigo, fabricante.nombre FROM producto JOIN fabricante;
SELECT nombre, precio, fabricante.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo=producto.codigo_fabricante order by precio LIMIT 1;
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo=producto.codigo_fabricante ORDER BY precio DESC LIMIT 1;
SELECT * FROM producto INNER JOIN fabricante ON fabricante.codigo=producto.codigo_fabricante WHERE fabricante.nombre='Lenovo';
SELECT * FROM producto INNER JOIN fabricante ON fabricante.codigo=producto.codigo_fabricante WHERE precio > 200 AND fabricante.nombre='Crucial';
SELECT * FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Seagate' OR fabricante.nombre = 'Hewlett-Packard';
SELECT * FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre IN ('Asus' , 'Hewlett-Packard', 'Seagate'); 
SELECT producto.nombre, producto.precio FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre LIKE '%e';
SELECT producto.nombre, producto.precio FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre LIKE '%w%';
SELECT producto.precio, producto.nombre, fabricante.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE precio >= 180 order by precio DESC, producto.nombre, fabricante.nombre;
SELECT fabricante.codigo, fabricante.nombre FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante;
SELECT * FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante;
SELECT * FROM fabricante WHERE NOT EXISTS (SELECT * FROM producto WHERE fabricante.codigo= producto.codigo_fabricante);
SELECT * FROM producto WHERE codigo_fabricante= (SELECT codigo FROM fabricante WHERE nombre='Lenovo');
SELECT * FROM producto WHERE precio = (SELECT MAX(producto.precio) FROM producto WHERE producto.codigo_fabricante = (SELECT codigo FROM fabricante WHERE fabricante.nombre = 'Lenovo'));
SELECT * FROM producto INNER JOIN fabricante ON fabricante.codigo=producto.codigo_fabricante WHERE fabricante.nombre='Lenovo' ORDER BY producto.precio DESC LIMIT 1;
SELECT * FROM producto INNER JOIN fabricante ON fabricante.codigo=producto.codigo_fabricante WHERE fabricante.nombre='Hewlett-Packard' LIMIT 1;
SELECT * FROM producto WHERE precio >=(SELECT MAX(producto.precio) FROM producto WHERE producto.codigo_fabricante=(SELECT codigo FROM fabricante WHERE fabricante.nombre= 'Lenovo'));
SELECT * FROM producto WHERE nombre = 'Asus' AND precio >(SELECT AVG(producto.precio) FROM producto WHERE producto.codigo_fabricante=(SELECT codigo FROM fabricante WHERE fabricante.nombre= 'Asus'));