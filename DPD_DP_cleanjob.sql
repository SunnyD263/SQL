
--//-- DPD_DB - Scanbackup - great than 14day delete --\\--
Delete from scanbackup where event_date_time !>  convert(varchar,DATEADD(DAY,-14,GETDATE()),20)

--//-- DPD_DB - PMIdB - great than 3month delete --\\--
Delete from PMIdB where 
SCAN_CODE = '10' and  event_date_time !>  convert(varchar,DATEADD(month,-3,GETDATE()),20) or  --HUB MO
SCAN_CODE = '04' and  event_date_time !>  convert(varchar,DATEADD(month,-3,GETDATE()),20) or  --Nedoručeno, pět na depo
SCAN_CODE = '06' and  event_date_time !>  convert(varchar,DATEADD(month,-3,GETDATE()),20) or  --Zásilka byla přesměrována
SCAN_CODE = '01' and  event_date_time !>  convert(varchar,DATEADD(month,-3,GETDATE()),20) OR  --HUB HnM
SCAN_CODE = '08' and  event_date_time !>  convert(varchar,DATEADD(month,-3,GETDATE()),20)     --Příjemce změnil termín doručení  
