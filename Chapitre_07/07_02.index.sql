SELECT *
FROM Contact.ProspectUS
WHERE Email = 'hyvbvx635@bcgqgn.yvzwpz.com';

CREATE INDEX nix_ProspectUS_Email
ON Contact.ProspectUS (Email)
--WITH (DATA_COMPRESSION = ROW)