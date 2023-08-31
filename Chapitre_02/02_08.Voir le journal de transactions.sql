-------------------------------------------
--    Voir le journal de transactions    --
-------------------------------------------
USE PachadataFormation;
GO

ALTER DATABASE PachadataFormation SET RECOVERY SIMPLE;
GO

CHECKPOINT;
GO

DBCC LOG (PachadataFormation);
GO

BEGIN TRAN

UPDATE TOP (10) Contact.Contact SET Nom = UPPER(Nom);
GO

ROLLBACK
