USE PachadataFormation;
GO

SELECT
	c.ContactId,
	i.InscriptionId,
	c.Prenom,
	c.Nom,
	c.Email,
	a.Adresse1,
	v.CodePostal,
	v.NomVille as Ville,
	sl.Titre,
	s.DateDebut
INTO #matable
FROM Inscription.Inscription i
JOIN Contact.Contact c ON i.ContactId = c.ContactId
JOIN Contact.Adresse a 
	ON c.AdressePostaleId = a.AdresseId
JOIN Reference.ville v ON a.VilleId = v.VilleId
JOIN Stage.Session s ON i.SessionId = s.SessionId
JOIN Stage.StageLangue sl 
	ON s.StageId = sl.StageId
	AND s.LangueCd = sl.LangueCd

SELECT *
FROM #matable
