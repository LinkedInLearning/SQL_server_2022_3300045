CREATE TABLE dbo.Commande
(
	CommandeId int identity(1,1) NOT NULL PRIMARY KEY, 
	Description varchar(200) NOT NULL,
	_DateDebut DATETIME2 GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
	_DateFin DATETIME2 GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
	PERIOD FOR SYSTEM_TIME (_DateDebut, _DateFin)
)
WITH (SYSTEM_VERSIONING = ON);
GO

INSERT INTO dbo.Commande (Description) VALUES ('Produits dangereux');
GO

UPDATE dbo.Commande 
SET Description = 'Produits merveilleux'
WHERE CommandeId = 1;
GO

UPDATE dbo.Commande 
SET Description = 'Produits indispensables'
WHERE CommandeId = 1;
GO


SELECT *, _DateDebut, _DateFin
FROM dbo.Commande

