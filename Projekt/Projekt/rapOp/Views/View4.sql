CREATE VIEW [rapOp].[View4] AS
SELECT
[em].[EmployeeID],
[em].[Name] + ' ' + [em].[Surname] AS EmployeeFullName,
COUNT([od].[OrderID]) AS OrdersNumber,
SUM([od].[FullPrice]) AS MoneySum
FROM [Employee] AS em (READUNCOMMITTED) INNER JOIN
[Order] AS od (READUNCOMMITTED) ON [em].EmployeeID = [od].[EmployeeID]
WHERE em.EmployeeID <> -1
GROUP BY
[em].[EmployeeID],
[em].[Name] + ' ' + [em].[Surname]