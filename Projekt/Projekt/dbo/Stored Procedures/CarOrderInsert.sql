CREATE   PROCEDURE dbo.CarOrderInsert @NumberOfOrders int
AS
BEGIN --begin proc

DECLARE @ordernumber int
SET @ordernumber = 1

WHILE @ordernumber <= @NumberOfOrders
BEGIN --begin while

BEGIN
DECLARE @orderid int
SELECT @orderid = IDENT_CURRENT('dbo.order')
END

BEGIN
DECLARE @clientid int
SELECT @clientid = ClientID 
FROM
(SELECT 
ROW_NUMBER() OVER (Order BY ClientID) AS rownum,
ClientID
FROM
dbo.Client
) AS tb
WHERE tb.rownum = 1 + (SELECT CAST(RAND() * COUNT(*) AS int) FROM Client )
END

BEGIN
DECLARE @employeeID int
SELECT @employeeID = EmployeeID 
FROM
(SELECT 
ROW_NUMBER() OVER (Order BY em.EmployeeID) AS rownum,
em.EmployeeID,
ej.JobID
FROM
dbo.Employee as em INNER JOIN 
HR.EmployeeJob as ej ON em.EmployeeID = ej.EmployeeID 
WHERE ej.JobID = 2
) AS tb
WHERE tb.rownum = 1 + (SELECT CAST(RAND() * COUNT(*) AS int) FROM Employee AS em INNER JOIN HR.EmployeeJob AS ej ON em.EmployeeID = ej.EmployeeID WHERE ej.JobID = 2 )
END

BEGIN
DECLARE @orderdate DATETIME
SET @orderdate = CAST('20180301' AS datetime) + (365 * 2 * RAND() - 365)
END

BEGIN
DECLARE @deliverydate DATETIME
SET @deliverydate = @orderdate + ((7 * 2 * RAND()))
END

BEGIN
DECLARE @modelid int
SELECT @modelid = ModelID FROM
(SELECT 
ROW_NUMBER() OVER (Order BY ModelID) AS rownum,
ModelID
FROM
dbo.Model
) AS tb
WHERE tb.rownum = 1 + (SELECT CAST(RAND() * COUNT(*) AS int) FROM Model )
END

BEGIN
DECLARE @price smallmoney
SELECT @price = Price
FROM
(SELECT
pr.Price - (ROUND(((500 - 100 - 1) * RAND() + 100), 0)) AS Price
FROM
dbo.Model AS mo INNER JOIN
dbo.Price AS pr ON mo.ModelID = pr.ModelID
WHERE mo.ModelID = @modelid
) AS tb
END

BEGIN
DECLARE @completed bit
SELECT @completed= 
CASE
WHEN  DAY(GETDATE() - @orderdate) > 7 THEN 1
ELSE 0
END
END

BEGIN
DECLARE @delivered bit
SELECT @delivered = 
CASE
WHEN @deliverydate <= GETDATE() THEN 1
ELSE 0
END 
END

BEGIN
INSERT INTO dbo.[Order] (ClientID, EmployeeID, FullPrice, OrderDate, DeliveryDate, Completed, Delivered)
VALUES
(@clientid, @employeeID, @price, @orderdate, @deliverydate, @completed, @delivered )
END


BEGIN
INSERT INTO dbo.[OrderedCar] (ModelID, OrderID, FinalPrice)
VALUES
(@modelid, @orderid, @price)
END

SET @ordernumber += 1
IF @ordernumber > @NumberOfOrders
BREAK
END --end while

END; --end proc