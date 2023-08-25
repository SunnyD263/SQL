use Produktivita
Declare @MinID datetime, @MaxID datetime,@DT datetime, @Zsum int = 0,@X int = 0, @Y int = 0,@Z int=0, @Xsum int = 0, @Ysum int = 0,
@StDate datetime, @NdDate datetime, @User varchar(30), @EndTime time(0)
	
update [dbo].[Databuff] set [ActTime]= CONVERT(time(0),  '00:00:00')


set @Zsum = (select count(*) from (SELECt cast(dati as date) as DT from Databuff where cast(dati as date) <> cast(GETDATE() as date)  group by cast(dati as date)) as D)
WHILE (@Zsum <> @Z )
Begin

CREATE TABLE #Temp(RowID INT PRIMARY KEY IDENTITY(1,1), DT datetime)
INSERT INTO #temp(DT) SELECT E.Dati from (SELECt dati from Databuff where  ActTime = CONVERT(time(0),  '00:00:00' ) and cast(dati as date) <> cast(GETDATE() as date) ) as E;
			WITH MyCte AS 
			(SELECT DT , RowID from #temp T1 JOIN (SELECt cast(dati as date) as ZZZ from Databuff where ActTime = CONVERT(time(0),  '00:00:00' ) and cast(dati as date) <> cast(GETDATE() as date) group by cast(dati as date)) T2 ON T1.DT = T2.ZZZ) --WHERE T1.RowID = @Y+1
			SELECT  @DT = DT
			FROM    MyCte
			WHERE   RowID = @Z + 1
			print @DT 



			

			set @Ysum = (select count(*) from (SELECt userid from Databuff where cast(dati as date) = @DT and ActTime = CONVERT(time(0),  '00:00:00' ) group by USErID) as A )

			CREATE TABLE #Temp1(RowID INT PRIMARY KEY IDENTITY(1,1), USERID VARCHAR(30) COLLATE Czech_CI_AS)
			INSERT INTO #temp1(USERID) SELECT A.UserID from (SELECt userid from Databuff where cast(dati as date) = @DT and ActTime = CONVERT(time(0),  '00:00:00' ) group by USErID) as A;

			WHILE (@Ysum <> @Y )

			Begin

			WITH MyCte AS 
			(SELECT userid , RowID from #temp1 T1 JOIN (SELECt userid as YYY from Databuff where cast(dati as date) = @DT and ActTime = CONVERT(time(0),  '00:00:00' ) group by USErID) T2 ON T1.USERID = T2.YYY) --WHERE T1.RowID = @Y+1
			SELECT   @user = userid
			FROM    MyCte
			WHERE   RowID = @Y + 1
			print @user



				set @Xsum =(SELECt COUNT(NoCard) from Databuff 
				where cast(dati as date) = cast(@DT as date) and ActTime = CONVERT(time(0),  '00:00:00') and userid = @User )


				WHILE (@Xsum <> @X )
				Begin

				set @MinID = (select  MIN(DaTi) from Databuff where cast(dati as date) = @DT and ActTime = CONVERT(time(0),  '00:00:00') and userid = @User)
				set @MaxID = (select  MAX(DaTi) from Databuff where cast(dati as date) = @DT and ActTime = CONVERT(time(0),  '00:00:00') and userid = @User and DaTi <> @MinID )

				--set @StDate = (select dati from Data where ActTime = CONVERT(time(0),  '00:00:00') and ID = MIN(ID) )
				set @StDate = (select dati from Databuff where DaTi = @MinID and userid = @User)
				set @NdDate = (select dati from Databuff where DaTi = @MaxID and userid = @User)
				set @EndTime = @NdDate - @StDate

				update [dbo].[Databuff] set [ActTime] = @EndTime where DaTi = @MinID
				Set @X = @X + 1
				IF (@Xsum = @X) BREAK;
				End
			Set @X = 0
			Set @Y = @Y + 1
			IF (@Ysum = @Y) BREAK;
			End
			DROP TABLE #Temp1

set @Y = 0
set @Z= @Z +1
DROP TABLE #Temp
if(@Zsum = @Z) Break;
END

