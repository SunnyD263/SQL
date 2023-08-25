Declare @InbID bigint, @WHSID bigint, @X int = 0, @Xsum int = 0, @PN bigint 



set @Xsum =( 
  select  count(Inb.PARCELNO) from ( SELECT
        A.parcelno
    FROM dbo.PMIdB AS A
    LEFT OUTER JOIN dbo.Counter_View ON A.PARCELNO = dbo.Counter_View.PARCELNO
    LEFT OUTER JOIN dbo.Customer ON A.REFERENCE = dbo.Customer.REFERENCE
    LEFT OUTER JOIN dbo.DPDservice ON A.SERVICE = dbo.DPDservice.ServiceId
    LEFT OUTER JOIN dbo.DPDsc ON A.SCAN_CODE = dbo.DPDsc.IdScan_code
    INNER JOIN
    (
        (
            SELECT
                IDMAX,
                Counter
            FROM
            (
                SELECT
                    MAX(EVENT_DATE_TIME) AS MAXDATE,
                    ID AS IDMAX,
                    PARCELNO,
                    COUNT(SCAN_CODE) AS Counter
                FROM dbo.PMIdB AS PMIdB_1
                WHERE (SCAN_CODE = '03')
                GROUP BY PARCELNO, ID
            ) AS B
        )
    ) AS C ON 
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '298' AND A.KN <> 'Inbound' AND  A.ZIP = '25301' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '118' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'IQOS' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '118' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kuhn' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '118' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kühn' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '118' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = ': Ku' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '118' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'MANU' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '118' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'OFFI' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '339' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'IQOS' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '339' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kuhn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '339' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kühn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '339' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = ': Ku' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '339' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'MANU' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '339' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'OFFI' OR                                                  
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '101' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'IQOS' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '101' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kuhn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '101' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kühn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '101' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = ': Ku' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '101' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'MANU' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '101' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'OFFI' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'IQOS' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kuhn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kühn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = ': Ku' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'MANU' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'OFFI' OR                                                          
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'IQOS' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '572' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kuhn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '572' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kühn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '572' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = ': Ku' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '572' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'MANU' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '572' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'OFFI' OR  
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '298' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27301' AND LEFT(A.Customer, 4) = 'Kuhn' AND A.ZIP <> '99999' OR
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
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = ': Ku' OR                        
                         SCAN_CODE = '10' AND Source = 'Packeta' AND KN <> 'Inbound' 
    GROUP BY A.PARCELNO, dbo.DPDsc.Scan_code_CZ, dbo.DPDservice.Service_CZ, A.KN, A.REFERENCE, A.Source, dbo.Customer.Customer, dbo.Counter_View.ID, A.Customer
) AS INB
JOIN
(
    SELECT *
    FROM [dbo].[PMIdB]
    WHERE (KN = 'Error')
    GROUP BY [ID],[PARCELNO],[SCAN_CODE],[EVENT_DATE_TIME],[SERVICE],[ZIP],[REFERENCE],[Customer],[Notice],[Field],[Source],[KN]
) AS WHS ON WHS.PARCELNO = INB.PARCELNO
)

WHILE (@Xsum >0 )
Begin

