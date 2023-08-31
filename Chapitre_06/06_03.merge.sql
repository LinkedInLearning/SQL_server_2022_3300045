SELECT * FROM Contact.ProspectUS

SELECT * FROM Contact.Contact

BEGIN TRAN

MERGE INTO Contact.Contact AS c
USING Contact.ProspectUS AS p
ON (c.Email = p.Email)
WHEN MATCHED THEN
	UPDATE SET Telephone = p.Tel
WHEN NOT MATCHED THEN
	INSERT (Nom, Prenom, Email, Telephone, 
	        AdressePostaleId)
	VALUES (p.Nom, p.Prenom, p.Email, p.Tel, 
	       (SELECT TOP 1 AdresseId FROM Contact.Adresse));

ROLLBACK