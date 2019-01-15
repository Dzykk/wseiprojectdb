CREATE VIEW [rapOp].[SRVCView1] AS
--Lista zamówień w realizacji wraz z rodzajem zamówienia, których status nie zmienił się od okresu co najmniej tygodnia.

SELECT
OrderID,
stn AS ServiceType,
osn AS OrderStatus
FROM 
(
SELECT 
od.OrderID,
st.[Name] AS stn,
os.[Name] AS osn,
ROW_NUMBER() OVER (PARTITION BY od.OrderID ORDER BY oh.DateOfUpdate DESC) AS rownum,
oh.DateOfUpdate
FROM
SRVC.[Order] AS od (READUNCOMMITTED) INNER JOIN 
SRVC.ServiceType AS st (READUNCOMMITTED) ON od.ServiceTypeID = st.ServiceTypeID  JOIN
(SRVC.OrderHistory AS oh (READUNCOMMITTED) INNER JOIN
SRVC.OrderStatus AS os (READUNCOMMITTED) ON oh.[Status] = os.Name) ON od.OrderID = oh.OrderID AND os.[Name] <> 'Closed'
) AS oht 
WHERE
DATEDIFF(day, oht.DateOfUpdate, GETDATE()) >= 7 AND rownum = 1;