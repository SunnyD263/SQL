Declare @InbID bigint, @WHSID bigint, @X int = 0, @Xsum int = 0, @PN bigint 
set @Xsum = (SELECT        COUNT(R.ID) as IDVL
from (SELECT        MAX(A.ID) AS ID, A.PARCELNO, dbo.DPDsc.Scan_code_CZ AS SCAN_CODE, MAX(A.EVENT_DATE_TIME) AS EVENT_DATE_TIME, dbo.DPDservice.Service_CZ AS SERVICE, A.KN, A.REFERENCE, A.Source, dbo.Customer.Customer,
                          A.Customer AS DPDCUST, A.ZIP
FROM            dbo.PMIdB AS A LEFT OUTER JOIN
                         dbo.Counter_View ON A.PARCELNO = dbo.Counter_View.PARCELNO LEFT OUTER JOIN
                         dbo.Customer ON A.REFERENCE = dbo.Customer.REFERENCE LEFT OUTER JOIN
                         dbo.DPDservice ON A.SERVICE = dbo.DPDservice.ServiceId LEFT OUTER JOIN
                         dbo.DPDsc ON A.SCAN_CODE = dbo.DPDsc.IdScan_code INNER JOIN
                             (SELECT        IDMAX, Counter
                               FROM            (SELECT        MAX(EVENT_DATE_TIME) AS MAXDATE, ID AS IDMAX, PARCELNO, COUNT(SCAN_CODE) AS Counter
                                                         FROM            dbo.PMIdB AS PMIdB_1
                                                         WHERE        (SCAN_CODE = '03')
                                                         GROUP BY PARCELNO, ID) AS B) AS C ON 
                                                         
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '298' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'IQOS' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '298' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kuhn' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '298' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kühn' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '298' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = ': Ku' AND A.ZIP <> '99999' OR                         
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '118' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'IQOS' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '118' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kuhn' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '118' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kühn' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '118' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = ': Ku' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '339' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'IQOS' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '339' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kuhn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '339' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kühn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '339' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = ': Ku' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '101' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'IQOS' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '101' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kuhn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '101' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kühn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '101' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = ': Ku' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'IQOS' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kuhn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kühn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = ': Ku' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '298' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = 'IQOS' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '298' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = 'Kuhn' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '298' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = 'Kühn' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '298' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = ': Ku' AND A.ZIP <> '99999' OR                         
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '118' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = 'IQOS' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '118' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = 'Kuhn' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '118' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = 'Kühn' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '118' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = ': Ku' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '339' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = 'IQOS' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '339' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = 'Kuhn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '339' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = 'Kühn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '339' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = ': Ku' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '101' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = 'IQOS' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '101' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = 'Kuhn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '101' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = 'Kühn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '101' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = ': Ku' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = 'IQOS' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = 'Kuhn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = 'Kühn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = ': Ku'


GROUP BY A.PARCELNO, dbo.DPDsc.Scan_code_CZ, dbo.DPDservice.Service_CZ, A.KN, A.REFERENCE, A.Source, dbo.Customer.Customer, dbo.Counter_View.ID, A.Customer, A.ZIP) as r  
where  R.ZIP <> '99999' )


WHILE (@Xsum >0 )
Begin

set @InbID = (select min(ID) AS XID from (

SELECT        MAX(A.ID) AS ID, A.PARCELNO, dbo.DPDsc.Scan_code_CZ AS SCAN_CODE, MAX(A.EVENT_DATE_TIME) AS EVENT_DATE_TIME, dbo.DPDservice.Service_CZ AS SERVICE, A.KN, A.REFERENCE, A.Source, dbo.Customer.Customer,
                          A.Customer AS DPDCUST, A.ZIP
FROM            dbo.PMIdB AS A LEFT OUTER JOIN
                         dbo.Counter_View ON A.PARCELNO = dbo.Counter_View.PARCELNO LEFT OUTER JOIN
                         dbo.Customer ON A.REFERENCE = dbo.Customer.REFERENCE LEFT OUTER JOIN
                         dbo.DPDservice ON A.SERVICE = dbo.DPDservice.ServiceId LEFT OUTER JOIN
                         dbo.DPDsc ON A.SCAN_CODE = dbo.DPDsc.IdScan_code INNER JOIN
                             (SELECT        IDMAX, Counter
                               FROM            (SELECT        MAX(EVENT_DATE_TIME) AS MAXDATE, ID AS IDMAX, PARCELNO, COUNT(SCAN_CODE) AS Counter
                                                         FROM            dbo.PMIdB AS PMIdB_1
                                                         WHERE        (SCAN_CODE = '03')
                                                         GROUP BY PARCELNO, ID) AS B) AS C ON 

                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '298' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'IQOS' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '298' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kuhn' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '298' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kühn' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '298' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = ': Ku' AND A.ZIP <> '99999' OR                         
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '118' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'IQOS' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '118' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kuhn' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '118' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kühn' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '118' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = ': Ku' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '339' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'IQOS' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '339' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kuhn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '339' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kühn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '339' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = ': Ku' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '101' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'IQOS' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '101' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kuhn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '101' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kühn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '101' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = ': Ku' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'IQOS' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kuhn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kühn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = ': Ku' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '298' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = 'IQOS' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '298' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = 'Kuhn' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '298' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = 'Kühn' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '298' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = ': Ku' AND A.ZIP <> '99999' OR                         
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '118' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = 'IQOS' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '118' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = 'Kuhn' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '118' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = 'Kühn' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '118' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = ': Ku' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '339' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = 'IQOS' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '339' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = 'Kuhn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '339' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = 'Kühn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '339' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = ': Ku' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '101' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = 'IQOS' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '101' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = 'Kuhn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '101' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = 'Kühn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '101' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = ': Ku' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = 'IQOS' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = 'Kuhn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = 'Kühn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = ': Ku'

GROUP BY A.PARCELNO, dbo.DPDsc.Scan_code_CZ, dbo.DPDservice.Service_CZ, A.KN, A.REFERENCE, A.Source, dbo.Customer.Customer, dbo.Counter_View.ID, A.Customer, A.ZIP) as r  

where not left(r.DPDCUST, 4) = 'IQOS' AND NOT (left(r.DPDCUST, 4) = 'Kuhn') AND NOT(left(r.DPDCUST, 4) = 'Kühn') AND NOT(left(r.DPDCUST, 4) = ': Ku')  )

UPDATE dbo.PMIdB SET ZIP = '99999' WHERE ID = @InbID 

Set @X = @X + 1
IF (@Xsum = @X) BREAK;


END