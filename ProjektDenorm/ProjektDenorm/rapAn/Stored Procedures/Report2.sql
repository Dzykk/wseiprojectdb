
CREATE PROCEDURE rapAn.Report2 @offset int = null, @fetch int = null, @ordby varchar(15) = 'MoneyTotal'
AS
-- Procedura wykorzystująca widok Report1, z parametrami przeznaczonymi do wyświetlenia wyłącznie określonych przez użytkownika wierszy, z możliwością ustalenia według której kolumny (MoneyTotal<Domyślne> lub CarsSold) poszczególnym producentom mają być przydzielone rangi, wyświetlająca ilość sprzedanych samochodów oraz sumę zarobków.
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
rapAn.Report1
WHERE 
ModelName IS NULL
ORDER BY
1
OFFSET '+ CAST((COALESCE(@offset, 1) -1)AS varchar(15)) +' ROWS FETCH NEXT ' + CAST(COALESCE(@fetch, 2000000000) AS varchar(15))+ ' ROWS ONLY '
EXEC(@sql)

END