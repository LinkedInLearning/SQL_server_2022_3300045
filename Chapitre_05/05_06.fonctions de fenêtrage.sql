-- DSL
SELECT 
	MONTH(f.DateFacture) as Mois, 
	YEAR(f.DateFacture) as Annee,
	SUM(f.MontantHT) as CA,
	SUM(SUM(f.MontantHT)) OVER (PARTITION BY YEAR(f.DateFacture)),
	ROW_NUMBER() OVER (
		PARTITION BY YEAR(f.DateFacture)
		ORDER BY SUM(f.MontantHT) DESC),
	DENSE_RANK() OVER (
		PARTITION BY YEAR(f.DateFacture)
		ORDER BY SUM(f.MontantHT) DESC),
	LAG(SUM(f.MontantHT)) OVER (
		ORDER BY YEAR(f.DateFacture), MONTH(f.DateFacture)
	)
FROM Inscription.Facture f
WHERE f.DateFacture IS NOT NULL
GROUP BY MONTH(f.DateFacture), YEAR(f.DateFacture)
ORDER BY Annee, Mois;