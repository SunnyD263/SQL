--//-- Produktivita - DATA(User work time) - great than 3month delete --\\--
DELETE  FROM [Produktivita].[dbo].[Data] WHERE [DaTi] !>  convert(varchar,DATEADD(month,-3,GETDATE()),20)

--//-- Produktivita - PMX_DSSMITH - great than 3month delete --\\--
DELETE  FROM [Produktivita].[dbo].[PMX_DSSMITH] WHERE [Date] !>  convert(varchar,DATEADD(month,-3,GETDATE()),20)