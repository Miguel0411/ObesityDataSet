USE OBESITYDATA;

CREATE TABLE  ObesityData (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Genero VARCHAR(20),
    Edad INT,
    Altura FLOAT,
    Peso FLOAT,
    Historia_Familiar_Sobrepeso VARCHAR(20),
    CAFRC VARCHAR(20),
    FCCV  FLOAT,
    NCP  FLOAT,
    CAEC VARCHAR(20),
    FUMA VARCHAR(20),
    CH2O FLOAT,
    MCC VARCHAR(20),
    FAF FLOAT,
    TUDT FLOAT,
    CALC VARCHAR(20),
    MTRANS VARCHAR(50),
    Tipo_Obesidad VARCHAR(50)
);
Drop table ObesityData;
Select COUNT(*) from obesityData;