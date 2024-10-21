select*from ObesityDataSet

--Crear Tabla si no existe: 
CREATE DATABASE IF NOT EXISTS Obesity;

-- Seleccionar la base de datos
USE Obesity;
select*from ObesityDataSet
-- Crear la tabla DatosObesidad
CREATE TABLE ObesityDataSet (
    Genero NVARCHAR(510),
    Edad FLOAT(8),
    Altura FLOAT(8),
    Peso FLOAT(8),
    Historia_Familiar_Sobrepeso NVARCHAR(510),
    CAFRC NVARCHAR(510),
    FCCV FLOAT(8),
    NCP FLOAT(8),
    CAEC NVARCHAR(510),
    FUMA NVARCHAR(510),
    CH2O FLOAT(8),
    MCC NVARCHAR(510),
    FAF FLOAT(8),
    TUDT FLOAT(8),
    CALC NVARCHAR(510),
    MTRANS NVARCHAR(510),
    Tipo_Obesidad NVARCHAR(510)
);

--Se insertó datos mediante un archivo Excel.

-- Agregar una nueva columna con autoincremento
ALTER TABLE ObesityDataSet ADD ID INT IDENTITY(1,1);

-- Establecer la nueva columna como clave primaria
ALTER TABLE ObesityDataSet ADD CONSTRAINT PK_ObesityDataSet PRIMARY KEY (ID);

-- Significado de las columnas creadas en la Tabla ObesityDataSet
/*
ID: Identificador único para cada registro (clave primaria).
Genero: Género del participante (NVARCHAR con longitud 510).
Edad: Edad del participante (FLOAT con precisión 8).
Altura: Altura del participante (FLOAT con precisión 8).
Peso: Peso del participante (FLOAT con precisión 8).
Historia_Familiar_Sobrepeso: Historia familiar de sobrepeso (NVARCHAR con longitud 510).
CAFRC: Consumo frecuente de alimentos ricos en calorías (NVARCHAR con longitud 510).
FCCV: Frecuencia de consumo de vegetales (FLOAT con precisión 8).
NCP: Número de comidas principales al día (FLOAT con precisión 8).
CAEC: Consumo de alimentos entre comidas (NVARCHAR con longitud 510).
FUMA: Fuma (sí/no) (NVARCHAR con longitud 510).
CH2O: Consumo de agua diario (FLOAT con precisión 8).
MCC: Monitoreo del consumo de calorías (NVARCHAR con longitud 510).
FAF: Frecuencia de actividad física (FLOAT con precisión 8).
TUDT: Tiempo de uso de dispositivos tecnológicos (FLOAT con precisión 8).
CALC: Consumo de alcohol (NVARCHAR con longitud 510).
MTRANS: Medio de transporte utilizado (NVARCHAR con longitud 510).
Tipo_Obesidad: Tipo de obesidad (NVARCHAR con longitud 510).*/

