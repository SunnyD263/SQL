WITH CTE AS (SELECT [PARCELNO],[EVENT_DATE_TIME],[Source],[KN],ROW_NUMBER() OVER 
  (PARTITION BY [PARCELNO]ORDER BY [PARCELNO]ASC) row_num FROM PMIdb
 where left(EVENT_DATE_TIME,10)=convert(varchar(20),GETDATE(),23) and Source = 'WHU')  Delete FROM CTE WHERE KN = 'Error'