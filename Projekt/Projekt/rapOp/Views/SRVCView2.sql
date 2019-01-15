
CREATE VIEW [rapOp].[SRVCView2] AS
--Lista usług oferowanych przez serwis wraz z łączną ilością zrealizowanych zamówień na daną usługę w bieżącym roku oraz sumaryczną wartością zarobionych na wykonaniu danej usługi pieniędzy

SELECT
st.[Name] AS ServiceType,
COUNT(od.OrderID) AS OrdersQty,
SUM(st.Price) AS MoneySum
FROM
SRVC.ServiceType AS st (READUNCOMMITTED) LEFT JOIN
(SRVC.[Order] AS od (READUNCOMMITTED) INNER JOIN
SRVC.OrderHistory AS oh (READUNCOMMITTED) ON od.OrderID = oh.OrderID AND oh.[Status] = 'Closed')
ON st.ServiceTypeID = od.ServiceTypeID
WHERE
YEAR(oh.DateOfUpdate) = YEAR(GETDATE())
GROUP BY 
st.[Name];