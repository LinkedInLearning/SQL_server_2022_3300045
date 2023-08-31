CREATE TABLE Contact.ContactJson (
	Document nvarchar(max) NOT NULL 
		CHECK ( 
			ISJSON(Document) = 1 
			AND JSON_PATH_EXISTS(Document, '$.Email') = 1
		)
);

INSERT INTO Contact.ContactJson
VALUES (
N'
{
    "InscriptionId": 3,
    "Prenom": "Marius",
    "Nom": "Dumont",
    "Ermail": "m.lambert@summerautoprotection.com",
    "Adresse1": "rue Moncey",
    "CodePostal": "21230",
    "Ville": "Saint-Pierre-en-Vaux",
    "Titre": "PostgreSQL 8 Avancé",
    "DateDebut": "2011-06-16"
}
'
)