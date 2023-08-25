use DPD_Db
Declare @StId bigint, @Status varchar(30) ,@DT date, @Zsum int = 0,@Z int=0

set @Zsum = (select count(*) FROM [DPD_DB].[dbo].[SWAP_report_View] 
         	where (LEFT(Created_Date, 10) <= CONVERT(varchar(15), DATEADD(WEEK, - 2, GETDATE()), 23)) AND KN = 'Import' AND STATUS <> 'Received')

WHILE (@Zsum <> @Z )
Begin

	if (@Z=0) 
	Begin
	CREATE TABLE #Temp1(RowID INT PRIMARY KEY IDENTITY(1,1), [St_Prcl_ID] bigint, [Status] varchar(30)) 
	
	INSERT INTO #Temp1([St_Prcl_ID],[Status] ) 	
		Select [St_Prcl_ID],[Status] FROM [DPD_DB].[dbo].[SWAP_report_View] 
        where (LEFT(Created_Date, 10) <= CONVERT(varchar(15), DATEADD(WEEK, - 2, GETDATE()), 23)) AND KN = 'Import' AND STATUS <> 'Received'
	End	
		Select @StId = [St_Prcl_ID],  @Status = [Status]
		from #Temp1
		WHERE   RowID = @Z + 1


 update [dbo].[PMIdB] set [KN]= @Status WHERE ID = @StId 



set @Z= @Z + 1
if (@Zsum = @Z ) DROP TABLE #Temp1;
--if (@Zsum = @Z )Break;
END



Set @Z=0
Set @Zsum = 0

set @Zsum = (select count(*) FROM [DPD_DB].[dbo].[ParcelShop_report_View] where  KN = 'Import' )

WHILE (@Zsum <> @Z )
Begin

	if (@Z=0) 
	Begin
	CREATE TABLE #Temp2(RowID INT PRIMARY KEY IDENTITY(1,1), [St_Prcl_ID] bigint) 
	
	INSERT INTO #Temp2([St_Prcl_ID] ) 	
		Select [ID] FROM [DPD_DB].[dbo].[ParcelShop_report_View] WHERE KN = 'Import' 
	End	
		Select @StId = [St_Prcl_ID]
		from #Temp2
		WHERE   RowID = @Z + 1

 update [dbo].[PMIdB] set [KN]= 'ParcelShop' WHERE ID = @StId 

set @Z= @Z + 1
if (@Zsum = @Z ) DROP TABLE #Temp2;
--if (@Zsum = @Z ) Break;
END

Set @Z=0
Set @Zsum = 0

set @Zsum = (select count(*) FROM [DPD_DB].[dbo].[CompareDPD_report_View]  where  ([Shipped_Date] <= CONVERT(varchar(15), DATEADD(WEEK, - 2, GETDATE()), 23)) AND KN = 'Import' )

WHILE (@Zsum <> @Z )
Begin

	if (@Z=0) 
	Begin
	CREATE TABLE #Temp3(RowID INT PRIMARY KEY IDENTITY(1,1), [St_Prcl_ID] bigint) 
	
	INSERT INTO #Temp3([St_Prcl_ID]) 	
		Select [ID] FROM [DPD_DB].[dbo].[CompareDPD_report_View]  WHERE ([Shipped_Date] <= CONVERT(varchar(15), DATEADD(WEEK, - 2, GETDATE()), 23)) AND KN = 'Import'
	End	
		Select @StId = [St_Prcl_ID]
		from #Temp3
		WHERE   RowID = @Z + 1

 update [dbo].[PMIdB] set [KN]= 'Compare_DPD' WHERE ID = @StId 

set @Z= @Z + 1

if (@Zsum = @Z ) DROP TABLE #Temp3;
--if (@Zsum = @Z ) Break;
END




