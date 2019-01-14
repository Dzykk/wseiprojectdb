CREATE VIEW [rapOp].[View2] AS
SELECT
[oc].[OrderID],
[pr].[Price],
[oc].[FinalPrice],
([pr].[Price] - [oc].[FinalPrice]) / [pr].[Price] AS Discount,
CONVERT(VARCHAR, CONVERT(DECIMAL(6,1), 100*(CONVERT(DECIMAL(6,5), ([pr].[Price] - [oc].[FinalPrice]) / [pr].[Price])))) + '%' AS DiscountPercentage
FROM
[OrderedCar] AS oc (READUNCOMMITTED) INNER JOIN
[Model] AS mo (READUNCOMMITTED) ON [oc].ModelID = [mo].[ModelID] INNER JOIN
[Price] AS pr (READUNCOMMITTED) ON [mo].ModelID = [pr].[ModelID];