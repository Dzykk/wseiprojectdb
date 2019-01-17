

CREATE   PROCEDURE OrderedCarInsert
AS
BEGIN --begin proc

WHILE (SELECT COUNT(od.OrderID)
FROM 
dbo.[Order] AS od LEFT JOIN
dbo.OrderedCar AS oc ON od.OrderID = oc.OrderID
WHERE
oc.OrderedCarID IS NULL) > 0
BEGIN --begin while

BEGIN
DECLARE @orderid int
SELECT @orderid = OrderID 
FROM
(
SELECT TOP(1)
od.OrderID
FROM 
dbo.[Order] AS od LEFT JOIN
dbo.OrderedCar AS oc ON od.OrderID = oc.OrderID
WHERE
oc.OrderedCarID IS NULL
ORDER BY
od.OrderID ASC
) AS tb
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
INSERT INTO dbo.[OrderedCar] (ModelID, OrderID, FinalPrice)
VALUES
(@modelid, @orderid, @price)

UPDATE dbo.[Order]
SET FullPrice = @price
WHERE
OrderID = @orderid
END

IF (SELECT COUNT(od.OrderID)
FROM 
dbo.[Order] AS od LEFT JOIN
dbo.OrderedCar AS oc ON od.OrderID = oc.OrderID
WHERE
oc.OrderedCarID IS NULL) = 0
BREAK
ELSE CONTINUE

END --end while

END --end proc