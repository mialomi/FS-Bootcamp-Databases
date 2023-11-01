USE universidad;

SELECT apellido1, apellido2, nombre FROM persona WHERE tipo='alumno' ORDER BY apellido1, apellido2, nombre;
SELECT nombre, apellido1, apellido2 FROM persona WHERE telefono IS NULL AND tipo='alumno';
SELECT nombre, apellido1, apellido2, fecha_nacimiento FROM persona WHERE YEAR(fecha_nacimiento)=1999 AND tipo='alumno';
SELECT nombre, apellido1 FROM persona WHERE tipo='profesor' AND telefono IS NULL AND nif LIKE '%K';
SELECT nombre, curso, cuatrimestre, id_grado FROM asignatura WHERE curso=3 AND cuatrimestre=1 AND id_grado=7;
SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre FROM persona JOIN profesor ON persona.id = profesor.id_profesor JOIN departamento WHERE departamento.id = profesor.id_departamento ORDER BY persona.apellido1, persona.apellido2, persona.nombre;
SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin, persona.nif FROM asignatura JOIN alumno_se_matricula_asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura JOIN curso_escolar ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar JOIN persona ON persona.id = alumno_se_matricula_asignatura.id_alumno WHERE persona.nif = '26902806M';
SELECT DISTINCT departamento.nombre FROM departamento JOIN profesor ON departamento.id = profesor.id_departamento JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor JOIN grado ON asignatura.id_grado = grado.id WHERE grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
SELECT DISTINCT persona.apellido1, persona.apellido2, persona.nombre FROM persona JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id JOIN asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id WHERE curso_escolar.id = 5;

--
SELECT departamento.nombre, persona.id, persona.apellido1, persona.apellido2, persona.nombre, persona.tipo FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor left JOIN departamento ON departamento.id = profesor.id_departamento WHERE persona.tipo= 'profesor' ORDER BY departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre;
SELECT persona.apellido1, persona.apellido2, persona.nombre, persona.tipo FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor WHERE persona.tipo= 'profesor' AND profesor.id_departamento IS NULL;
SELECT departamento.nombre FROM departamento LEFT JOIN profesor ON profesor.id_departamento= departamento.id WHERE profesor.id_departamento IS NULL;
SELECT persona.apellido1, persona.nombre FROM persona JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE asignatura.id_profesor IS NULL;
SELECT asignatura.nombre FROM asignatura RIGHT JOIN profesor ON asignatura.id_profesor = profesor.id_profesor WHERE asignatura.id_profesor AND profesor.id_departamento IS NULL;
SELECT departamento.nombre, departamento.id
FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento WHERE profesor.id_departamento IS NULL;
--
SELECT COUNT(persona.id) AS total_alumnes FROM persona WHERE tipo = 'alumno';
SELECT COUNT(id) AS Nascuts_1999 FROM persona WHERE YEAR(fecha_nacimiento)=1999 AND tipo='alumno';
SELECT departamento.nombre, COUNT(id_profesor) AS total_professors FROM departamento RIGHT JOIN profesor ON profesor.id_departamento = departamento.id GROUP BY departamento.nombre ORDER BY total_professors DESC;
SELECT departamento.nombre, COUNT(id_profesor) AS total_professors FROM departamento LEFT JOIN profesor ON profesor.id_departamento = departamento.id GROUP BY departamento.nombre;
SELECT grado.nombre, COUNT(asignatura.id) AS total_assignatures FROM grado LEFT JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.nombre ORDER BY total_assignatures DESC;
SELECT grado.nombre, COUNT(asignatura.id) AS mes_de_40_assignatures FROM grado RIGHT JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.nombre HAVING COUNT(asignatura.id) > 40;
SELECT asignatura.id_grado, grado.id, grado.nombre, asignatura.tipo, SUM(asignatura.creditos) FROM grado LEFT JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY asignatura.tipo, grado.nombre;
SELECT curso_escolar.anyo_inicio, COUNT(id_alumno) FROM curso_escolar JOIN alumno_se_matricula_asignatura ON curso_escolar.id= alumno_se_matricula_asignatura.id_curso_escolar GROUP BY anyo_inicio;
SELECT persona.id, persona.nombre, persona.apellido1, persona.apellido2, COUNT(asignatura.id) FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE
persona.tipo = 'profesor' GROUP BY persona.nombre , persona.apellido1 , persona.apellido2 ORDER BY asignatura.id DESC;
SELECT * FROM persona WHERE persona.tipo= 'alumno' ORDER BY fecha_nacimiento DESC;
SELECT * FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE asignatura.id_profesor IS NULL AND persona.tipo = 'profesor';