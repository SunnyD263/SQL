WITH CTE AS (SELECT [ID],[PARCELNO],[EVENT_DATE_TIME],[Source],[KN],ROW_NUMBER()  OVER 
(PARTITION BY [PARCELNO]ORDER BY [ID] desc) row_num FROM pmiDb 
where left(EVENT_DATE_TIME,10)>convert(varchar(20),DATEADD(DAY,-30,GETDATE()),23) and Source = 'WHU' )  Delete  FROM CTE WHERE ROW_NUm > 1 and KN= 'Error'