SELECT Nom,
	UPPER(Nom),
	LEFT(Nom, 1),
	SUBSTRING(Nom, 1, 1),
	LEN(Nom),
	TRIM(Nom),
	REPLACE(Nom, 'e', ''),
	TRANSLATE(Nom, 'יטא', 'eea'),
	CONCAT_WS(' ', Prenom, Nom, Email)
FROM Contact.Contact;