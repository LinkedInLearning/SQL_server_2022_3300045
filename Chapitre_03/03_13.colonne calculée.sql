CREATE TABLE LigneFacture
(
	Quantite tinyint NOT NULL DEFAULT(1),
	PrixUnitaire decimal(10,2) NOT NULL,
	PrixTotal AS Quantite * PrixUnitaire PERSISTED
)
GO

SELECT *
FROM LigneFacture
WHERE PrixTotal = 34.90