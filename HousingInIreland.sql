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
CREATE TABLE tblFuelConsumption(
SurveyYear INT NOT NULL,
FuelType varchar(40) NOT NULL,
KiloTonValue INT,
CONSTRAINT PK_FuelConsumption PRIMARY KEY(SurveyYear,KiloTonValue,FuelType) 


)


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

BULK INSERT tblFuelConsumption
FROM 'C:\Users\Client 9.20 SSD\OneDrive\Desktop\Database Fundamentals\ETB_Database_Fundamentals-main\fuel_consumption.csv'
WITH (
		FIRSTROW=2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n',
		BATCHSIZE=97
);

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
BULK INSERT  tblHousingData
FROM 'C:\Users\Client 9.20 SSD\OneDrive\Desktop\Database Fundamentals\ETB_Database_Fundamentals-main\HousingData1.csv'
WITH (
		FIRSTROW=2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n',
		BATCHSIZE=513
);
	



/*

-- 1 List all columns in tblHousingData;
SELECT CensusYear,CountyName,NumberOfUnits, VacancyRate 
FROM tblHousingData;
*/
/*
GO


-- 2
SELECT CensusYear,NumberOfUnits, VacancyRate 
FROM tblHousingData
WHERE CountyName = 'Donegal';
*/
GO
/*

--3
SELECT SurveyYear,Area,HouseValue 
FROM tblAverageHousePrices
ORDER BY HouseValue ASC;
*/
GO
/*
--4
SELECT * FROM tblNewHouseRegistrations
WHERE YearQuarter = '2000Q1';
*/
GO
/*
--5
Select  DISTINCT County FROM tblNewHouseRegistrations;
*/
GO
/*
--6
SELECT TOP 2 ValueOfHouse,HouseType,CensusYear FROM tblHouseLoansApprovedAndPaid;
*/
GO
/*
--7
SELECT TOP 20 ValueOfHouse,HouseType,CensusYear 
FROM tblHouseLoansApprovedAndPaid
ORDER BY ValueOfHouse  DESC;

*/
GO
/*
--8
INSERT INTO tblHousingByCountyAndElectrolDivision2011(ElectoralCode,ElectoralDivision,County,Bungalow_2011,Flat_2011)
VALUES
(1831,' 199 Does not Exist','Monaghen North ',2000,40000);

*/
--GO

/*
--9 The Electoral Division: 022 Portmagee needs to be removed from the tblHousingByCountyAndElectrolDivision2011 table
*/
/*
DELETE FROM tblHousingByCountyAndElectrolDivision2011 WHERE ElectoralCode = 1830;
*/
/*
GO


--10
*/
/*
SELECT TOP 100 FuelType,SurveyYear FROM tblFuelConsumption
ORDER by SurveyYear ASC;
*/
/*
--11
SELECT * FROM tblNewHouseRegistrations
WHERE County = 'Donegal' OR YearQuarter = '2018Q1' AND NumberOfUnits >50; 

------------------------------------------------------------
------------------------------------------------------------
--SELECT
--12 The SELECT TOP clause is used to specify the number of records to return
SELECT TOP 20 CountyName,  VacancyRate
FROM tblHousingData
ORDER BY VacancyRate DESC;
*/
/*
--13
SELECT DISTINCT Area, HouseValue
FROM tblAverageHousePrices;

 
 */
 /*

-- 14
SELECT SurveyYear,Area,HouseValue
FROM  tblAverageHousePrices
WHERE HouseValue >400000
ORDER BY HouseValue ASC;
--15
SELECT SurveyYear,HouseValue
FROM  tblAverageHousePrices
WHERE Area = 'Dublin' AND SurveyYear > 2000
ORDER BY HouseValue ASC;

--16
SELECT County,ElectoralDivision,Bungalow_2011
FROM tblHousingByCountyAndElectrolDivision2011
WHERE ElectoralDivision = '022 Portmagee' OR Bungalow_2011 >50;


--17
SELECT CensusYear,ValueOfHouse
FROM tblHouseLoansApprovedAndPaid
WHERE HouseType = 'New houses' AND NOT HouseType = 'Second-hand houses';


--18
SELECT * 

FROM tblHousingData
ORDER BY VacancyRate DESC;




--19   SQL aliases are used to give each  column in the  table, a temporary name.
SELECT County +',' AS CountyName,  NumberOfUnits AS [No of Units]
FROM tblNewHouseRegistrations
WHERE YearQuarter = '2000Q1' AND NOT County = 'All Counties'
ORDER BY NumberOfUnits DESC;


--20 The following SQL statement deletes all rows in the "tblNewHouseRegistrations" table, which satisfy the WHERE condition.
DELETE FROM  tblNewHouseRegistrations
WHERE County LIKE 'All Counties%';


--21 The BETWEEN operator selects values within a given range
SELECT *
FROM tblAverageHousePrices
WHERE HouseValue BETWEEN 150000 AND 250000



/*22 The INSERT INTO statement is used to insert new records in a table. */


INSERT  INTO tblAverageHousePrices(SurveyYear,Area,HouseValue)
VALUES(2021,' Dalkey',12000000);


--23 The UPDATE statement is used to modify the existing records in a table.
UPDATE tblHousingData
SET CountyCode = 'XX'
WHERE CountyName ='Wexford';

-- 24 Create View

/*
GO
*/
/*
--24
CREATE VIEW [HighestVacancyRate] AS
SELECT CountyName,VacancyRate
FROM tblHousingData
WHERE VacancyRate >10

*/
GO


*/

--25 
CREATE PROCEDURE SPSELECTMAXFUELTYPE
AS
SELECT DISTINCT FuelType  FROM tblFuelConsumption
EXECUTE SPSELECTMAXFUELTYPE;

 GO
 
 /*
 --CREATE FUNCTION AverageVacancyRate()
-- RETURNS AVG(HouseValue) /*This is incomplete. 15:37 27-05-21 */
*/
/*
--SET column1 = value1, column2 = value2, ...
--WHERE condition;

--SELECT *
FROM Pets
INNER JOIN PetOwners
ON Pets.PetOwnersID = PetOwners.PetOwnersID;
*/
/*
SELECT *
FROM tblHousingData
INNER JOIN 
ON CountyCode.PK_HousingData = /


*/
/*
SELECT *
FROM Pets
LEFT JOIN PetOwners
ON Pets.PetOwnersID = PetOwners.PetOwnersID;
*/
/*
SELECT *
FROM Pets
RIGHT  JOIN PetOwners
ON Pets.PetOwnersID = PetOwners.PetOwnersID;
Select * 
FROM Pets;
*/
/*
--CREATE TABLE Genres(
--GenreID   int IDENTITY(1,1) NOT NULL Primary Key,
--Genre nvarchar NOT NULL
--);
SELECT * FROM  sys.tables;
CREATE TABLE Medication(
MedicationID   int IDENTITY(1,1) NOT NULL Primary Key,
Medication nvarchar NOT NULL
);
*/
/*
SELECT * FROM  sys.tables;
*/