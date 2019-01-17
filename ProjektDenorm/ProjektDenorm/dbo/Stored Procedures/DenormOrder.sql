CREATE   PROCEDURE DenormOrder
AS
BEGIN --begin proc

WITH temptable AS
(
SELECT
nor.OrderID,
nor.ClientID,
nor.EmployeeID,
nor.FullPrice,
nor.OrderDate,
nor.DeliveryDate,
nor.Completed,
nor.Delivered,
noc.OrderedCarID,
cm.CarModelID,
noc.FinalPrice
FROM
Projekt.dbo.[Order] AS nor INNER JOIN 
Projekt.dbo.OrderedCar AS noc ON nor.OrderID = noc.OrderID
INNER JOIN CarModel AS cm ON noc.ModelID = cm.ModelID
)

MERGE dbo.[Order] AS tar
USING temptable AS src
ON tar.OrderID = src.OrderID AND tar.OrderedCarID= src.OrderedCarID
WHEN NOT MATCHED BY TARGET THEN
INSERT(OrderID, ClientID, EmployeeID, FullPrice, OrderDate, DeliveryDate, Completed, Delivered, OrderedCarID, CarModelID, FinalPrice)
VALUES (src.OrderID, src.ClientID, src.EmployeeID, src.FullPrice, src.OrderDate, src.DeliveryDate, src.Completed, src.Delivered, src.OrderedCarID, src.CarModelID, src.FinalPrice);
END --end proc

;