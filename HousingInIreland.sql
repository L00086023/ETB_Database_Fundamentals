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
CREATE TABLE HousingData(
CensusYear INT Primary Key,
CountyCode varchar(2) NOT NULL,
NumberOfUnits INT NOT NULL,
VacancyRate INT NOT NULL

);






INSERT INTO HousingByCountyAndElectrolDivision2011(ElectoralCode,ElectoralDivision, County, Bungalow_2011, Flat_2011)
VALUES
('Aariz','Gould','Nurse','(877) 455-7519',€40000.00),
('Sioned','Jones','Nurse', '(627) 416-9842',€31000.00),
('Kellan','Brown','Vet','(244) 829-4726',€31000.00),
('Micah','Rawlings','Nurse','(839) 261-9816',€25000.00),
('Hadi','Harrington','Vet','(694) 621-6461',€25000.00),
('Amos','Wilson','receptionist','(826) 639-8108',€21000.00),
('Lola','Strickland','custodian','(338) 978-9554',€21000.00);




INSERT INTO AverageHousePrices(FirstName,LastName, Position, ContactNumber, Salary)
VALUES
('Aariz','Gould','Nurse','(877) 455-7519',€40000.00),
('Sioned','Jones','Nurse', '(627) 416-9842',€31000.00),
('Kellan','Brown','Vet','(244) 829-4726',€31000.00),
('Micah','Rawlings','Nurse','(839) 261-9816',€25000.00),
('Hadi','Harrington','Vet','(694) 621-6461',€25000.00),
('Amos','Wilson','receptionist','(826) 639-8108',€21000.00),
('Lola','Strickland','custodian','(338) 978-9554',€21000.00);
Go 
Go 
INSERT INTO FuelConsumption(PetName,Species, DOB, PetOwnersID)
VALUES
('Max','Dog','2017-01-20',100),
('Jack', 'Dog' ,'2015-06-18',100),   
('Buddy', 'Dog','2015-06-18',103),
('Oscar' , 'Cat', '2011-12-01',101);


