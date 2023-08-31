USE [PachadataFormation]
GO
CREATE SYNONYM [dbo].[Personne] 
FOR [PachadataFormation].[Contact].[Contact]
GO

SELECT *
FROM dbo.Personne