-- QUIZ DQL 2 - FUNDAMENTOS TEÓRICOS RELACIONADOS CON test_dql_2.sql
-- Quiz teórico complementario a las consultas prácticas de test_dql_2.sql

-- ========================================
-- NIVEL PRINCIPIANTE (Preguntas 1-5)
-- ========================================

-- QUIZ 1: Sintaxis básica
-- PREGUNTA: ¿Cuál es el orden correcto de las cláusulas en una consulta SQL?
-- OPCIONES: A) SELECT-FROM-WHERE-ORDER BY; B) FROM-SELECT-WHERE-ORDER BY; C) SELECT-WHERE-FROM-ORDER BY; D) WHERE-SELECT-FROM-ORDER BY;
-- RESPUESTA_CORRECTA: A
-- TEORIA: El orden lógico es: SELECT (qué columnas) → FROM (qué tabla) → WHERE (qué filas) → ORDER BY (cómo ordenar).
-- FUENTES: https://www.w3schools.com/sql/sql_syntax.asp | https://dev.mysql.com/doc/refman/8.0/en/select.html

-- QUIZ 2: Asterisco (*)
-- PREGUNTA: ¿Qué significa SELECT * FROM tabla?
-- OPCIONES: A) Seleccionar la primera columna; B) Seleccionar todas las columnas; C) Seleccionar columnas con valores; D) Seleccionar filas únicas;
-- RESPUESTA_CORRECTA: B
-- TEORIA: El asterisco (*) es el comodín estándar en SQL para seleccionar todas las columnas de una tabla.
-- FUENTES: https://www.w3schools.com/sql/sql_select.asp | https://dev.mysql.com/doc/refman/8.0/en/select.html

-- QUIZ 3: Operadores de comparación
-- PREGUNTA: ¿Cuál es la diferencia entre > y >=?
-- OPCIONES: A) No hay diferencia; B) > excluye el valor, >= incluye el valor; C) > incluye, >= excluye; D) > es para texto, >= para números;
-- RESPUESTA_CORRECTA: B
-- TEORIA: > es "mayor que" (excluye el valor), >= es "mayor o igual que" (incluye el valor).
-- FUENTES: https://www.w3schools.com/sql/sql_where.asp | https://dev.mysql.com/doc/refman/8.0/en/comparison-operators.html

-- QUIZ 4: ORDER BY ASC vs DESC
-- PREGUNTA: ¿Qué hace ORDER BY precio ASC?
-- OPCIONES: A) Ordena de mayor a menor; B) Ordena de menor a mayor; C) Ordena aleatoriamente; D) No ordena nada;
-- RESPUESTA_CORRECTA: B
-- TEORIA: ASC ordena en orden ascendente (menor a mayor). DESC ordena en orden descendente (mayor a menor).
-- FUENTES: https://www.w3schools.com/sql/sql_orderby.asp | https://dev.mysql.com/doc/refman/8.0/en/sorting-rows.html

-- QUIZ 5: LIMIT
-- PREGUNTA: ¿Qué hace LIMIT 5 en una consulta?
-- OPCIONES: A) Limita a 5 columnas; B) Limita a 5 filas; C) Limita a 5 caracteres; D) Limita a 5 tablas;
-- RESPUESTA_CORRECTA: B
-- TEORIA: LIMIT restringe el número de filas devueltas por la consulta.
-- FUENTES: https://www.w3schools.com/sql/sql_top.asp | https://dev.mysql.com/doc/refman/8.0/en/limit-optimization.html

-- ========================================
-- NIVEL INTERMEDIO (Preguntas 6-10)
-- ========================================

-- QUIZ 6: LIKE y comodines
-- PREGUNTA: ¿Qué significa '%ana%' en una condición LIKE?
-- OPCIONES: A) Exactamente "ana"; B) Empieza con "ana"; C) Termina con "ana"; D) Contiene "ana" en cualquier posición;
-- RESPUESTA_CORRECTA: D
-- TEORIA: % es un comodín que representa cualquier número de caracteres. %ana% encuentra "ana" en cualquier posición.
-- FUENTES: https://www.w3schools.com/sql/sql_like.asp | https://dev.mysql.com/doc/refman/8.0/en/string-comparison-functions.html

