/*Análisis Descriptivo

Distribución de Edad:
	Media, mediana, moda de la edad y dispersión (desviación estándar, rango).
	Distribución de la edad por grupos etarios,un histograma (por ejemplo, adolescentes, adultos jóvenes, adultos, adultos mayores).
Altura y Peso:
	Calcular la media, mediana y desviación estándar de la altura y el peso.
	Generar gráficos de dispersión para visualizar la relación entre altura y peso.
Índice de Masa Corporal (IMC):
	Calcular el IMC para cada participante utilizando la fórmula: IMC = Peso (kg) / (Altura (m))^2.
	Clasificar a los participantes en categorías de IMC (Bajo Peso, Normal, Sobrepeso, Obesidad I, Obesidad II, Obesidad III).*/

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






