SELECT 
	ContactId AS [@ContactId],
	Nom AS [Nom/NomDeFamille],
	Prenom AS [Nom/Prenom],
	'Pas de surnom' AS [Nom/text()],
	(SELECT InscriptionId AS [data()]
		FROM Inscription.Inscription AS i 
		WHERE i.ContactId = Contact.ContactId 
		FOR XML PATH ('')) as [Inscriptions],
	Adresse1,
	Adresse2
FROM Contact.Contact as Contact
JOIN Contact.Adresse as Adresse 
	ON Contact.AdressePostaleId = Adresse.AdresseId
FOR XML PATH ('Contact'), ROOT ('Contacts'), ELEMENTS;