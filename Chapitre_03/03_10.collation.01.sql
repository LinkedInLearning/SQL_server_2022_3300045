CREATE TABLE dbo.Prospect (
	Nom varchar(50) NOT NULL,
	Prenom varchar(50) NOT NULL
)

INSERT INTO dbo.Prospect
VALUES
	('H�ro', 'C�line'),
	('Hero', 'CELINE'),
	('H�RO', 'Celine'),
	('HERO', 'C�LINE');

SELECT *
FROM dbo.Prospect
WHERE Nom COLLATE SQL_Latin1_General_CP1_CI_AI = 'HERO'