Set @InbID = (Select min(xx.[INBID]) FROM   ( Select Inb.ID as INBID, WHS.ID AS WHSID, Inb.PARCELNO as InbPN, Whs.PARCELNO as WHSPN from ( SELECT
        max(A.ID)as ID, a.PARCELNO
    FROM dbo.PMIdB AS A
    LEFT OUTER JOIN dbo.Counter_View ON A.PARCELNO = dbo.Counter_View.PARCELNO
    LEFT OUTER JOIN dbo.Customer ON A.REFERENCE = dbo.Customer.REFERENCE
    LEFT OUTER JOIN dbo.DPDservice ON A.SERVICE = dbo.DPDservice.ServiceId
    LEFT OUTER JOIN dbo.DPDsc ON A.SCAN_CODE = dbo.DPDsc.IdScan_code
    INNER JOIN
    (
        (
            SELECT
                IDMAX,
                Counter
            FROM
            (
                SELECT
                    MAX(EVENT_DATE_TIME) AS MAXDATE,
                    ID AS IDMAX,
                    PARCELNO,
                    COUNT(SCAN_CODE) AS Counter
                FROM dbo.PMIdB AS PMIdB_1
                WHERE (SCAN_CODE = '03')
                GROUP BY PARCELNO, ID
            ) AS B
        )
    ) AS C ON 
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '298' AND A.KN <> 'Inbound' AND A.ZIP = '25301' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '118' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'IQOS' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '118' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kuhn' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '118' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kühn' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '118' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = ': Ku' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '118' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'MANU' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '118' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'OFFI' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '339' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'IQOS' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '339' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kuhn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '339' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kühn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '339' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = ': Ku' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '339' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'MANU' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '339' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'OFFI' OR                                                  
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '101' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'IQOS' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '101' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kuhn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '101' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kühn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '101' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = ': Ku' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '101' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'MANU' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '101' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'OFFI' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'IQOS' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kuhn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kühn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = ': Ku' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'MANU' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'OFFI' OR                                                          
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'IQOS' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '572' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kuhn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '572' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kühn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '572' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = ': Ku' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '572' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'MANU' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '572' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'OFFI' OR  
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '298' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27301' AND LEFT(A.Customer, 4) = 'Kuhn' AND A.ZIP <> '99999' OR
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
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = ': Ku' OR                        
                         SCAN_CODE = '10' AND Source = 'Packeta' AND KN <> 'Inbound' 
    GROUP BY A.PARCELNO, dbo.DPDsc.Scan_code_CZ, dbo.DPDservice.Service_CZ, A.KN, A.REFERENCE, A.Source, dbo.Customer.Customer, dbo.Counter_View.ID, A.Customer
) AS INB
JOIN
(
    SELECT *
    FROM [dbo].[PMIdB]
    WHERE (KN = 'Error')
    GROUP BY [ID],[PARCELNO],[SCAN_CODE],[EVENT_DATE_TIME],[SERVICE],[ZIP],[REFERENCE],[Customer],[Notice],[Field],[Source],[KN]
) AS WHS ON WHS.PARCELNO = INB.PARCELNO
) as XX)

Set @WHSID = (Select xx.[WHSID] FROM (Select Inb.ID as INBID, WHS.ID AS WHSID, Inb.PARCELNO as InbPN, Whs.PARCELNO as WHSPN From
(SELECT * FROM [dbo].[PMIdB] WHERE                      
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '298' AND A.KN <> 'Inbound' AND A.ZIP = '25301' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '118' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'IQOS' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '118' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kuhn' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '118' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kühn' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '118' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = ': Ku' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '118' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'MANU' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '118' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'OFFI' AND A.ZIP <> '99999' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '339' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'IQOS' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '339' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kuhn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '339' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kühn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '339' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = ': Ku' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '339' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'MANU' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '339' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'OFFI' OR                                                  
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '101' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'IQOS' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '101' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kuhn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '101' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kühn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '101' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = ': Ku' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '101' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'MANU' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '101' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'OFFI' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'IQOS' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kuhn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kühn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = ': Ku' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'MANU' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'OFFI' OR                                                          
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'IQOS' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '572' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kuhn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '572' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'Kühn' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '572' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = ': Ku' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '572' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'MANU' OR
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '572' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '25301' AND LEFT(A.Customer, 4) = 'OFFI' OR  
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '298' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27301' AND LEFT(A.Customer, 4) = 'Kuhn' AND A.ZIP <> '99999' OR
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
                         C.IDMAX = A.ID AND A.SCAN_CODE = '03' AND A.SERVICE = '327' AND A.KN <> 'Inbound' AND dbo.Counter_View.ID = A.ID AND A.ZIP = '27351' AND LEFT(A.Customer, 4) = ': Ku' OR        
                        SCAN_CODE = '10' AND Source = 'Packeta' AND KN <> 'Inbound' 
                          
Group by [ID],[PARCELNO],[SCAN_CODE],[EVENT_DATE_TIME],[SERVICE],[ZIP],[REFERENCE],[Customer],[Notice],[Field],[Source],[KN] ) As INB
JOIN (SELECT * FROM [dbo].[PMIdB] WHERE (KN = 'Error') 
Group by [ID],[PARCELNO],[SCAN_CODE],[EVENT_DATE_TIME],[SERVICE],[ZIP],[REFERENCE],[Customer],[Notice],[Field],[Source],[KN] ) As WHS
ON  WHS.PARCELNO = INB.PARCELNO) as XX WHERE xx.[INBID] = @WHSID) 

UPDATE dbo.PMIdB SET KN = 'Inbound' WHERE ID = @InbID
UPDATE dbo.PMIdB SET KN = '', SCAN_CODE = '501' WHERE ID= @WHSID 

Set @X = @X + 1
IF (@Xsum = @X) BREAK;
END