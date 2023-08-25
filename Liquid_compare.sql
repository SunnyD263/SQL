use Liquid
Declare  @Zsum int = 0,@X int = 0, @Y int = 0,@Z int=0, @Xsum int = 0, @Ysum int = 0, @IDROW bigint = 1, @DLROW bigint = 1,  @Row bigint,
@PAlOD int = 10001, @PAlDO int = 10003, @SkenMtr varchar(15),@Desc varchar(100),@SumSken bigint, @DLMtr varchar(15),@DLDesc varchar(100),@SumDL bigint, @Diff bigint


Delete from Diff where PalOD = @PALOD 

set @Zsum = (SELECT COUNT(*) from ( select  LEFT(sken.Material, 8) AS ComMatr, Description, (SUM(sken.Box) * dbo.EAN.Box + SUM(sken.Crt) * dbo.EAN.Crt) + SUM(Pcs) * dbo.EAN.Pack AS SumSken
                          FROM            dbo.sken INNER JOIN
                                                    dbo.EAN ON sken.Material = dbo.EAN.Code where Pallet_nr>= @PALOD and  Pallet_nr <= @PALDO
                          GROUP BY Pallet_nr, LEFT(sken.Material, 8), Description, dbo.EAN.Box, dbo.EAN.Crt, dbo.EAN.Pack) as Z)

--print @Zsum



--print @Ysum

WHILE (@Zsum <> @Z )
Begin


WITH CTE AS (select ComMtr , Description, SUMSKEN, RowNum, ROW_NUMBER() OVER 
			(Partition by RowNum ORDER by RowNum)  row_num FROM 
			( Select LEFT(sken.Material, 8) AS ComMtr, Description,(SUM(sken.Box) * dbo.EAN.Box + SUM(sken.Crt) * dbo.EAN.Crt) + SUM(Pcs) * dbo.EAN.Pack as SUMSKEN, RowNum = 1 From


					          dbo.sken INNER JOIN
                                                    dbo.EAN ON sken.Material = dbo.EAN.Code where Pallet_nr>= @PALOD and  Pallet_nr <= @PALDO 
                          GROUP BY  LEFT(sken.Material, 8), Description, dbo.EAN.Box, dbo.EAN.Crt, dbo.EAN.Pack) AS X)

SELECT @SkenMtr = ComMtr, @Desc = Description, @SumSken = SUMSKEN FROM CTE WHERE  row_num = @IDROW order by row_num asc
SET @IDROW =  @IDROW + 1



 SELECT @DLMtr = LEFT(DL.Material, 8), @DLDesc= DL.Description, @SumDL = (SUM(DL.Box) * EAN.Box + SUM(DL.Crt) * EAN.Crt) + SUM(DL.Pcs) * EAN.Pack 
                               FROM            dbo.DL INNER JOIN
                                                         dbo.EAN ON DL.Material = EAN.Code where Pallet_nr>= @PALOD and  Pallet_nr <= @PALDO AND LEFT(DL.Material, 8) = @SkenMtr
                               GROUP BY  LEFT(dl.Material, 8), DL.Description, EAN.Box, EAN.Crt, EAN.Pack
set @Diff = @SumSken - @SumDL

IF  @SumDL = 0

	INSERT INTO [dbo].[Diff]([ComMatr],[SumSken],[SumDL],[Diff],[PalOD],[PalDO])
	VALUES( @SkenMtr, @SumSken ,0,@Diff,@PALOD ,@PALDO);
else 
	If @Diff <> 0
	INSERT INTO [dbo].[Diff]([ComMatr],[SumSken],[SumDL],[Diff],[PalOD],[PalDO])
	VALUES( @SkenMtr, @SumSken ,@Diff,@SumSken,@PALOD ,@PALDO);

set @SumDL = 0

set @Z= @Z +1
if(@Zsum = @Z) Break;
END


set @Ysum = (SELECT COUNT(*) from ( SELECT         LEFT(DL.Material, 8) AS ComMatr, DL.Description, (SUM(DL.Box) * EAN.Box + SUM(DL.Crt) * EAN.Crt) + SUM(DL.Pcs) * EAN.Pack AS SumDL
                               FROM            dbo.DL INNER JOIN
                                                         dbo.EAN ON DL.Material = EAN.Code where Pallet_nr>= @PALOD and  Pallet_nr <= @PALDO
                               GROUP BY  LEFT(dl.Material, 8), DL.Description, EAN.Box, EAN.Crt, EAN.Pack) as Y)


WHILE (@Ysum <> @Y )
Begin
	
	WITH CTE AS (select ComMtr , Description, SUMDL, RowNum, ROW_NUMBER() OVER 
			(Partition by RowNum ORDER by RowNum)  row_num FROM 
			( Select LEFT(DL.Material, 8) AS ComMtr, Description,(SUM(DL.Box) * dbo.EAN.Box + SUM(DL.Crt) * dbo.EAN.Crt) + SUM(Pcs) * dbo.EAN.Pack as SUMDL, RowNum = 1 From


					          dbo.DL INNER JOIN
                                                    dbo.EAN ON DL.Material = dbo.EAN.Code where Pallet_nr>= @PALOD and  Pallet_nr <= @PALDO 
                          GROUP BY  LEFT(DL.Material, 8), Description, dbo.EAN.Box, dbo.EAN.Crt, dbo.EAN.Pack) AS X)

SELECT @DLMtr = ComMtr, @DLDesc = Description, @SumDL = SUMDL FROM CTE WHERE  row_num = @DLROW order by row_num asc
SET @DLROW =  @DLROW + 1

SELECT @SkenMtr = LEFT(sken.Material, 8), @Desc= sken.Description, @Sumsken = (SUM(sken.Box) * EAN.Box + SUM(sken.Crt) * EAN.Crt) + SUM(sken.Pcs) * EAN.Pack 
                               FROM            dbo.sken INNER JOIN
                                                         dbo.EAN ON sken.Material = EAN.Code where Pallet_nr>= @PALOD and  Pallet_nr <= @PALDO AND LEFT(sken.Material, 8) = @DLMtr
                               GROUP BY  LEFT(sken.Material, 8), sken.Description, EAN.Box, EAN.Crt, EAN.Pack
set @Diff =  @SumDL - @SumSken

IF  @SumSken = 0
	INSERT INTO [dbo].[Diff]([ComMatr],[SumSken],[SumDL],[Diff],[PalOD],[PalDO])
	VALUES(@DLMtr, 0 ,@SumDL,@Diff,@PALOD ,@PALDO);

set @SumSken = 0
	
	set @Y= @Y + 1
	IF (@Ysum = @Y) BREAK;
    End