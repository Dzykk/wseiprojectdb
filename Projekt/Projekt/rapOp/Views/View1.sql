CREATE VIEW [rapOp].[View1] AS


SELECT
[ma].[Name],
COUNT([oc].ModelID) AS OrderNumber,
SUM([pr].Price) AS SumOfMoney
FROM [Manufacturer] AS ma (READUNCOMMITTED) INNER JOIN
[Model] AS mo (READUNCOMMITTED) ON [ma].[ManufacturerID] = [mo].[ManufacturerID] INNER JOIN
[OrderedCar] AS oc (READUNCOMMITTED) ON [oc].[ModelID] = [mo].[ModelID] INNER JOIN
[Price] AS pr (READUNCOMMITTED) ON [pr].ModelID = [mo].ModelID
WHERE ma.ManufacturerID <> -1
GROUP BY
[ma].[Name]
;