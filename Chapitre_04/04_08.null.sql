SELECT TOP 10
	Nom, Prenom, Email,
	Prenom + ' ' + Nom + ' (' + COALESCE(Email, '') + ')' as NomComplet,
	CONCAT(Prenom, ' ', Nom, ' (' + Email + ')') as NomComplet2
FROM Contact.Contact
