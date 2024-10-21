Analisis Descriptivo
--Tabla Completa
select*from ObesityDataSet

Distribución de Género y Proporción:
--Número de participantes por género
select	count(*) AS Cantidad, 
		Genero,
		(COUNT(*) * 1.0 / (SELECT COUNT(*) FROM ObesityDataSet)) AS Proporcion --cant. entre el total
FROM ObesityDataSet
GROUP BY Genero

Distribución de Edad:
	Media, mediana, moda de la edad y dispersión (desviación estándar, rango).
	Distribución de la edad por grupos etarios,un histograma (por ejemplo, adolescentes, adultos jóvenes, adultos, adultos mayores).
	
--Media(Edad)
SELECT AVG(Edad) as Promedio
FROM ObesityDataSet
	
--Moda(Edad)
SELECT	TOP(1) Edad,
	count(*) as Frecuencia
FROM	ObesityDataSet
Group By Edad
Order By Edad Desc
	
--Mediana(Edad)
WITH EdadOrdenada AS (--Simulación de vista
    SELECT 
        Edad,
        ROW_NUMBER() OVER (ORDER BY Edad) AS RowAsc,
        ROW_NUMBER() OVER (ORDER BY Edad DESC) AS RowDesc
    FROM 
        ObesityDataSet
),
MedianCalculation AS (
    SELECT Edad
    FROM   EdadOrdenada
    WHERE  RowAsc = RowDesc
    OR     RowAsc + 1 = RowDesc
    OR     RowAsc = RowDesc + 1
)

SELECT 
    AVG(Edad) AS MedianaEdad
FROM 
    MedianCalculation;
/*
RowAsc = RowDesc: Esta condición de igualdad selecciona el valor del medio cuando el número de registros es impar. 
	Por ejemplo, si hay 5 registros, el tercer registro (el del medio) tendrá RowAsc = 3 y RowDesc = 3.
RowAsc + 1 = RowDesc: Esta condición selecciona los dos valores del medio cuando el número de registros es par. 
	Por ejemplo, si hay 4 registros, los dos valores del medio tendrán RowAsc = 2 y RowDesc = 3.
RowAsc = RowDesc + 1: Esta condición también selecciona los dos valores del medio cuando el número de registros es par. 
	Es una forma redundante de cubrir el caso par.*/

--Desviación estandar de Edad por cada grupo de Género:
SELECT*FROM ObesityDataSet
SELECT Genero, STDEV(Edad) AS [Desv. Estandar Edad]
from ObesityDataSet
Group by Genero;

--Desviación estandar de Altura por cada grupo Género:
SELECT	Genero,STDEV(Altura) AS [Desv. Estandar Altura]
FROM	ObesityDataSet
Group By Genero;

--Desviacion estandar de Peso por grupo Género:
SELECT Genero, STDEV(Peso) AS [Desv. Estandar Peso]
FROM ObesityDataSet
GROUP BY Genero;

--Distribucion de Edad por Grupo Etareo:
select*from ObesityDataSet
SELECT 
    CASE 
        WHEN FLOOR(Edad) BETWEEN 0 AND 5 THEN 'Primera Infancia (0-5 años)'
        WHEN FLOOR(Edad) BETWEEN 6 AND 11 THEN 'Infancia (6-11 años)'
        WHEN FLOOR(Edad) BETWEEN 12 AND 18 THEN 'Adolescencia (12-18 años)'
        WHEN FLOOR(Edad) BETWEEN 14 AND 26 THEN 'Juventud (14-26 años)'
        WHEN FLOOR(Edad) BETWEEN 27 AND 59 THEN 'Adultez (27-59 años)'
        WHEN FLOOR(Edad) >= 60 THEN 'Persona Mayor (60 años o más)'
    END AS GrupoEtareo,
    COUNT(*) AS Cantidad
FROM 
    ObesityDataSet
GROUP BY 
    CASE 
        WHEN FLOOR(Edad) BETWEEN 0 AND 5 THEN 'Primera Infancia (0-5 años)'
        WHEN FLOOR(Edad) BETWEEN 6 AND 11 THEN 'Infancia (6-11 años)'
        WHEN FLOOR(Edad) BETWEEN 12 AND 18 THEN 'Adolescencia (12-18 años)'
        WHEN FLOOR(Edad) BETWEEN 14 AND 26 THEN 'Juventud (14-26 años)'
        WHEN FLOOR(Edad) BETWEEN 27 AND 59 THEN 'Adultez (27-59 años)'
        WHEN FLOOR(Edad) >= 60 THEN 'Persona Mayor (60 años o más)'
    END;

/*
Distribución de Edad:
	Media, mediana, moda de la edad y dispersión (desviación estándar, rango).
	Distribución de la edad por grupos etarios,un histograma (por ejemplo, adolescentes, adultos jóvenes, adultos, adultos mayores).
Altura y Peso:
	Calcular la media, mediana y desviación estándar de la altura y el peso.
	Generar gráficos de dispersión para visualizar la relación entre altura y peso.
Índice de Masa Corporal (IMC):
	Calcular el IMC para cada participante utilizando la fórmula: IMC = Peso (kg) / (Altura (m))^2.
	Clasificar a los participantes en categorías de IMC (Bajo Peso, Normal, Sobrepeso, Obesidad I, Obesidad II, Obesidad III).*/
-- Cálculo del IMC
SELECT 
    Genero,
    Edad,
    Altura,
    Peso,
    (Peso / (Altura * Altura)) AS IMC,
    CASE 
        WHEN (Peso / (Altura * Altura)) < 18.5 THEN 'Bajo Peso'
        WHEN (Peso / (Altura * Altura)) BETWEEN 18.5 AND 24.9 THEN 'Peso Normal'
        WHEN (Peso / (Altura * Altura)) BETWEEN 25 AND 29.9 THEN 'Sobrepeso'
        WHEN (Peso / (Altura * Altura)) BETWEEN 30 AND 34.9 THEN 'Obesidad I'
        WHEN (Peso / (Altura * Altura)) BETWEEN 35 AND 39.9 THEN 'Obesidad II'
        ELSE 'Obesidad III'
    END AS CategoriaIMC
FROM ObesityDataSet;





