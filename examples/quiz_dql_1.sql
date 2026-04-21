-- QUIZ DQL - PREGUNTAS MULTIRESPUESTA TEÓRICAS COMPLETAS
-- Sistema de evaluación de conocimientos teóricos SQL DQL

-- ========================================
-- NIVEL BÁSICO (Preguntas 1-5)
-- ========================================

-- QUIZ 1: Conceptos básicos de SELECT
-- PREGUNTA: ¿Cuál es la sintaxis correcta para seleccionar todas las columnas de una tabla?
-- OPCIONES: A) SELECT all FROM tabla; B) SELECT * FROM tabla; C) SELECT columns FROM tabla; D) GET * FROM tabla;
-- RESPUESTA_CORRECTA: B
-- TEORIA: El asterisco (*) es el comodín estándar en SQL para seleccionar todas las columnas. Es la forma más común y portable.
-- FUENTES: https://www.w3schools.com/sql/sql_select.asp | https://dev.mysql.com/doc/refman/8.0/en/select.html

-- QUIZ 2: Cláusula WHERE
-- PREGUNTA: ¿Qué cláusula se usa para filtrar resultados en una consulta SQL?
-- OPCIONES: A) FILTER; B) WHERE; C) LIMIT; D) ORDER BY;
-- RESPUESTA_CORRECTA: B
-- TEORIA: WHERE es la cláusula estándar SQL para filtrar filas basadas en condiciones. Se aplica después de FROM y antes de GROUP BY.
-- FUENTES: https://www.w3schools.com/sql/sql_where.asp | https://dev.mysql.com/doc/refman/8.0/en/where-optimization.html

-- QUIZ 3: Ordenamiento
-- PREGUNTA: ¿Cómo se ordenan los resultados de mayor a menor en SQL?
-- OPCIONES: A) ORDER BY ASC; B) SORT BY DESC; C) ORDER BY DESC; D) ORDER DESC;
-- RESPUESTA_CORRECTA: C
-- TEORIA: ORDER BY con DESC ordena en orden descendente (mayor a menor). ASC es el valor por defecto para orden ascendente.
-- FUENTES: https://www.w3schools.com/sql/sql_orderby.asp | https://dev.mysql.com/doc/refman/8.0/en/sorting-rows.html

-- QUIZ 4: Limitar resultados
-- PREGUNTA: ¿Qué cláusula limita el número de filas devueltas en MySQL?
-- OPCIONES: A) TOP; B) LIMIT; C) FETCH; D) ROWS;
-- RESPUESTA_CORRECTA: B
-- TEORIA: LIMIT es la cláusula específica de MySQL y PostgreSQL para limitar resultados. TOP es SQL Server, FETCH es estándar SQL pero menos común.
-- FUENTES: https://www.w3schools.com/sql/sql_top.asp | https://dev.mysql.com/doc/refman/8.0/en/limit-optimization.html

-- QUIZ 5: Operadores de comparación
-- PREGUNTA: ¿Qué operador se usa para buscar valores en un rango?
-- OPCIONES: A) IN; B) LIKE; C) BETWEEN; D) RANGE;
-- RESPUESTA_CORRECTA: C
-- TEORIA: BETWEEN es el operador SQL estándar para rangos inclusivos. Es más eficiente y legible que usar >= AND <=.
-- FUENTES: https://www.w3schools.com/sql/sql_between.asp | https://dev.mysql.com/doc/refman/8.0/en/comparison-operators.html

-- ========================================
-- NIVEL INTERMEDIO (Preguntas 6-10)
-- ========================================

-- QUIZ 6: Funciones de agregación
-- PREGUNTA: ¿Qué función cuenta el número de filas en SQL?
-- OPCIONES: A) NUMBER(); B) TOTAL(); C) COUNT(); D) SUM();
-- RESPUESTA_CORRECTA: C
-- TEORIA: COUNT() es la función de agregación estándar SQL para contar filas. COUNT(*) cuenta todas las filas, COUNT(columna) ignora nulos.
-- FUENTES: https://www.w3schools.com/sql/sql_count_avg_sum.asp | https://dev.mysql.com/doc/refman/8.0/en/aggregate-functions.html

