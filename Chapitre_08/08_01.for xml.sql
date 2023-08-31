SELECT 
	Nom,
	Prenom
FROM Contact.Contact as Contact
FOR XML RAW ('Contact'), ROOT ('Contacts'), ELEMENTS;

SELECT 
	Nom,
	Prenom,
	Adresse1,
	Adresse2
FROM Contact.Contact as Contact
JOIN Contact.Adresse as Adresse 
	ON Contact.AdressePostaleId = Adresse.AdresseId
FOR XML AUTO, ROOT ('Contacts'), ELEMENTS;

