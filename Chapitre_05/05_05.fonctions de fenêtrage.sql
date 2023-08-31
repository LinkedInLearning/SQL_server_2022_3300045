SELECT 
	MONTH(f.DateFacture) as Mois, 
	YEAR(f.DateFacture) as Annee,
	SUM(f.MontantHT) as CA,
	SUM(SUM(f.MontantHT)) OVER (PARTITION BY YEAR(f.DateFacture))
FROM Inscription.Facture f
WHERE f.DateFacture IS NOT NULL
GROUP BY MONTH(f.DateFacture), YEAR(f.DateFacture)
ORDER BY Annee, Mois;