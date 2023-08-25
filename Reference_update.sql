use dpd_db
UPDATE dbo.PMIdB SET Reference = A.REF from (select (parcelno) as PN, (Reference) as Ref from PD4) As A  WHERE PARCELNO = A.PN
UPDATE dbo.PMIdB SET Reference = A.REF from (select (parcelno) as PN, (Reference) as Ref from PD2) As A  WHERE PARCELNO = A.PN  
go