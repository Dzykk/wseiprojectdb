CREATE   VIEW rapAn.Report1
AS
-- Lista producentów samochodów wraz z modelami samochodów, pogrupowane według nazw producentów oraz według nazw producentów i modeli, wraz z sumaryczną ilością sprzedanych samochodów i sumą zarobionych pieniędzy na sprzedaży wraz z rangą według sumy sprzedaży.
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