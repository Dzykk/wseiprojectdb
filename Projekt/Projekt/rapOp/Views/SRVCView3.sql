CREATE VIEW [rapOp].[SRVCView3] AS
--Lista pracowników, którzy nie zajmowali się obsługą żadnego z zamówień w serwisie wraz z ich posadą i zespołem.

SELECT
em.EmployeeID,
em.[Name],
em.Surname,
jo.[Name] AS Job,
tm.[Name] AS Team
FROM
dbo.Employee AS em (READUNCOMMITTED) INNER JOIN
HR.EmployeeJob AS ej (READUNCOMMITTED) ON em.EmployeeID = ej.EmployeeID INNER JOIN
HR.Job AS jo (READUNCOMMITTED) ON ej.JobID = jo.JobID INNER JOIN
HR.EmployeeTeam AS et (READUNCOMMITTED) ON em.EmployeeID = et.EmployeeID INNER JOIN
HR.Team AS tm (READUNCOMMITTED) ON et.TeamID = tm.TeamID
WHERE NOT EXISTS
(
SELECT 
em.EmployeeID
FROM 
dbo.Employee AS em (READUNCOMMITTED) INNER JOIN
SRVC.OrderHistory AS oh (READUNCOMMITTED) ON em.EmployeeID = oh.UpdatedByEmployee
)
AND em.EmployeeID <> -1