DROP VIEW IF EXISTS dim_date_view;

GO

CREATE VIEW dim_date_view
AS
-- Cleansed DIM_Date Table --
SELECT 
  [DateKey]
  ,[FullDateAlternateKey] AS Date 
  ,[EnglishDayNameOfWeek] AS Day 
  ,[EnglishMonthName] AS Month 
  ,Left([EnglishMonthName], 3) AS MonthShort
  ,[MonthNumberOfYear] AS MonthNo
  ,DATEFROMPARTS(CalendarYear, MonthNumberOfYear, 1) AS [Year-Month]
  ,CONCAT(Left([EnglishMonthName], 3), ' ', CalendarYear) AS [Year_Month_Eng]
  ,[CalendarQuarter] AS Quarter 
  ,CONCAT('Q', CalendarQuarter,'-', CalendarYear) AS [Quarter-Year]
  ,[CalendarYear] AS Year
FROM 
  [AdventureWorksDW2019].[dbo].[DimDate]
WHERE 
  CalendarYear >= YEAR(GETDATE()) - 3;
