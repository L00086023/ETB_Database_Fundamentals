/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (10) [CountyName]
      ,[VacancyRate]
  FROM [HousingInIreland].[dbo].[HighestVacancyRate]
