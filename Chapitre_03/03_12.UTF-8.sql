SELECT TOP 1 email, DATALENGTH(email) FROM [Contact].[ProspectUS];
SELECT TOP 1 email, DATALENGTH(email) FROM [Contact].[ProspectUS_N];

SELECT Name, Description FROM fn_helpcollations() 
WHERE Name like 'French_100_CI_AI_SC%';

SELECT Name, Description FROM fn_helpcollations() 
WHERE Name like 'French%UTF8';

SELECT Name, Description FROM fn_helpcollations() 
WHERE Name like 'Latin%CI_AI_SC%';
GO

USE PachaDataFormation;
GO

SELECT Email
FROM Contact.ProspectUS
GO

DROP TABLE IF EXISTS Contact.TestUTF8;
GO

CREATE TABLE Contact.TestUTF8
(
	Email_Win_UTF16 NVARCHAR(100) COLLATE French_100_CI_AI_SC,
	Email_Win_UTF8   VARCHAR(100) COLLATE French_100_CI_AI_SC_UTF8,
	Email_Win        VARCHAR(100) COLLATE French_100_CI_AI_SC
)
GO

INSERT INTO Contact.TestUTF8
SELECT Email, Email, Email
FROM Contact.ProspectUS;
GO

SELECT 
	Email_Win_UTF16, 
	DATALENGTH(Email_Win_UTF16) as UTF16, 
	DATALENGTH(Email_Win_UTF8)  as UTF8,
	DATALENGTH(Email_Win)   as [varchar] 
FROM Contact.TestUTF8;

SET ANSI_WARNINGS OFF;

INSERT INTO Contact.TestUTF8
VALUES (
	N'世尊成道已，作是思惟：離欲寂靜，是最為勝。住大禪定，降諸魔道。於鹿野苑中',
	N'世尊成道已，作是思惟：離欲寂靜，是最為勝。住大禪定，降諸魔道。於鹿野苑中',
	N'世尊成道已，作是思惟：離欲寂靜，是最為勝。住大禪定，降諸魔道。於鹿野苑中'
	)
GO

SET ANSI_WARNINGS ON;
GO

SELECT 
	*,
	DATALENGTH(Email_Win_UTF16) as UTF16, 
	DATALENGTH(Email_Win_UTF8)  as UTF8,
	DATALENGTH(Email_Win)   as [varchar]
FROM Contact.TestUTF8
WHERE Email_Win_UTF16 LIKE N'世%';
GO

