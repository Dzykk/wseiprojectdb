CREATE   PROCEDURE rapAn.Raport2 @offset int = null, @fetch int = null, @ordby varchar(15) = 'MoneyTotal'
AS
BEGIN
DECLARE @sql varchar(MAX)
SET @sql =
'
SELECT
RANK() OVER (PARTITION BY [Rank] ORDER BY ' + @ordby + ' DESC) AS [CarRank], 
ManufacturerName,
CarsSold, 
MoneyTotal
FROM
rapAn.Raport1
WHERE 
ModelName IS NULL
ORDER BY
1
OFFSET '+ CAST((COALESCE(@offset, 1) -1)AS varchar(15)) +' ROWS FETCH NEXT ' + CAST(COALESCE(@fetch, 2000000000) AS varchar(15))+ ' ROWS ONLY '
EXEC(@sql)

END

;