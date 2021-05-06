USE master; --Any database that is not the JamesVet database. 
DROP DATABASE HousingInIreland; -- So we can add a new database of that name.

CREATE DATABASE HousingInIreland;
GO
USE HousingInIreland;



CREATE TABLE HousingByCountyAndElectrolDivision2011(
   
   ElectoralCode INT IDENTITY(100,1) PRIMARY KEY,
   ElectoralDivision varchar(30) NOT NULL,
   County varchar(20) NOT NULL,
   Bungalow_2011 INT NOT NULL,
   Flat_2011 INT NOT NULL
   
);

CREATE TABLE AverageHousePrices(
    AverageHousePriceTableID INT IDENTITY(1,1)   PRIMARY KEY,
   HouseType varchar(20)NOT NULL,
   SurveyYear INT NOT NULL,
    Area varchar(30) NOT NULL,
 HouseValue INT NOT NULL,
 
   
);


CREATE TABLE FuelConsumption(
    PetsID INT IDENTITY(100,1)   PRIMARY KEY,
    PetName varchar(30) NOT NULL,
    Species varchar(30)NOT NULL,
    DOB DATE NOT NULL,
	PetOwnersID INT FOREIGN KEY REFERENCES PetOwners(PetOwnersID),

);

Go 
INSERT INTO Staff(FirstName,LastName, Position, ContactNumber, Salary)
VALUES
('Aariz','Gould','Nurse','(877) 455-7519',€40000.00),
('Sioned','Jones','Nurse', '(627) 416-9842',€31000.00),
('Kellan','Brown','Vet','(244) 829-4726',€31000.00),
('Micah','Rawlings','Nurse','(839) 261-9816',€25000.00),
('Hadi','Harrington','Vet','(694) 621-6461',€25000.00),
('Amos','Wilson','receptionist','(826) 639-8108',€21000.00),
('Lola','Strickland','custodian','(338) 978-9554',€21000.00);



Go 
INSERT INTO PetOwners( FirstName,LastName, ContactNumber)
VALUES 
('Lee','Jones','(372) 985-4084' ),
('Anna', 'Tomson','(912) 363-9679'),       
('Jo', 'Tomson','(386) 361-0226'),
('Mauricio' , 'Kearley','(264) 547-8523');


Go 
INSERT INTO Pets(PetName,Species, DOB, PetOwnersID)
VALUES
('Max','Dog','2017-01-20',100),
('Jack', 'Dog' ,'2015-06-18',100),   
('Buddy', 'Dog','2015-06-18',103),
('Oscar' , 'Cat', '2011-12-01',101);


Go 

--List all columns in staff
SELECT LastName, FirstName FROM Staff;

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