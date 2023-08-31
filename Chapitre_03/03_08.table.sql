CREATE TABLE Personne
(
	PersonneId int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	Nom VARCHAR(50),
	--NoSecu VARCHAR(50) NOT NULL UNIQUE,
	DateDeNaissance DATE CHECK (DateDeNaissance > '1900-01-01'),
	EstClient bit NOT NULL DEFAULT (0),
	TauxJournalier decimal(5,2),
	Commentaire NVARCHAR(MAX), -- LOB, --> TEXT
	Photo VARBINARY(MAX) -- BLOB --> IMAGE
)
WITH (DATA_COMPRESSION = ROW)

