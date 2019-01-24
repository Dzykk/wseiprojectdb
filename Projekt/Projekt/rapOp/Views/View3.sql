CREATE VIEW [rapOp].[View3] AS
SELECT
[ma].[Name] AS Manufacturer,
[mo].[Name] AS Model
FROM
[Manufacturer] AS ma (READUNCOMMITTED) INNER JOIN
[Model] AS mo (READUNCOMMITTED) ON [ma].[ManufacturerID] = [mo].[ManufacturerID]
WHERE [mo].[ModelID] NOT IN (
SELECT
[mo].[ModelID]
FROM
[Model] AS mo (READUNCOMMITTED) INNER JOIN
[OrderedCar] AS oc (READUNCOMMITTED) ON [oc].ModelID = [mo].[ModelID]
)
AND ma.ManufacturerID <> -1 AND mo.ModelID <> -1
GROUP BY
[ma].[Name],
[mo].[Name]