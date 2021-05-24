USE master; --Any database  that is not the HousingInIreland database
DROP DATABASE HousingInIreland; -- So we can add a new database of that name.

CREATE DATABASE HousingInIreland;
GO
USE HousingInIreland;



CREATE TABLE tblHousingByCountyAndElectrolDivision2011(
   
   ElectoralCode INT  PRIMARY KEY,
   ElectoralDivision varchar(30) NOT NULL,
   County varchar(20) NOT NULL,
   Bungalow_2011 INT NOT NULL,
   Flat_2011 INT NOT NULL
   
);

CREATE TABLE tblAverageHousePrices(
SurveyYear INT NOT NULL,
Area varchar(30) NOT NULL,    
HouseValue INT NOT NULL,
CONSTRAINT PK_AverageHousePrices PRIMARY KEY(SurveyYear,HouseValue)
 
   
    
 
   
);



CREATE TABLE tblHouseLoansApprovedAndPaid(


CensusYear INT NOT NULL,
HouseType varchar(20),
ValueOfHouse MONEY NOT NULL,

 
CONSTRAINT PK_HouseLoansApprovedAndPaid PRIMARY KEY(CensusYear,ValueOfHouse)

);
CREATE TABLE tblHousingData(
CensusYear INT  NOT NULL,
CountyCode varchar(2),
CountyName varchar(30) NOT NULL,
NumberOfUnits INT NOT NULL,
VacancyRate DECIMAL NOT NULL
CONSTRAINT PK_HousingData PRIMARY KEY(CensusYear,NumberOfUnits)

);
CREATE TABLE  tblNewHouseRegistrations(

YearQuarter varchar(10) NOT NULL,
County varchar(20) NOT NULL,

NumberOfUnits INT NOT NULL
CONSTRAINT PK_NewHouseRegistrations PRIMARY KEY(YearQuarter,County)
)

BULK INSERT tblHouseLoansApprovedAndPaid
FROM 'C:\Users\Client 9.20 SSD\OneDrive\Desktop\Database Fundamentals\ETB_Database_Fundamentals-main\house_loans_approved_and_paid.csv'
WITH (
		FIRSTROW=2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n',
		BATCHSIZE=377
);

BULK INSERT tblNewHouseRegistrations
FROM 'C:\Users\Client 9.20 SSD\Downloads\ETB_Database_Fundamentals-main (1)\ETB_Database_Fundamentals-main\new_house_registrations.csv'

WITH (
		FIRSTROW=2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n',
		BATCHSIZE=2215
);


BULK INSERT  tblHousingByCountyAndElectrolDivision2011
FROM 'C:\Users\Client 9.20 SSD\OneDrive\Desktop\Database Fundamentals\ETB_Database_Fundamentals-main\theme_6_2_electoral_divisions.csv'

WITH (
		FIRSTROW=2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n',
		BATCHSIZE=97
);




BULK INSERT tblAverageHousePrices
FROM 'C:\Users\Client 9.20 SSD\OneDrive\Desktop\Database Fundamentals\ETB_Database_Fundamentals-main\average_house_prices.csv'
WITH (
		FIRSTROW=2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n',
		BATCHSIZE=119
);

 


Go 
--INSERT INTO tblHousingData(CensusYear,CountyCode,NumberOfUnits, CountyName,VacancyRate)
BULK INSERT  tblHousingData
FROM 'C:\Users\Client 9.20 SSD\OneDrive\Desktop\Database Fundamentals\ETB_Database_Fundamentals-main\HousingData1.csv'
WITH (
		FIRSTROW=2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n',
		BATCHSIZE=513
);
	









--List all columns in tblHousingData;
SELECT CensusYear,CountyName,NumberOfUnits, VacancyRate 
FROM tblHousingData;




SELECT CensusYear,NumberOfUnits, VacancyRate 
FROM tblHousingData
WHERE CountyName = 'Donegal';


SELECT SurveyYear,Area,HouseValue 
FROM tblAverageHousePrices
ORDER BY HouseValue ASC;

