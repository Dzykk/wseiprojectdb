CREATE   PROCEDURE rapAn.Report5
AS
-- Lista miast z których pochodzili klienci, wraz z numerem kupionych w danych miastach samochodów, przychodami ze sprzedanych samochodów i procentowym udziałem w całej sprzedaży danego miasta
-- oraz identyczne wartości dla zamówień serwisowych wraz z całkowitą sumą przychodów dla konkretnego miasta
BEGIN

BEGIN 
CREATE TABLE #Temp
(
City varchar(30),
NoOfCarOrders int,
CarOrderMoneyAmount money,
NoOfServiceOrders int, 
ServiceOrderMoneyAmount money
)
INSERT INTO #Temp (City)
SELECT DISTINCT 
City
FROM
Client

UPDATE #Temp 
SET
#Temp.NoOfCarOrders = COALESCE(t.NoOfCarOrders, 0), 
#Temp.CarOrderMoneyAmount = COALESCE(t.CarOrderMoneyAmount, 0),
#Temp.NoOfServiceOrders = COALESCE(t.NoOfServiceOrders, 0), 
#Temp.ServiceOrderMoneyAmount = COALESCE(t.ServiceOrderMoneyAmount, 0)
FROM
(

SELECT
cl.City,
COUNT(od.OrderID) AS NoOfCarOrders,
SUM(od.FinalPrice) AS CarOrderMoneyAmount,
NULL AS NoOfServiceOrders,
NULL AS ServiceOrderMoneyAmount
FROM Client AS cl INNER JOIN
[Order] AS od ON cl.ClientID = od.ClientID 
GROUP BY cl.City

UNION ALL


SELECT
cl.City,
NULL AS NoOfCarOrders,
NULL AS CarOrderMoneyAmount,
COUNT(so.OrderID) AS NoOfServiceOrders,
SUM(so.Price) AS ServiceOrderMoneyAmount
FROM Client AS cl INNER JOIN
ServiceOrder AS so ON so.ClientID = cl.ClientID AND so.OrderStatus = 'Closed'
GROUP BY cl.City


) AS t
WHERE #Temp.City = t.City 

END

BEGIN

SELECT
City, 
NoOfCarOrders,
CarOrderMoneyAmount,
CAST(100.00 * CarOrderMoneyAmount / SUM(CarOrderMoneyAmount) OVER() AS NUMERIC (8,2)) AS CarOrderPercentage,
NoOfServiceOrders,
ServiceOrderMoneyAmount,
CAST(
CASE 
WHEN ServiceOrderMoneyAmount > 0 THEN (100.00 * ServiceOrderMoneyAmount / SUM(ServiceOrderMoneyAmount) OVER() )
ELSE 0
END AS NUMERIC (8,2)) AS ServiceOrderPercentage,
NULL AS MoneyTotal
FROM
#Temp



UNION ALL

SELECT
'Total' AS City,
SUM(NoOfCarOrders) AS NoOfCarOrders,
SUM(CarOrderMoneyAmount) AS CarOrderMoneyAmount,
NULL AS CarOrderPercentage,
SUM(NoOfServiceOrders) AS NoOfServiceOrders,
SUM(ServiceOrderMoneyAmount) AS ServiceOrderMoneyAmount,
NULL AS ServiceOrderPercentage,
SUM(CarOrderMoneyAmount) + SUM(ServiceOrderMoneyAmount) AS MoneyTotal
FROM #Temp

END

IF(OBJECT_ID('tempdb..#temp') IS NOT NULL)
BEGIN
DROP TABLE #Temp
END
 END