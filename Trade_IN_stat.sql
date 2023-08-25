

use DPD_DB
Declare @CrtNum float , @UcmNum float ,@UreNum float, @CrtNumW float, @ALLCrt float, @UcmPrct float, @UrePrct float, @UcmPrcStr varchar(10),@UrePrcStr varchar(10)




set @CrtNum = (SELECT COUNT(Created_Date) FROM dbo.Trade_IN_report_View)
set @CrtNumW = (SELECT COUNT(Created_Date) FROM dbo.Trade_IN_report_View WHERE Created_Date < DATEADD(DD, -7, CONVERT(date, GETDATE())))

set @UcmNum = (SELECT COUNT(Status) FROM dbo.Trade_IN_report_View where Status <> 'COMPLETE')
set @UreNum = (SELECT COUNT(Status) FROM dbo.Trade_IN_report_View where Status = 'EMPTY' or Status = 'Non_PickedUp' )


Set @UcmPrct =round (@UcmNum / (@CrtNumW / 100),3)
Set @UrePrct = round(@UreNum / (@CrtNumW / 100),3)


Set @UcmPrcStr =CONVERT(VARCHAR(10), @UcmPrct,-1)+'%'
print @UcmPrcStr

Set @UrePrcStr  =CONVERT(VARCHAR(10), @UrePrct,-1)+'%'
print @UrePrcStr 

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Trade_IN_stat]') AND type in (N'U'))
DROP TABLE [dbo].[Trade_IN_stat]


/****** Object:  Table [dbo].[Trade_IN_stat]    Script Date: 13.12.2022 15:50:55 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Trade_IN_stat](
	[Description] [varchar](30) NULL,
	[Quantity] [float] NULL,
	[Percentage] [varchar](10) NULL
) ON [PRIMARY]

INSERT INTO Trade_IN_stat ([Description], [Quantity], [Percentage] ) VALUES ('All orders', @CrtNum, '');
INSERT INTO Trade_IN_stat ([Description], [Quantity], [Percentage] ) VALUES ('Actual orders', @CrtNumW,'100%');
INSERT INTO Trade_IN_stat ([Description], [Quantity], [Percentage] ) VALUES ('Uncompleted orders', @UcmNum, @UcmPrcStr);
INSERT INTO Trade_IN_stat ([Description], [Quantity], [Percentage] ) VALUES ('Unreturned orders', @UreNum, @UrePrcStr);