-- QUIZ 7: GROUP BY
-- PREGUNTA: ¿Cuál es el propósito de GROUP BY en SQL?
-- OPCIONES: A) Ordenar grupos; B) Agrupar filas para funciones de agregación; C) Filtrar grupos; D) Crear grupos;
-- RESPUESTA_CORRECTA: B
-- TEORIA: GROUP BY agrupa filas con valores idénticos para aplicar funciones de agregación como COUNT(), SUM(), AVG() a cada grupo.
-- FUENTES: https://www.w3schools.com/sql/sql_groupby.asp | https://dev.mysql.com/doc/refman/8.0/en/group-by-optimization.html

-- QUIZ 8: JOIN básico
-- PREGUNTA: ¿Qué tipo de JOIN devuelve solo las filas que coinciden en ambas tablas?
-- OPCIONES: A) LEFT JOIN; B) RIGHT JOIN; C) INNER JOIN; D) FULL JOIN;
-- RESPUESTA_CORRECTA: C
-- TEORIA: INNER JOIN devuelve solo las filas donde la condición ON se cumple en ambas tablas. Es el JOIN más común y eficiente.
-- FUENTES: https://www.w3schools.com/sql/sql_join.asp | https://dev.mysql.com/doc/refman/8.0/en/join.html

-- QUIZ 9: LIKE y comodines
-- PREGUNTA: ¿Qué comodín representa cualquier número de caracteres en LIKE?
-- OPCIONES: A) ?; B) *; C) %; D) #;
-- RESPUESTA_CORRECTA: C
-- TEORIA: % es el comodín SQL estándar para cero o más caracteres. _ representa un solo carácter. * no es válido en SQL estándar.
-- FUENTES: https://www.w3schools.com/sql/sql_like.asp | https://dev.mysql.com/doc/refman/8.0/en/string-comparison-functions.html

-- QUIZ 10: Alias en SQL
-- PREGUNTA: ¿Qué palabra clave se usa para crear un alias de columna?
-- OPCIONES: A) ALIAS; B) AS; C) NAME; D) COLUMN;
-- RESPUESTA_CORRECTA: B
-- TEORIA: AS es la palabra clave estándar SQL para crear alias de columnas y tablas. Aunque es opcional en algunos dialectos, es buena práctica usarlo.
-- FUENTES: https://www.w3schools.com/sql/sql_alias.asp | https://dev.mysql.com/doc/refman/8.0/en/problems-with-alias.html

-- ========================================
-- NIVEL AVANZADO (Preguntas 11-15)
-- ========================================

-- QUIZ 11: Subconsultas
-- PREGUNTA: ¿Dónde se puede colocar una subconsulta en SQL?
-- OPCIONES: A) Solo en SELECT; B) En SELECT, WHERE, FROM, HAVING; C) Solo en WHERE; D) Solo en FROM;
-- RESPUESTA_CORRECTA: B
-- TEORIA: Las subconsultas son muy flexibles en SQL. Pueden usarse en SELECT (columna derivada), WHERE (filtrado), FROM (tabla derivada) y HAVING (filtrado de grupos).
-- FUENTES: https://www.w3schools.com/sql/sql_subqueries.asp | https://dev.mysql.com/doc/refman/8.0/en/subqueries.html

-- QUIZ 12: HAVING vs WHERE
-- PREGUNTA: ¿Cuál es la diferencia principal entre HAVING y WHERE?
-- OPCIONES: A) HAVING filtra filas, WHERE filtra grupos; B) WHERE filtra filas, HAVING filtra grupos; C) Son iguales; D) HAVING es más rápido;
-- RESPUESTA_CORRECTA: B
-- TEORIA: WHERE filtra filas antes de agrupar, HAVING filtra grupos después de aplicar GROUP BY. HAVING puede usar funciones de agregación.
-- FUENTES: https://www.w3schools.com/sql/sql_having.asp | https://dev.mysql.com/doc/refman/8.0/en/group-by-extensions.html

-- QUIZ 13: CASE statement
-- PREGUNTA: ¿Qué estructura condicional se usa en SQL para crear lógica if-then-else?
-- OPCIONES: A) IF-THEN-ELSE; B) WHEN-THEN; C) CASE-WHEN; D) SWITCH;
-- RESPUESTA_CORRECTA: C
-- TEORIA: CASE WHEN THEN ELSE END es la estructura condicional estándar SQL. Permite crear lógica condicional directamente en consultas.
-- FUENTES: https://www.w3schools.com/sql/sql_case.asp | https://dev.mysql.com/doc/refman/8.0/en/case.html