-- QUIZ 7: BETWEEN
-- PREGUNTA: ¿Qué incluye BETWEEN 50 AND 100?
-- OPCIONES: A) Solo 50 y 100; B) Valores entre 50 y 100, excluyendo extremos; C) Valores entre 50 y 100, incluyendo extremos; D) Solo valores mayores a 50;
-- RESPUESTA_CORRECTA: C
-- TEORIA: BETWEEN es inclusivo, incluye tanto el valor inicial como el final del rango.
-- FUENTES: https://www.w3schools.com/sql/sql_between.asp | https://dev.mysql.com/doc/refman/8.0/en/comparison-operators.html

-- QUIZ 8: IS NULL
-- PREGUNTA: ¿Por qué se usa IS NULL en lugar de = NULL?
-- OPCIONES: A) No hay diferencia; B) = NULL es más rápido; C) NULL no es igual a nada, ni a sí mismo; D) IS NULL es solo para texto;
-- RESPUESTA_CORRECTA: C
-- TEORIA: NULL es un valor especial que representa la ausencia de valor. No es igual a nada, ni siquiera a sí mismo.
-- FUENTES: https://www.w3schools.com/sql/sql_isnull.asp | https://dev.mysql.com/doc/refman/8.0/en/working-with-null.html

-- QUIZ 9: IN operator
-- PREGUNTA: ¿Cuándo es mejor usar IN en lugar de múltiples OR?
-- OPCIONES: A) Nunca; B) Siempre; C) Con listas largas de valores; D) Solo con números;
-- RESPUESTA_CORRECTA: C
-- TEORIA: IN es más legible y eficiente cuando se comparan contra múltiples valores específicos.
-- FUENTES: https://www.w3schools.com/sql/sql_in.asp | https://dev.mysql.com/doc/refman/8.0/en/comparison-operators.html

-- QUIZ 10: UPPER function
-- PREGUNTA: ¿Qué hace UPPER(nombre)?
-- OPCIONES: A) Convierte a mayúsculas; B) Convierte a minúsculas; C) Capitaliza primera letra; D) Invierte el texto;
-- RESPUESTA_CORRECTA: A
-- TEORIA: UPPER() convierte todo el texto a mayúsculas. LOWER() convierte a minúsculas.
-- FUENTES: https://www.w3schools.com/sql/func_mysql_upper.asp | https://dev.mysql.com/doc/refman/8.0/en/string-functions.html

-- ========================================
-- NIVEL AVANZADO (Preguntas 11-15)
-- ========================================

-- QUIZ 11: COUNT(*) vs COUNT(columna)
-- PREGUNTA: ¿Cuál es la diferencia entre COUNT(*) y COUNT(precio)?
-- OPCIONES: A) No hay diferencia; B) COUNT(*) cuenta todas las filas, COUNT(precio) ignora NULLs; C) COUNT(precio) es más rápido; D) COUNT(*) solo funciona con números;
-- RESPUESTA_CORRECTA: B
-- TEORIA: COUNT(*) cuenta todas las filas. COUNT(columna) solo cuenta filas donde esa columna no es NULL.
-- FUENTES: https://dev.mysql.com/doc/refman/8.0/en/aggregate-functions.html | https://www.postgresql.org/docs/current/functions-aggregate.html

-- QUIZ 12: Funciones de fecha
-- PREGUNTA: ¿Qué hace DATE_SUB(NOW(), INTERVAL 1 MONTH)?
-- OPCIONES: A) Suma un mes a la fecha actual; B) Resta un mes a la fecha actual; C) Formatea la fecha actual; D) Extrae el mes de la fecha actual;
-- RESPUESTA_CORRECTA: B
-- TEORIA: DATE_SUB() resta un intervalo de tiempo a una fecha. NOW() es la fecha y hora actual.
-- FUENTES: https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html | https://www.postgresql.org/docs/current/functions-datetime.html

-- QUIZ 13: CONCAT function
-- PREGUNTA: ¿Qué hace CONCAT(nombre, ' ')?
-- OPCIONES: A) Une nombre con un espacio; B) Separa nombre en palabras; C) Cuenta caracteres de nombre; D) Reemplaza espacios en nombre;
-- RESPUESTA_CORRECTA: A
-- TEORIA: CONCAT() une múltiples cadenas de texto en una sola.
-- FUENTES: https://www.w3schools.com/sql/func_mysql_concat.asp | https://dev.mysql.com/doc/refman/8.0/en/string-functions.html

-- QUIZ 14: ROUND function
-- PREGUNTA: ¿Qué hace ROUND(precio, 2)?
-- OPCIONES: A) Trunca a 2 decimales; B) Redondea matemáticamente a 2 decimales; C) Formatea con 2 decimales; D) Elimina decimales;
-- RESPUESTA_CORRECTA: B
-- TEORIA: ROUND() redondea usando reglas matemáticas estándar. 3.1416 → 3.14, 3.145 → 3.15.
-- FUENTES: https://dev.mysql.com/doc/refman/8.0/en/mathematical-functions.html | https://www.w3schools.com/sql/func_mysql_round.asp

