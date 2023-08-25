USE [DPD_DB]
GO

INSERT INTO [dbo].[SWAP]
           ([REFERENCE]
           ,[CRTDate])
select [REFERENCE], [EVENT_DATE_TIME]

from pd4 

where reference not in(SELECT REFERENCE FROM trade_in  WHERE trade_in.REFERENCE = PD4.REFERENCE) and reference not in(SELECT REFERENCE FROM swap  WHERE swap.REFERENCE = PD4.REFERENCE)

GO


