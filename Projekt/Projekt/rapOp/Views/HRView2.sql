CREATE VIEW [rapOp].[HRView2] AS
--Lista zespołów wraz z sumaryczną ilością wszystkich obsłużonych zamówień i łączną kwotą tych zamówień

SELECT
te.[Name],
COUNT(od.OrderID) AS OrderQty,
SUM(od.FullPrice) AS MoneySum
FROM
HR.Team AS te (READUNCOMMITTED) INNER JOIN
HR.EmployeeTeam AS et (READUNCOMMITTED) ON te.TeamID = et.TeamID INNER JOIN
dbo.Employee as em (READUNCOMMITTED) ON et.EmployeeID = em.EmployeeID INNER JOIN
dbo.[Order] AS od (READUNCOMMITTED) ON em.EmployeeID = od.EmployeeID
WHERE
od.Completed = 1 AND od.Delivered = 1 AND te.TeamID <> -1
GROUP BY
te.[Name];