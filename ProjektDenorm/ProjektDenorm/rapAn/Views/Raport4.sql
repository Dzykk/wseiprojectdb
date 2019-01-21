CREATE VIEW rapAn.Raport4
AS
WITH cte (ManufacturerName, [Month], MonthNo, CarsSoldPreviousMonth, CarsSold, CarsSoldFollowingMonth)
AS
(
SELECT 
cm.ManufacturerName,
DATENAME(mm, od.OrderDate) AS [Month],
DATEPART(mm, od.OrderDate) AS MonthNo,
LAG(COUNT(od.OrderID)) OVER (PARTITION BY cm.ManufacturerName ORDER BY DATEPART(mm, od.OrderDate)) AS CarsSoldPreviousMonth,
COUNT(od.OrderID) AS CarsSold,
LEAD(COUNT(od.OrderID)) OVER (PARTITION BY cm.ManufacturerName ORDER BY DATEPART(mm, od.OrderDate)) AS CarsSoldFollowingMonth
FROM
[Order] AS od INNER JOIN
CarModel AS cm ON od.CarModelID = cm.CarModelID
GROUP BY
cm.ManufacturerName, DATENAME(mm, od.OrderDate), DATEPART(mm, od.OrderDate)
ORDER BY
cm.ManufacturerName, MonthNo
OFFSET 0 ROWS
)
SELECT ManufacturerName, [Month], MonthNo, CarsSoldPreviousMonth, CarsSold, CarsSoldFollowingMonth,
SUM(CarsSold) OVER (PARTITION BY ManufacturerName ORDER BY MonthNo ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningCarsSold
FROM cte