
CREATE   PROCEDURE rapAn.Raport3 @yr int
AS
CREATE TABLE #Temp
(
[MonthName] varchar(15),
[MonthNumber] int
)
INSERT INTO #Temp
SELECT DATENAME(MONTH, DATEADD(MM, s.number, CONVERT(DATETIME, 0))) AS [MonthName], 
MONTH(DATEADD(MM, s.number, CONVERT(DATETIME, 0))) AS [MonthNumber] 
FROM master.dbo.spt_values s 
WHERE [type] = 'P' AND s.number BETWEEN 0 AND 11
ORDER BY 2

DECLARE @cols AS varchar(MAX) = ''
DECLARE @sql AS varchar(MAX) = ''
SELECT @cols = @cols + QUOTENAME([MonthName]) + ','
FROM 
#Temp

SET @cols = substring(@cols, 0, len(@cols))
DECLARE @year varchar(15) = CAST(@yr AS varchar(15))
BEGIN
SET @sql =
'SELECT *
FROM
(
SELECT 
cm.ManufacturerName,
cm.ModelName,
DATENAME(month, od.OrderDate) AS OrderDate,
od.FinalPrice
FROM
[Order] AS od INNER JOIN
CarModel AS cm ON od.CarModelID = cm.CarModelID
WHERE YEAR(od.OrderDate) = ' + @year + ' 
) AS src
PIVOT
( SUM(FinalPrice) FOR OrderDate IN (' + @cols + ')) AS piv
'
EXEC(@sql)

IF(OBJECT_ID('tempdb..#temp') IS NOT NULL)
BEGIN
DROP TABLE #Temp
END
END