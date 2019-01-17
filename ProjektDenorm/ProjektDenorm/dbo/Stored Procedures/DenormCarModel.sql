CREATE   PROCEDURE DenormCarModel
AS
BEGIN --begin proc

WITH temptable AS
(
SELECT
nma.[Name] AS ManufacturerName,
nma.Country AS ManufacturerCountry,
nmo.ModelID,
nmo.[Name] AS ModelName,
nmo.YearStart AS ModelYearStart,
nmo.YearEnd AS ModelYearEnd,
npr.Price,
npr.DateFrom AS PriceDateFrom,
npr.DateTo AS PriceDateTo
FROM
Projekt.dbo.Model  AS nmo  INNER JOIN
Projekt.dbo.Manufacturer AS nma ON nma.ManufacturerID = nmo.ManufacturerID INNER JOIN
Projekt.dbo.Price AS npr ON nmo.ModelID = npr.ModelID
)

MERGE dbo.CarModel AS tar
USING temptable AS src
ON tar.ManufacturerName = src.ManufacturerName AND tar.ModelID = src.ModelID
WHEN NOT MATCHED BY TARGET THEN
INSERT(ManufacturerName, ManufacturerCountry, ModelID, ModelName, ModelYearStart, ModelYearEnd, Price, PriceDateFrom, PriceDateTo)
VALUES (src.ManufacturerName, src.ManufacturerCountry, src.ModelID, src.ModelName, src.ModelYearStart, src.ModelYearEnd, src.Price, src.PriceDateFrom, src.PriceDateTo);
END --end proc

;