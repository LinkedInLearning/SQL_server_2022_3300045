DECLARE @coucou TABLE (
	id int PRIMARY KEY, 
	Nom varchar(50) INDEX nix01
)

BEGIN TRAN

INSERT INTO @coucou
SELECT ContactId, Nom FROM Contact.Contact

ROLLBACK

SELECT * FROM @coucou