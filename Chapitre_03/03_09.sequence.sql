CREATE SEQUENCE Contact.ContactSequence
AS INT
START WITH 1
INCREMENT BY 1;

ALTER SEQUENCE Contact.ContactSequence
RESTART WITH 1;

CREATE SEQUENCE dbo.Cycle
AS TINYINT
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 100
CYCLE;

CREATE TABLE Contact.ContactEnMieux (
	ContactId int NOT NULL PRIMARY KEY 
		DEFAULT (NEXT VALUE FOR Contact.ContactSequence),
	Nom VARCHAR(50)
	-- etc.
)

-- ou
INSERT INTO Contact.ContactEnMieux 
	(ContactId, Nom)
VALUES
	(NEXT VALUE FOR Contact.ContactSequence, 'Lahmi'),
	(NEXT VALUE FOR Contact.ContactSequence, 'Podva');
	
