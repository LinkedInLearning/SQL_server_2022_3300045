SELECT 
	DateCreation,
	DateFacture,
	FORMAT(DateFacture, 'd', 'fr-FR'),
	YEAR(DateFacture),
	MONTH(DateFacture),
	DAY(DateFacture),
	DATEPART(week, DateFacture),
	DATEADD(day, 30, DateFacture),
	DATEDIFF(year, DateFacture, CURRENT_TIMESTAMP)
FROM Inscription.Facture;