Go 
INSERT INTO HousingData(CensusYear,CountyCode,CountyAndCity,NumberOfUnits,VacancyRate)
VALUES
(2002	,'IE',	'State',	1460053,	9.8),
(2002,	'CW',	'Carlow',	16421,	7.8),
(2002,	'DC',	'Dublin City',	199463,	6),
(2002,	'DR',	'Dún Laoghaire-Rathdown',	69444,	4.3),
(2002,	'FL',	'Fingal',	65432,	4.9),
(2002,	'SD',	'South Dublin',	76666,	2.8),
(2002,	'KE',	'Kildare',	54589,	5.9),
(2002	KK	Kilkenny	27811	6.6	),
(2002	LS	Laois	20561	9.1),	
(2002	LD	Longford	12060	12.8),	
(2002	LH	Louth	37441	8.2	)
(2002	MH	Meath	44972	6.4)	
(2002	OY	Offaly	22071	7.7)	
(2002	WH	Westmeath	26484	9.7)	
(2002	WX	Wexford	45334	16.7)	
(2002	WW	Wicklow	40214	7.2	)
(2002	CE	Clare	41513	16.1)	
(2002	CC	Cork City	46801	6)	
(2002	CK	Cork County	121983	12)	
(2002	KY	Kerry	54331	18.4)	
(2002	LK	Limerick CityAndCounty	63950	8.1	)
(2002	TY	Tipperary	51927	8.6)	
2002	WD	Waterford City and County	39259	11.4	
2002	GC	Galway City	23792	7.5	
2002	GY	Galway County	54103	14.8	
2002	LM	Leitrim	11858	21.7	
2002	MO	Mayo	49194	18.4	
2002	RN	Roscommon	21944	15.5	
2002	SO	Sligo	23464	13.8	
2002	CN	Cavan	21165	12.9	
2002	DL	Donegal	57395	21	
2002	MN	Monaghan	18411	8.1	
2006	IE	State	1769613	15	
2006	CW	Carlow	20135	12.3	
2006	DC	Dublin City	223098	11.7	
2006	DR	Dún Laoghaire-Rathdown	77508	8.9	
2006	FL	Fingal	89909	8.8	
2006	SD	South Dublin	87484	6.2	
2006	KE	Kildare	68840	9.9	
2006	KK	Kilkenny	34353	12	
2006	LS	Laois	27079	15.7	
2006	LD	Longford	15868	22.2	
2006	LH	Louth	45488	13.4	
2006	MH	Meath	61257	10.6	
2006	OY	Offaly	27591	12.9	
2006	WH	Westmeath	32817	15.3	
2006	WX	Wexford	58970	21.5	
2006	WW	Wicklow	49088	11.4	
2006	CE	Clare	48834	20.1	
2006	CC	Cork City	51441	12	
2006	CK	Cork County	150659	16.5	
2006	KY	Kerry	65913	24.8	
2006	LK	Limerick City and County	75742	12.6	
2006	TY	Tipperary	61509	13	
2006	WD	Waterford City and County	47541	16.8	
2006	GC	Galway City	30589	13	
2006	GY	Galway County	67737	20.1	
2006	LM	Leitrim	15282	29.3	
2006	MO	Mayo	58717	24.4	
2006	RN	Roscommon	26979	21.8	
2006	SO	Sligo	28751	23.1	
2006	CN	Cavan	28250	21.2	
2006	DL	Donegal	70526	27	
2006	MN	Monaghan	21658	12.8	
2011	IE	State	1994845	14.5	
2011	CW	Carlow	23165	13.8	
2011	DC	Dublin City	241678	10.2	
2011	DR	Dún Laoghaire-Rathdown	85896	7.7	
2011	FL	Fingal	102793	7	
2011	SD	South Dublin	97298	5.4	
2011	KE	Kildare	78794	8	
2011	KK	Kilkenny	39005	11.9	
2011	LS	Laois	32664	12.5	
2011	LD	Longford	18823	21.6	
2011	LH	Louth	51186	12.2	
2011	MH	Meath	69697	8.9	
2011	OY	Offaly	30750	11.8	
2011	WH	Westmeath	36659	13.4	
2011	WX	Wexford	68143	21	
2011	WW	Wicklow	54351	9.9	
2011	CE	Clare	55616	21.2	
2011	CC	Cork City	55633	11.1	
2011	CK	Cork County	172042	15.8	
2011	KY	Kerry	74747	26.4	
2011	LK	Limerick City and County	82156	12.3	
2011	TY	Tipperary	68974	13.5	
2011	WD	Waterford City and County	52364	16.4	
2011	GC	Galway City	33655	11.2	
2011	GY	Galway County	77522	19.4	
2011	LM	Leitrim	18128	30.5	
2011	MO	Mayo	65792	24.7	
2011	RN	Roscommon	31585	23.2	
2011	SO	Sligo	33044	22.2	
2011	CN	Cavan	33711	21.6	
2011	DL	Donegal	83918	28.6	
2011	MN	Monaghan	25056	13.6	
2016	IE	State	2003645	12.3	
2016	CW	Carlow	23274	9.3	
2016	DC	Dublin City	240553	8.1	
2016	DR	Dún Laoghaire-Rathdown	86962	5.5	
2016	FL	Fingal	104851	5	
2016	SD	South Dublin	98387	3.6	
2016	KE	Kildare	80158	5.9	
2016	KK	Kilkenny	39226	9	
2016	LS	Laois	32794	9.6	
2016	LD	Longford	18591	16.7	
2016	LH	Louth	51399	9.2	
2016	MH	Meath	70649	6.9	
2016	OY	Offaly	30740	9.4	
2016	WH	Westmeath	36890	10.9	
2016	WX	Wexford	68206	18.4	
2016	WW	Wicklow	54986	8.1	
2016	CE	Clare	55779	19.6	
2016	CC	Cork City	55760	7.8	
2016	CK	Cork County	173735	13.2	
2016	KY	Kerry	74094	24	
2016	LK	Limerick City and County	82112	10	
2016	TY	Tipperary	69106	12.3	
2016	WD	Waterford City and County	52491	14	
2016	GC	Galway City	33847	9.4	
2016	GY	Galway County	78207	17.2	
2016	LM	Leitrim	18051	29	
2016	MO	Mayo	65921	23.4	
2016	RN	Roscommon	31285	20.9	
2016	SO	Sligo	32764	20.1	
2016	CN	Cavan	33585	17.5	

)
)


)


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