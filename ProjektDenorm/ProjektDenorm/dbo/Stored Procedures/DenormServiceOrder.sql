
  CREATE    PROCEDURE DenormServiceOrder
AS
BEGIN --begin proc

WITH temptable AS
(
SELECT
nso.OrderID,
nst.[Name] AS ServiceType,
nos.[Name] AS OrderStatus,
noh.DateOfUpdate,
noh.UpdatedByEmployee,
nst.Price
FROM
Projekt.SRVC.[Order] AS nso INNER JOIN 
Projekt.SRVC.ServiceType AS nst ON nso.ServiceTypeID = nst.ServiceTypeID INNER JOIN
Projekt.SRVC.OrderHistory AS noh ON nso.OrderID = noh.OrderID INNER JOIN
Projekt.SRVC.OrderStatus AS nos ON noh.StatusID = nos.OrderStatusID
)

MERGE dbo.ServiceOrder AS tar
USING temptable AS src
ON tar.OrderID = src.OrderID AND tar.ServiceType = src.ServiceType
WHEN NOT MATCHED BY TARGET THEN
INSERT(OrderID, ServiceType, OrderStatus, DateOfUpdate, UpdatedByEmployee, Price)
VALUES (src.OrderID, src.ServiceType, src.OrderStatus, src.DateOfUpdate, src.UpdatedByEmployee, src.Price);
END --end proc

;