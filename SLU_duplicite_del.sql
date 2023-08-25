
WITH CTE AS (SELECT [ID],[Scanned code]
      ,[Material]
      ,[Prodejna]
      ,[DL]
      ,[Datum]
      ,[Codentify]
      ,[Type]
      ,[Sent],ROW_NUMBER()  OVER 
(PARTITION BY [Scanned code] ORDER BY [ID]Desc) row_num FROM [SLU].[dbo].[Inb_SLU]
where  Sent is null  )  delete  FROM CTE WHERE ROW_NUm > 1