-- QUIZ 15: Subquery con MAX()
-- PREGUNTA: ¿Cómo funciona SELECT * FROM productos WHERE precio = (SELECT MAX(precio) FROM productos)?
-- OPCIONES: A) Encuentra el precio máximo y luego filtra productos con ese precio; B) Compara cada producto con todos los demás; C) Ordena productos y toma el primero; D) No funciona, es sintaxis inválida;
-- RESPUESTA_CORRECTA: A
-- TEORIA: La subquery interna ejecuta primero, encuentra el precio máximo, luego la consulta externa usa ese valor para filtrar.
-- FUENTES: https://dev.mysql.com/doc/refman/8.0/en/subqueries.html | https://www.postgresql.org/docs/current/sql-select.html#SQL-LIMIT

-- ========================================
-- NIVEL EXPERTO (Preguntas 16-20)
-- ========================================

-- QUIZ 16: JOIN syntax
-- PREGUNTA: ¿Qué significa p JOIN c ON p.cliente_id = c.id?
-- OPCIONES: A) Une tablas p y c donde cliente_id coincida con id; B) Filtra filas donde los valores sean diferentes; C) Crea una nueva tabla combinada; D) Ordena las tablas por id;
-- RESPUESTA_CORRECTA: A
-- TEORIA: JOIN combina filas de dos tablas donde la condición ON se cumple. p y c son alias de tablas.
-- FUENTES: https://www.w3schools.com/sql/sql_join.asp | https://dev.mysql.com/doc/refman/8.0/en/join.html

-- QUIZ 17: GROUP BY
-- PREGUNTA: ¿Qué hace GROUP BY cliente_id?
-- OPCIONES: A) Ordena por cliente_id; B) Agrupa filas con el mismo cliente_id; C) Filtra por cliente_id; D) Cuenta clientes únicos;
-- RESPUESTA_CORRECTA: B
-- TEORIA: GROUP BY agrupa filas con valores idénticos para que las funciones de agregación operen sobre cada grupo.
-- FUENTES: https://www.w3schools.com/sql/sql_groupby.asp | https://dev.mysql.com/doc/refman/8.0/en/group-by-optimization.html

-- QUIZ 18: HAVING vs WHERE
-- PREGUNTA: ¿Cuándo usar HAVING en lugar de WHERE?
-- OPCIONES: A) Siempre que haya GROUP BY; B) Cuando necesites filtrar resultados de funciones de agregación; C) Para filtrar antes de agrupar; D) HAVING es más rápido;
-- RESPUESTA_CORRECTA: B
-- TEORIA: HAVING filtra grupos después de GROUP BY. WHERE filtra filas antes de agrupar. Solo HAVING puede usar funciones de agregación.
-- FUENTES: https://www.w3schools.com/sql/sql_having.asp | https://dev.mysql.com/doc/refman/8.0/en/group-by-extensions.html

-- QUIZ 19: LEFT JOIN
-- PREGUNTA: ¿Qué devuelve LEFT JOIN cuando no hay coincidencias?
-- OPCIONES: A) No devuelve nada; B) Devuelve NULL en columnas de la tabla derecha; C) Devuelve solo filas de la tabla izquierda; D) Devuelve un error;
-- RESPUESTA_CORRECTA: B
-- TEORIA: LEFT JOIN devuelve todas las filas de la tabla izquierda. Si no hay coincidencia, las columnas de la derecha son NULL.
-- FUENTES: https://www.w3schools.com/sql/sql_join_left.asp | https://dev.mysql.com/doc/refman/8.0/en/left-join-optimization.html

-- QUIZ 20: Múltiples agregaciones
-- PREGUNTA: ¿Puedes usar SUM() y AVG() en la misma consulta con GROUP BY?
-- OPCIONES: A) No, solo una función de agregación por consulta; B) Sí, puedes usar múltiples funciones de agregación; C) Solo si son del mismo tipo; D) Solo con COUNT();
-- RESPUESTA_CORRECTA: B
-- TEORIA: Puedes usar múltiples funciones de agregación (SUM, AVG, COUNT, MIN, MAX) en la misma consulta.
-- FUENTES: https://dev.mysql.com/doc/refman/8.0/en/aggregate-functions.html | https://www.postgresql.org/docs/current/tutorial-agg.html