SELECT * FROM tblNewHouseRegistrations
WHERE YearQuarter = '2000Q1';



Select  DISTINCT County FROM tblNewHouseRegistrations;


SELECT TOP 2 ValueOfHouse,HouseType,CensusYear FROM tblHouseLoansApprovedAndPaid;

SELECT TOP 20 ValueOfHouse,HouseType,CensusYear 
FROM tblHouseLoansApprovedAndPaid
ORDER BY ValueOfHouse  DESC;


--Lee Jones has got a new rabbit named JoJo please add him to the system, JoJo's BOD is 2017-01-20
/*
Go 
INSERT INTO Pets(PetName,Species, DOB, PetOwnersID)
VALUES
('Jojo','Bunny','2017-01-20',100);
*/
INSERT INTO tblHousingByCountyAndElectrolDivision2011(ElectoralCode,ElectoralDivision,County,Bungalow_2011,Flat_2011)
VALUES
(2000,' 199 An Tir Nua','Monaghen North ',2000,40000);


--The Electoral Division: 022 Portmagee needs to be removed from the tblHousingByCountyAndElectrolDivision2011 table
DELETE FROM tblHousingByCountyAndElectrolDivision2011 WHERE ElectoralCode = 1830;
/*

--10 Oldist pet. 
Go 
SELECT TOP  1  PetName,DOB FROM Pets
ORDER BY DOB  ASC;



SELECT * FROM Staff
WHERE Salary=31000.00 OR Salary=40000.00 AND Salary=41000.00;

------------------------------------------------------------
------------------------------------------------------------
--SELECT

--SELECT DISTINCT
SELECT DISTINCT Salary FROM Staff;

--SELECT TOP
SELECT TOP 4 Salary FROM Staff;

--WHERE
SELECT FirstName,LastName, ContactNumber
FROM Staff
WHERE Position ='Nurse';

--AND
SELECT FirstName,LastName, ContactNumber
FROM Staff
WHERE Position ='Nurse' AND Salary <41000.00;

--OR
SELECT FirstName,LastName, ContactNumber ,Position
FROM Staff
WHERE Position ='Nurse' OR Position ='Vet';

-- NOT
SELECT FirstName,LastName, ContactNumber ,Position
FROM Staff
WHERE NOT Position ='Nurse' AND NOT Position ='Vet';

--ORDER BY
SELECT *
FROM Staff
ORDER BY Salary DESC;


--Alias
SELECT FirstName+','+ LastName AS Name, ContactNumber AS [Phone Number]
FROM Staff
WHERE Position ='Nurse';


--DELETE FROM table_name WHERE condition;

--LIKE & Wildcards
SELECT * FROM Pets
WHERE DOB LIKE '2017-01-%';


--BETWEEN 
SELECT *
FROM Staff 
WHERE Salary BETWEEN 20000.00 AND 35000.00;


--INSERT INTO table_name (column1, column2, column3, ...)
--VALUES (value1, value2, value3, ...);

--UPDATE table_name
--SET column1 = value1, column2 = value2, ...
--WHERE condition;

--SELECT *
FROM Pets
INNER JOIN PetOwners
ON Pets.PetOwnersID = PetOwners.PetOwnersID;

SELECT *
FROM Pets
LEFT JOIN PetOwners
ON Pets.PetOwnersID = PetOwners.PetOwnersID;

SELECT *
FROM Pets
RIGHT  JOIN PetOwners
ON Pets.PetOwnersID = PetOwners.PetOwnersID;
Select * 
FROM Pets;

--CREATE TABLE Genres(
--GenreID   int IDENTITY(1,1) NOT NULL Primary Key,
--Genre nvarchar NOT NULL
--);
SELECT * FROM  sys.tables;
CREATE TABLE Medication(
MedicationID   int IDENTITY(1,1) NOT NULL Primary Key,
Medication nvarchar NOT NULL
);
SELECT * FROM  sys.tables;
*/