SELECT 
	MONTH(f.DateFacture) as Mois, 
	YEAR(f.DateFacture) as Annee,
	SUM(f.MontantHT) as CA,
	SUM(SUM(f.MontantHT)) OVER annee,
	ROW_NUMBER() OVER annee_et_ordre,
	DENSE_RANK() OVER annee_et_ordre,
	LAG(SUM(f.MontantHT)) OVER (
		ORDER BY YEAR(f.DateFacture), MONTH(f.DateFacture)
	)
FROM Inscription.Facture f
WHERE f.DateFacture IS NOT NULL
GROUP BY MONTH(f.DateFacture), YEAR(f.DateFacture)
WINDOW annee AS (PARTITION BY YEAR(f.DateFacture)),
       annee_et_ordre AS (annee ORDER BY SUM(f.MontantHT) DESC)
ORDER BY Annee, Mois;