SELECT *
FROM Contact.Contact c
LEFT JOIN Contact.Adresse a 
	ON c.AdressePostaleId = a.AdresseId
WHERE a.AdresseId IS NULL

ALTER TABLE Contact.Contact
ADD CONSTRAINT fk_Contact_Reference_Adresse
FOREIGN KEY (AdressePostaleId) 
REFERENCES Contact.Adresse (AdresseId)
ON DELETE SET NULL
