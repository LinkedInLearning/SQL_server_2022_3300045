CREATE TABLE dbo.Commentaire1 (commentaire varchar(100))
CREATE TABLE dbo.Commentaire2 (commentaire varchar(100) COLLATE Hungarian_CI_AS)

INSERT INTO dbo.Commentaire1
VALUES ('Test product'), ('Teszt product')

INSERT INTO dbo.Commentaire2
VALUES ('Test product'), ('Teszt product')

SELECT * 
FROM dbo.Commentaire1
WHERE commentaire LIKE '%tes%'

SELECT * 
FROM dbo.Commentaire2
WHERE commentaire LIKE '%tes%'

SELECT * 
FROM dbo.Commentaire2 c2
JOIN dbo.Commentaire1 c1 
	ON c2.commentaire COLLATE SQL_Latin1_General_CP1_CI_AS = c1.commentaire