-- QUIZ 14: LEFT JOIN
-- PREGUNTA: ¿Qué devuelve un LEFT JOIN?
-- OPCIONES: A) Solo coincidencias; B) Todas las filas de la tabla izquierda y coincidencias de la derecha; C) Todas las filas de ambas tablas; D) Solo no coincidencias;
-- RESPUESTA_CORRECTA: B
-- TEORIA: LEFT JOIN devuelve todas las filas de la tabla izquierda y las coincidencias de la derecha. Si no hay coincidencia, devuelve NULL en columnas derechas.
-- FUENTES: https://www.w3schools.com/sql/sql_join_left.asp | https://dev.mysql.com/doc/refman/8.0/en/left-join-optimization.html

-- QUIZ 15: Funciones de cadena
-- PREGUNTA: ¿Qué función convierte texto a mayúsculas en SQL?
-- OPCIONES: A) UPPERCASE(); B) TO_UPPER(); C) UPPER(); D) CAPITALIZE();
-- RESPUESTA_CORRECTA: C
-- TEORIA: UPPER() es la función SQL estándar para convertir texto a mayúsculas. LOWER() convierte a minúsculas.
-- FUENTES: https://www.w3schools.com/sql/sql_ref_string.asp | https://dev.mysql.com/doc/refman/8.0/en/string-functions.html

-- ========================================
-- NIVEL EXPERTO (Preguntas 16-20)
-- ========================================

-- QUIZ 16: UNION vs UNION ALL
-- PREGUNTA: ¿Cuál es la diferencia entre UNION y UNION ALL?
-- OPCIONES: A) UNION ALL es más rápido; B) UNION elimina duplicados, UNION ALL no; C) UNION incluye NULL, UNION ALL no; D) No hay diferencia;
-- RESPUESTA_CORRECTA: B
-- TEORIA: UNION elimina duplicados (requiere procesamiento extra), UNION ALL incluye todas las filas incluso duplicadas (más rápido).
-- FUENTES: https://www.w3schools.com/sql/sql_union.asp | https://dev.mysql.com/doc/refman/8.0/en/union.html

-- QUIZ 17: Window Functions
-- PREGUNTA: ¿Qué cláusula se usa con window functions para particionar datos?
-- OPCIONES: A) GROUP BY; B) PARTITION BY; C) WINDOW BY; D) SPLIT BY;
-- RESPUESTA_CORRECTA: B
-- TEORIA: PARTITION BY divide las filas en particiones para que las window functions operen sobre cada partición por separado, similar a GROUP BY pero sin filas agregadas.
-- FUENTES: https://www.postgresql.org/docs/current/tutorial-window.html | https://dev.mysql.com/doc/refman/8.0/en/window-functions.html

-- QUIZ 18: CTE (Common Table Expression)
-- PREGUNTA: ¿Con qué palabra clave comienza una CTE?
-- OPCIONES: A) WITH; B) CTE; C) TEMP; D) DEFINE;
-- RESPUESTA_CORRECTA: A
-- TEORIA: WITH inicia una CTE, permitiendo crear tablas temporales con nombre para consultas complejas. Mejora legibilidad y rendimiento.
-- FUENTES: https://www.w3schools.com/sql/sql_cte.asp | https://dev.mysql.com/doc/refman/8.0/en/with.html

-- QUIZ 19: NULL handling
-- PREGUNTA: ¿Cómo se verifican valores NULL en SQL?
-- OPCIONES: A) = NULL; B) IS NULL; C) == NULL; D) NULL();
-- RESPUESTA_CORRECTA: B
-- TEORIA: NULL es un valor especial que requiere IS NULL o IS NOT NULL. = NULL siempre devuelve falso porque NULL no es igual a nada, ni siquiera a sí mismo.
-- FUENTES: https://www.w3schools.com/sql/sql_isnull.asp | https://dev.mysql.com/doc/refman/8.0/en/working-with-null.html

-- QUIZ 20: Índices y rendimiento
-- PREGUNTA: ¿Qué tipo de JOIN generalmente tiene mejor rendimiento con índices adecuados?
-- OPCIONES: A) LEFT JOIN; B) RIGHT JOIN; C) INNER JOIN; D) Todos son iguales;
-- RESPUESTA_CORRECTA: C
-- TEORIA: INNER JOIN generalmente es más rápido porque el optimizador puede usar mejores estrategias de unión y solo necesita procesar coincidencias.
-- FUENTES: https://dev.mysql.com/doc/refman/8.0/en/join-optimization.html | https://www.postgresql.org/docs/current/join-optimization.html
