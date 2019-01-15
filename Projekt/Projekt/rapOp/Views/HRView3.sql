CREATE VIEW [rapOp].[HRView3] AS
--Lista stanowisk pracy wraz ze średnim wynagrodzeniem pracownika na danym stanowisku oraz różnicą między najwięcej zarabiającym pracownikiem na danym stanowisku i najmniej zarabiającym pracownikiem na tym samym stanowisku

SELECT 
jo.[Name] AS JobName,
AVG(wa.Amount) AS AverageWage,
MAX(wa.Amount) - MIN(wa.Amount) AS WageDifference
FROM
HR.Job AS jo INNER JOIN
HR.EmployeeJob AS ej ON jo.JobID = ej.JobID INNER JOIN
dbo.Employee AS em ON ej.EmployeeID = em.EmployeeID INNER JOIN
HR.Wage AS wa ON em.EmployeeID = wa.EmployeeID AND ej.DateFrom = wa.DateFrom AND ej.DateTo = wa.DateTo
GROUP BY
jo.[Name]