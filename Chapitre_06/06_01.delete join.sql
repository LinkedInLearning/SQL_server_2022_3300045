DELETE Contact.ProspectUS
WHERE Email IN (SELECT Email FROM Contact.Contact);

DELETE FROM p
FROM Contact.ProspectUS p
JOIN Contact.Contact c ON p.Email = c.Email

UPDATE p
SET Nom = c.Nom
FROM Contact.ProspectUS p
JOIN Contact.Contact c ON p.Email = c.Email
