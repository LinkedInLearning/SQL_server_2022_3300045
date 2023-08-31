SELECT 
	Nom as [Nom.NomDeFamille],
	Prenom as [Nom.Prenom],
	Adresse1,
	Adresse2
FROM Contact.Contact as Contact
JOIN Contact.Adresse as Adresse ON Contact.AdressePostaleId = Adresse.AdresseId
FOR JSON PATH, ROOT ('Contacts');