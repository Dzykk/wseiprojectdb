CREATE   PROCEDURE DenormEmployee
AS
BEGIN --begin proc

WITH temptable AS
(
SELECT
nem.EmployeeID AS EmployeeID,
nem.[Name],
[Surname],
Gender,
Email,
PhoneNumber,
PESEL,
HireDate,
njo.[Name] AS Job,
nej.DateFrom AS JobDateFrom,
nej.DateTo AS JobDateTo,
ntm.[Name] AS Team,
nwa.Amount AS WageAmount
FROM
Projekt.dbo.Employee AS nem INNER JOIN
(Projekt.HR.EmployeeJob AS nej  INNER JOIN
Projekt.HR.Job AS njo ON nej.JobID = njo.JobID) ON nem.EmployeeID = nej.EmployeeID INNER JOIN
(Projekt.HR.EmployeeTeam AS net INNER JOIN Projekt.HR.Team AS ntm ON net.TeamID = ntm.TeamID) ON nem.EmployeeID = net.EmployeeID INNER JOIN
Projekt.HR.Wage AS nwa ON nwa.EmployeeID = nem.EmployeeID
)

MERGE dbo.Employee AS tar
USING temptable AS src
ON tar.EmployeeID = src.EmployeeID
WHEN MATCHED THEN
UPDATE SET
tar.Surname = src.Surname,
tar.Email = src.Email,
tar.PhoneNumber = src.PhoneNumber,
tar.Job = src.Job,
tar.JobDateFrom = src.JobDateFrom,
tar.JobDateTo = src.JobDateTo,
tar.Team = src.Team,
tar.WageAmount = src.WageAmount
WHEN NOT MATCHED BY TARGET THEN
INSERT (EmployeeID, [Name], Surname, Gender, Email, PhoneNumber, PESEL, HireDate, Job, JobDateFrom, JobDateTo, Team, WageAmount)
VALUES
(src.EmployeeID, src.[Name], src.Surname, src.Gender, src.Email, src.PhoneNumber, src.PESEL, src.HireDate, src.Job, src.JobDateFrom, src.JobDateTo, src.Team, src.WageAmount);
END --end proc