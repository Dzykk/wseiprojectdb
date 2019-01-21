CREATE   VIEW rapAn.Raport1
AS
(
SELECT
RANK() OVER (PARTITION BY cm.ManufacturerName ORDER BY SUM(od.FinalPrice) DESC) AS [Rank],
cm.ManufacturerName,
cm.ModelName,
COUNT(od.OrderID) AS CarsSold,
SUM (od.FinalPrice) AS MoneyTotal
FROM
[Order] AS od INNER JOIN 
CarModel AS cm ON cm.CarModelID = od.CarModelID

GROUP BY
GROUPING SETS
(
(cm.ManufacturerName),
(cm.ManufacturerName, cm.ModelName)
)
)
;