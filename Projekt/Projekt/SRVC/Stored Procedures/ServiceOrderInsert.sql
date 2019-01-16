CREATE   PROCEDURE SRVC.ServiceOrderInsert @NumberOfOrders int
AS
BEGIN --begin proc
DECLARE @ordernumber int
SET @ordernumber = 1

WHILE @ordernumber <= @NumberOfOrders
BEGIN --begin while

BEGIN
DECLARE @serviceid int
SELECT @serviceid = ServiceTypeID
FROM
(SELECT 
ROW_NUMBER() OVER (Order BY ServiceTypeID) AS rownum,
ServiceTypeID
FROM
SRVC.ServiceType
) AS tb
WHERE tb.rownum = 1 + (SELECT CAST(RAND() * COUNT(*) AS int) FROM SRVC.ServiceType )
END

INSERT INTO SRVC.[Order] (ServiceTypeID)
VALUES
(@serviceid)

SET @ordernumber += 1
IF @ordernumber > @NumberOfOrders
BREAK
END --end while

END; --end proc