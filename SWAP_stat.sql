use DPD_DB
Declare @CrtNum float , @UcmNum float ,@UreNum float, @RdNum float, @CrtNumW float, @ALLCrt float, 
@UcmPrct float, @UrePrct float,@RdPrct float, @UcmPrcStr varchar(10),@UrePrcStr varchar(10),@RdPrctStr varchar(10)




set @CrtNum = (SELECT COUNT(Created_Date) FROM dbo.SWAP_report_View)
set @CrtNumW = (SELECT COUNT(Created_Date) FROM dbo.SWAP_report_View WHERE Created_Date < DATEADD(DD, -7, CONVERT(date, GETDATE())))

set @UcmNum = (SELECT COUNT([Final Status]) FROM dbo.SWAP_report_View where [Final Status] = 'Non_Delivery')

set @UreNum = (SELECT COUNT([Final Status]) FROM dbo.SWAP_report_View where  [Final Status] = 'Non_PickedUp')

set @RdNum= (SELECT COUNT([Final Status]) FROM dbo.SWAP_report_View where  [Final Status] = 'EMPTY')


Set @UcmPrct =round (@UcmNum / (@CrtNumW / 100),3)
Set @UrePrct = round(@UreNum / (@CrtNumW / 100),3)
Set @RdPrct = round(@RdNum / (@CrtNumW / 100),3)

Set @UcmPrcStr =CONVERT(VARCHAR(10), @UcmPrct,-1)+'%'
Set @UrePrcStr  =CONVERT(VARCHAR(10), @UrePrct,-1)+'%'
Set @RdPrctstr  =CONVERT(VARCHAR(10), @RdPrct,-1)+'%'

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Trade_IN_stat]') AND type in (N'U'))
DROP TABLE [dbo].[SWAP_stat]


/****** Object:  Table [dbo].[Trade_IN_stat]    Script Date: 13.12.2022 15:50:55 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[SWAP_stat](
	[Description] [varchar](30) NULL,
	[Quantity] [float] NULL,
	[Percentage] [varchar](10) NULL
) ON [PRIMARY]

INSERT INTO SWAP_stat ([Description], [Quantity], [Percentage] ) VALUES ('All orders', @CrtNum, '');
INSERT INTO SWAP_stat ([Description], [Quantity], [Percentage] ) VALUES ('Actual orders', @CrtNumW,'100%');
INSERT INTO SWAP_stat ([Description], [Quantity], [Percentage] ) VALUES ('Undelivered orders', @UcmNum, @UcmPrcStr);
INSERT INTO SWAP_stat ([Description], [Quantity], [Percentage] ) VALUES ('Unreturned orders', @UreNum, @UrePrcStr);
INSERT INTO SWAP_stat ([Description], [Quantity], [Percentage] ) VALUES ('Uncompleted orders', @RdNum, @RdPrctstr);
