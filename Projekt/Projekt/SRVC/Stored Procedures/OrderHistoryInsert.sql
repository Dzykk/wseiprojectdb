CREATE   PROCEDURE SRVC.OrderHistoryInsert @Status int, @OrderID int
AS
BEGIN --begin proc
DECLARE @orderstatus int
SET @orderstatus = 1

BEGIN
DECLARE @servicedate DATETIME
SET @servicedate = CAST('20180301' AS datetime) + (365 * 2 * RAND() - 365)
END

WHILE @orderstatus <= @Status
BEGIN --begin while

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
WHERE ej.JobID = 4
) AS tb
WHERE tb.rownum = 1 + (SELECT CAST(RAND() * COUNT(*) AS int) FROM Employee AS em INNER JOIN HR.EmployeeJob AS ej ON em.EmployeeID = ej.EmployeeID WHERE ej.JobID = 4 )
END

INSERT INTO SRVC.OrderHistory (OrderID, [StatusID], DateOfUpdate, UpdatedByEmployee)
VALUES
(@OrderID, @orderstatus, @servicedate, @employeeID)

SET @orderstatus += 1
SET @servicedate += CAST(RAND() * 5 + 3 as INT)
IF @orderstatus > @Status
BREAK
END --end while
END; --end proc