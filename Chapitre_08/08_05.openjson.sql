DECLARE @json NVARCHAR(MAX) = N'{
        "InscriptionId": 7671,
        "Prenom": "Jeanne",
        "Nom": "Garcia",
        "Email": "j.garcia@100dayloans.com",
        "Adresse1": "rue Saint Denis",
        "CodePostal": "34290",
        "Ville": "Coulobres",
        "Titre": "MySQL 6.0 Développement",
        "DateDebut": "2012-01-10"
    }'

--SELECT *
--FROM OPENJSON(@json);

SELECT *
FROM OPENJSON(@json)
WITH (
	Prenom varchar(50) '$.Prenom',
	Nom    varchar(50) '$.Nom',
	Email varchar(100) '$.Email',
	CodePostal varchar(10) '$.CodePostal',
	Ville varchar(50) '$.Ville'
)
