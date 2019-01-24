CREATE VIEW rapAn.Report4
AS
--Lista producentów samochodów wraz z ilością sprzedanych samochodów w danym miesiącu, posortowana według lat i miesięcy i uzupełniona o ilość sprzedanych samochodów w ubiegłym oraz następnym miesiącu w kontekście obecnego oraz rosnącą wartość sprzedanych samochodów z każdym miesiącem ograniczoną do jednego roku.
WITH cte 
AS
(
SELECT 
cm.ManufacturerName,
DATENAME(mm, od.OrderDate) AS [Month],
DATEPART(mm, od.OrderDate) AS MonthNo,
DATEPART(yyyy, od.OrderDate) AS [Year],
LAG(COUNT(od.OrderID)) OVER (PARTITION BY cm.ManufacturerName ORDER BY DATEPART(yyyy, od.OrderDate), DATEPART(mm, od.OrderDate)) AS CarsSoldPreviousMonth,
COUNT(od.OrderID) AS CarsSold,
LEAD(COUNT(od.OrderID)) OVER (PARTITION BY cm.ManufacturerName ORDER BY DATEPART(yyyy, od.OrderDate), DATEPART(mm, od.OrderDate)) AS CarsSoldFollowingMonth
FROM
[Order] AS od INNER JOIN
CarModel AS cm ON od.CarModelID = cm.CarModelID
GROUP BY
cm.ManufacturerName, DATENAME(mm, od.OrderDate), DATEPART(mm, od.OrderDate), DATEPART(yyyy, od.OrderDate)
ORDER BY
[year], cm.ManufacturerName, MonthNo
OFFSET 0 ROWS
)
SELECT ManufacturerName, [Month], [Year], MonthNo, CarsSoldPreviousMonth, CarsSold, CarsSoldFollowingMonth,
SUM(CarsSold) OVER (PARTITION BY ManufacturerName, [Year] ORDER BY MonthNo ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningCarsSoldYearly
FROM cte