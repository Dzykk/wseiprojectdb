CREATE VIEW [rapOp].[HRView1] AS
--Lista wszystkich pracownikow, którzy otrzymali premię wraz z danymi na temat każdej premii oraz łączną kwotą wszystkich swoich premii oraz ich ilością
SELECT 
em.EmployeeID,
em.[Name] + ' ' + em.[Surname] AS EmployeeFullName,
jo.[Name] AS Job,
pa.PaymentID,
pa.Amount AS BonusAmount,
SUM(pa.Amount) OVER (PARTITION BY em.EmployeeID ORDER BY pa.PaymentID) AS RunningSumBonus,
COUNT(pa.PaymentID) OVER (PARTITION BY em.EmployeeID ORDER BY pa.PaymentID) AS BonusQty
FROM
dbo.Employee as em (READUNCOMMITTED) INNER JOIN
HR.EmployeeJob AS ej (READUNCOMMITTED) ON em.EmployeeID = ej.EmployeeID INNER JOIN
HR.Job AS jo (READUNCOMMITTED) ON ej.JobID = jo.JobID INNER JOIN
HR.Payment as pa (READUNCOMMITTED) ON em.EmployeeID = pa.EmployeeID AND pa.[Type] = 'Bonus'
;