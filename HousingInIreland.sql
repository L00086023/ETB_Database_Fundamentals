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
SurveyYear INT IDENTITY(2000,1) PRIMARY KEY, 
Area varchar(30) NOT NULL,    
HouseValue INT NOT NULL,
 
   
    
 
   
);



CREATE TABLE tblHouseLoansApprovedAndPaid(
--CensusYear  varchar(4) Primary Key,
--CensusYear INT Primary Key,
CensusYear INT IDENTITY(1970,1) Primary Key,
HouseType varchar(20),
ValueOfHouse MONEY,





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
County varchar(20) Primary Key,


NumberOfUnits INT NOT NULL
)

BULK INSERT tblHouseLoansApprovedAndPaid
FROM 'C:\Users\Client 9.20 SSD\OneDrive\Desktop\Database Fundamentals\ETB_Database_Fundamentals-main\house_loans_approved_and_paid.csv'
WITH (
		FIRSTROW=2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n',
		BATCHSIZE=377
);
/*
BULK INSERT tblNewHouseRegistrations
FROM 'C:\Users\Client 9.20 SSD\Downloads\ETB_Database_Fundamentals-main (1)\ETB_Database_Fundamentals-main\new_house_registrations.csv'

WITH (
		FIRSTROW=2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n',
		BATCHSIZE=2215
);


*/
BULK INSERT  tblHousingByCountyAndElectrolDivision2011
--FROM 'C:\Users\Client 9.20 SSD\Downloads\ETB_Database_Fundamentals-main\ETB_Database_Fundamentals-main\theme_6_2_electoral_divisions.csv'
FROM 'C:\Users\Client 9.20 SSD\OneDrive\Desktop\Database Fundamentals\ETB_Database_Fundamentals-main\theme_6_2_electoral_divisions.csv'

WITH (
		FIRSTROW=2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n',
		BATCHSIZE=97
);




BULK INSERT tblAverageHousePrices
--FROM 'C:\Users\Client 9.20 SSD\Downloads\ETB_Database_Fundamentals-main\ETB_Database_Fundamentals-main\average_house_prices.csv'
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
SELECT CensusYear,NumberOfUnits, VacancyRate 
FROM tblHousingData;



/*
SELECT CensusYear,NumberOfUnits, VacancyRate 
FROM tblHousingData
WHERE CountyName = 'Donegal';
*/

SELECT SurveyYear,Area,HouseValue 
FROM tblAverageHousePrices
ORDER BY HouseValue ASC;
/*
--list all columns in Pets
SELECT * FROM Pets;

--list all columns in PetOwners

SELECT * FROM PetOwners;



--display the pets, owned by Lee Jones
Go 
SELECT * FROM Pets
WHERE PetOwnersID =100;



Go 
SELECT * FROM Pets
WHERE PetOwnersID =100;


--display the different types of animals, veterinarians help
Go 
SELECT DISTINCT Species FROM Pets;



--display the FirstName LastName  of the top two staff members
Go 
SELECT TOP  2 FirstName,LastName FROM Staff;


--displaythe FirstName LastName & . Salary of  two staff members who earn the most.
Go 
SELECT TOP  2  FirstName,LastName , Salary  
FROM Staff
ORDER BY Salary DESC;


--Lee Jones has got a new rabbit named JoJo please add him to the system, JoJo's BOD is 2017-01-20
Go 
INSERT INTO Pets(PetName,Species, DOB, PetOwnersID)
VALUES
('Jojo','Bunny','2017-01-20',100);


--9. Micah has resigned, please remove the record from the staff table.
Go 
DELETE FROM Staff  WHERE StaffID=4;


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