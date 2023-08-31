SET NOCOUNT ON;
SET STATISTICS IO OFF;
GO

USE master;
GO

IF EXISTS (SELECT * FROM sys.databases WHERE name = N'Movies')
	ALTER DATABASE Movies SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO

DROP DATABASE IF EXISTS Movies;
GO

CREATE DATABASE Movies;
GO
ALTER DATABASE [Movies] SET RECOVERY SIMPLE WITH NO_WAIT;
GO

USE Movies;
GO

CREATE TABLE dbo.Movie
(
	MoviesId int identity(1,1) primary key nonclustered,
	Title varchar(100) not null unique,
	Released int,
	Tagline varchar(1000)
) AS NODE;
GO

CREATE TABLE dbo.Person
(
	PersonId int identity(1,1) primary key,
	PersonName varchar(100) not null unique,
	born int
) AS NODE;
GO

CREATE TABLE dbo.ActedIn
(
	RoleInMovie varchar(100)
) AS EDGE;
GO

CREATE TABLE dbo.Directed AS EDGE;
CREATE TABLE dbo.Produced AS EDGE;
CREATE TABLE dbo.Wrote AS EDGE;
GO

INSERT INTO dbo.Movie (Title, Released, Tagline) VALUES ('The Matrix', 1999, 'Welcome to the Real World');
INSERT INTO dbo.Person (PersonName, born) VALUES ('Keanu Reeves',1964)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Carrie-Anne Moss', 1967)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Laurence Fishburne', 1961)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Hugo Weaving', 1960)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Lilly Wachowski', 1967)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Lana Wachowski', 1965)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Joel Silver', 1952)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Emil Eifrem', 1978)

INSERT INTO dbo.ActedIn 
VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Keanu Reeves'), 
       (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Matrix'),'Neo');

INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Carrie-Anne Moss'), 
       (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Matrix'),'Trinity');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Laurence Fishburne'), 
       (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Matrix'),'Morpheus');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Hugo Weaving'), 
       (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Matrix'),'Agent Smith');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Emil Eifrem'), 
       (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Matrix'),'Emil');

INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Lilly Wachowski'), 
       (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Matrix'));
INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Lana Wachowski'), 
       (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Matrix'));
INSERT INTO dbo.Produced VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Joel Silver'), 
       (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Matrix'));


INSERT INTO dbo.Movie (Title, Released, Tagline) VALUES ('The Matrix Reloaded', 2003, 'Free your mind')

INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Keanu Reeves'), 
       (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Matrix Reloaded'),'Neo');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Carrie-Anne Moss'), 
       (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Matrix Reloaded'),'Trinity');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Laurence Fishburne'), 
       (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Matrix Reloaded'),'Morpheus');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Hugo Weaving'), 
       (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Matrix Reloaded'),'Agent Smith');

INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Lilly Wachowski'), 
       (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Matrix Reloaded'));
INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Lana Wachowski'), 
       (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Matrix Reloaded'));
INSERT INTO dbo.Produced VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Joel Silver'), 
       (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Matrix Reloaded'));

INSERT INTO dbo.Movie (Title, Released, Tagline) VALUES ('The Matrix Revolutions', 2003, 'Everything that has a beginning has an end')

INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Keanu Reeves'), 
       (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Matrix Revolutions'),'Neo');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Carrie-Anne Moss'), 
       (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Matrix Revolutions'),'Trinity');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Laurence Fishburne'), 
       (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Matrix Revolutions'),'Morpheus');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Hugo Weaving'), 
       (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Matrix Revolutions'),'Agent Smith');

INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Lilly Wachowski'), 
       (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Matrix Revolutions'));
INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Lana Wachowski'), 
       (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Matrix Revolutions'));
INSERT INTO dbo.Produced VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Joel Silver'), 
       (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Matrix Revolutions'));


INSERT INTO dbo.Movie (Title, Released, Tagline) VALUES ('The Devil''s Advocate', 1997, 'Evil has its winning ways')
INSERT INTO dbo.Person (PersonName, born) VALUES ('Charlize Theron', 1975)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Al Pacino', 1940)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Taylor Hackford', 1944)

INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Keanu Reeves'), 
       (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Devil''s Advocate'),'Kevin Lomax');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Charlize Theron'), 
       (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Devil''s Advocate'),'Mary Ann Lomax');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Al Pacino'), 
       (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Devil''s Advocate'),'John Milton');

INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Taylor Hackford'), 
       (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Devil''s Advocate'));


INSERT INTO dbo.Movie (Title, Released, Tagline) VALUES ('A Few Good Men', 1992, 'In the heart of the nation''s capital, in a courthouse of the U.S. government, one man will stop at nothing to keep his honor, and one will stop at nothing to find the truth.')
INSERT INTO dbo.Person (PersonName, born) VALUES ('Tom Cruise', 1962)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Jack Nicholson', 1937)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Demi Moore', 1962)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Kevin Bacon', 1958)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Kiefer Sutherland', 1966)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Noah Wyle', 1971)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Cuba Gooding Jr.', 1968)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Kevin Pollak', 1957)
INSERT INTO dbo.Person (PersonName, born) VALUES ('J.T. Walsh', 1943)
INSERT INTO dbo.Person (PersonName, born) VALUES ('James Marshall', 1967)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Christopher Guest', 1948)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Rob Reiner', 1947)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Aaron Sorkin', 1961)

INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Keanu Reeves'), 
       (SELECT $node_id FROM dbo.Movie WHERE Title = 'A Few Good Men'),'Kevin Lomax');

INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Tom Cruise'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'A Few Good Men'), 'Lt. Daniel Kaffee');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Jack Nicholson'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'A Few Good Men'), 'Col. Nathan R. Jessup');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Demi Moore'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'A Few Good Men'), 'Lt. Cdr. JoAnne Galloway');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Kevin Bacon'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'A Few Good Men'), 'Capt. Jack Ross');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Kiefer Sutherland'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'A Few Good Men'), 'Lt. Jonathan Kendrick');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Noah Wyle'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'A Few Good Men'), 'Cpl. Jeffrey Barnes');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Cuba Gooding Jr.'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'A Few Good Men'), 'Cpl. Carl Hammaker');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Kevin Pollak'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'A Few Good Men'), 'Lt. Sam Weinberg');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'J.T. Walsh'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'A Few Good Men'), 'Lt. Col. Matthew Andrew Markinson');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'James Marshall'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'A Few Good Men'), 'Pfc. Louden Downey');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Christopher Guest'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'A Few Good Men'), 'Dr. Stone');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Aaron Sorkin'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'A Few Good Men'), 'Man in Bar');

INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Rob Reiner'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'A Few Good Men'));
INSERT INTO dbo.Wrote VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Aaron Sorkin'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'A Few Good Men'));


INSERT INTO dbo.Movie (Title, Released, Tagline) VALUES ('Top Gun', 1986, 'I feel the need, the need for speed.')
INSERT INTO dbo.Person (PersonName, born) VALUES ('Kelly McGillis', 1957)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Val Kilmer', 1959)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Anthony Edwards', 1962)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Tom Skerritt', 1933)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Meg Ryan', 1961)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Tony Scott', 1944)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Jim Cash', 1941)

INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Tom Cruise'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Top Gun'), 'Maverick');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Kelly McGillis'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Top Gun'), 'Charlie');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Val Kilmer'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Top Gun'), 'Iceman');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Anthony Edwards'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Top Gun'), 'Goose');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Tom Skerritt'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Top Gun'), 'Viper');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Meg Ryan'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Top Gun'), 'Carole');


INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Tony Scott'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Top Gun'));
INSERT INTO dbo.Wrote VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Jim Cash'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Top Gun'));

INSERT INTO dbo.Movie (Title, Released, Tagline) VALUES ('Jerry Maguire', 2000, 'The rest of his life begins now.')
INSERT INTO dbo.Person (PersonName, born) VALUES ('Renee Zellweger', 1969)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Kelly Preston', 1962)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Jerry O''Connell', 1974)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Jay Mohr', 1970)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Bonnie Hunt', 1961)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Regina King', 1971)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Jonathan Lipnicki', 1996)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Cameron Crowe', 1957)

INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Tom Cruise'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Jerry Maguire'), 'Jerry Maguire');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Cuba Gooding Jr.'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Jerry Maguire'), 'Rod Tidwell');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Renee Zellweger'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Jerry Maguire'), 'Dorothy Boyd');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Kelly Preston'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Jerry Maguire'), 'Avery Bishop');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Jerry O''Connell'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Jerry Maguire'), 'Frank Cushman');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Jay Mohr'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Jerry Maguire'), 'Bob Sugar');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Bonnie Hunt'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Jerry Maguire'), 'Laurel Boyd');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Regina King'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Jerry Maguire'), 'Marcee Tidwell');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Jonathan Lipnicki'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Jerry Maguire'), 'Ray Boyd');

INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Cameron Crowe'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Jerry Maguire'));
INSERT INTO dbo.Produced VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Cameron Crowe'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Jerry Maguire'));
INSERT INTO dbo.Wrote VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Cameron Crowe'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Jerry Maguire'));

INSERT INTO dbo.Movie (Title, Released, Tagline) VALUES ('Stand By Me', 1986, 'For some, it''s the last real taste of innocence, and the first real taste of life. But for everyone, it''s the time that memories are made of.')
INSERT INTO dbo.Person (PersonName, born) VALUES ('River Phoenix', 1970)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Corey Feldman', 1971)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Wil Wheaton', 1972)
INSERT INTO dbo.Person (PersonName, born) VALUES ('John Cusack', 1966)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Marshall Bell', 1942)

INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Wil Wheaton'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Stand By Me'), 'Gordie Lachance');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'River Phoenix'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Stand By Me'), 'Chris Chambers');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Jerry O''Connell'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Stand By Me'), 'Vern Tessio');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Corey Feldman'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Stand By Me'), 'Teddy Duchamp');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'John Cusack'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Stand By Me'), 'Denny Lachance');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Kiefer Sutherland'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Stand By Me'), 'Ace Merrill');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Marshall Bell'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Stand By Me'), 'Mr. Lachance');

INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Rob Reiner'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Stand By Me'));

INSERT INTO dbo.Movie (Title, Released, Tagline) VALUES ('As Good as It Gets', 1997, 'A comedy from the heart that goes for the throat.')
INSERT INTO dbo.Person (PersonName, born) VALUES ('Helen Hunt', 1963)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Greg Kinnear', 1963)
INSERT INTO dbo.Person (PersonName, born) VALUES ('James L. Brooks', 1940)

INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Jack Nicholson'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'As Good as It Gets'), 'Melvin Udall');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Helen Hunt'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'As Good as It Gets'), 'Carol Connelly');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Greg Kinnear'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'As Good as It Gets'), 'Simon Bishop');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Cuba Gooding Jr.'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'As Good as It Gets'), 'Frank Sachs');

INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'James L. Brooks'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'As Good as It Gets'));

INSERT INTO dbo.Movie (Title, Released, Tagline) VALUES ('What Dreams May Come', 1998, 'After life there is more. The end is just the beginning.')
INSERT INTO dbo.Person (PersonName, born) VALUES ('Annabella Sciorra', 1960)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Max von Sydow', 1929)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Werner Herzog', 1942)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Robin Williams', 1951)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Vincent Ward', 1956)

INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Robin Williams'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'What Dreams May Come'), 'Chris Nielsen');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Cuba Gooding Jr.'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'What Dreams May Come'), 'Albert Lewis');

INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Annabella Sciorra'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'What Dreams May Come'), 'Annie Collins-Nielsen');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Max von Sydow'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'What Dreams May Come'),'The Tracker');
INSERT INTO dbo.ActedIn VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Werner Herzog'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'What Dreams May Come'), 'The Face');

INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Vincent Ward'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'What Dreams May Come'));

INSERT INTO dbo.Movie (Title, Released, Tagline) VALUES ('Snow Falling on Cedars', 1999, 'First loves last. Forever.')
INSERT INTO dbo.Person (PersonName, born) VALUES ('Ethan Hawke', 1970)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Rick Yune', 1971)
INSERT INTO dbo.Person (PersonName, born) VALUES ('James Cromwell', 1940)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Scott Hicks', 1953)

INSERT INTO dbo.ActedIn VALUES 
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Ethan Hawke'),
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Snow Falling on Cedars'), 'Ishmael Chambers'),

  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Rick Yune'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Snow Falling on Cedars'), 'Kazuo Miyamoto'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Max von Sydow'),
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Snow Falling on Cedars'), 'Nels Gudmundsson'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'James Cromwell'),
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Snow Falling on Cedars'), 'Judge Fielding');

INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Scott Hicks'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Snow Falling on Cedars'));
		
INSERT INTO dbo.Movie (Title, Released, Tagline) VALUES ('You''ve Got Mail', 1998, 'At odds in life... in love on-line.')
INSERT INTO dbo.Person (PersonName, born) VALUES ('Parker Posey', 1968)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Dave Chappelle', 1973)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Steve Zahn', 1967)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Tom Hanks', 1956)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Nora Ephron', 1941)

INSERT INTO dbo.ActedIn VALUES 
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Tom Hanks'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'You''ve Got Mail'), 'Joe Fox'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Meg Ryan'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'You''ve Got Mail'), 'Kathleen Kelly'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Greg Kinnear'),
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'You''ve Got Mail'), 'Frank Navasky'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Parker Posey'),
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'You''ve Got Mail'), 'Patricia Eden'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Dave Chappelle'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'You''ve Got Mail'), 'Kevin Jackson'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Steve Zahn'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'You''ve Got Mail'), 'George Pappas')

INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Nora Ephron'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'You''ve Got Mail'));

INSERT INTO dbo.Movie (Title, Released, Tagline) VALUES ('Sleepless in Seattle', 1993, 'What if someone you never met, someone you never saw, someone you never knew was the only someone for you?')
INSERT INTO dbo.Person (PersonName, born) VALUES ('Rita Wilson', 1956)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Bill Pullman', 1953)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Victor Garber', 1949)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Rosie O''Donnell', 1962)

INSERT INTO dbo.ActedIn VALUES 
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Tom Hanks'),
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Sleepless in Seattle'), 'Sam Baldwin'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Meg Ryan'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Sleepless in Seattle'), 'Annie Reed'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Rita Wilson'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Sleepless in Seattle'), 'Suzy'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Bill Pullman'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Sleepless in Seattle'), 'Walter'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Victor Garber'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Sleepless in Seattle'), 'Greg'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Rosie O''Donnell'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Sleepless in Seattle'), 'Becky');

INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Nora Ephron'),
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Sleepless in Seattle'));

INSERT INTO dbo.Movie (Title, Released, Tagline) VALUES ('Joe Versus the Volcano', 1990, 'A story of love, lava and burning desire.')
INSERT INTO dbo.Person (PersonName, born) VALUES ('John Patrick Stanley', 1950)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Nathan Lane', 1956)

INSERT INTO dbo.ActedIn VALUES 
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Tom Hanks'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Joe Versus the Volcano'), 'Joe Banks'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Meg Ryan'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Joe Versus the Volcano'), 'DeDe'), 
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Meg Ryan'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Joe Versus the Volcano'), 'Angelica Graynamore'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Meg Ryan'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Joe Versus the Volcano'), 'Patricia Graynamore'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Nathan Lane'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Joe Versus the Volcano'), 'Baw');

INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'John Patrick Stanley'),
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Joe Versus the Volcano'));

INSERT INTO dbo.Movie (Title, Released, Tagline) VALUES ('When Harry Met Sally', 1998, 'At odds in life... in love on-line.')
INSERT INTO dbo.Person (PersonName, born) VALUES ('Billy Crystal', 1948)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Carrie Fisher', 1956)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Bruno Kirby', 1949)

INSERT INTO dbo.ActedIn VALUES 
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Billy Crystal'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'When Harry Met Sally'), 'Harry Burns'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Meg Ryan'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'When Harry Met Sally'), 'Sally Albright'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Carrie Fisher'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'When Harry Met Sally'), 'Marie'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Bruno Kirby'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'When Harry Met Sally'), 'Jess');

INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Rob Reiner'),
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'When Harry Met Sally'));
INSERT INTO dbo.Produced VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Rob Reiner'),
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'When Harry Met Sally'));
INSERT INTO dbo.Produced VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Nora Ephron'),
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'When Harry Met Sally'));
INSERT INTO dbo.Wrote VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Nora Ephron'),
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'When Harry Met Sally'));

INSERT INTO dbo.Movie (Title, Released, Tagline) VALUES ('That Thing You Do', 1996, 'In every life there comes a time when that thing you dream becomes that thing you do')
INSERT INTO dbo.Person (PersonName, born) VALUES ('Liv Tyler', 1977)
INSERT INTO dbo.ActedIn VALUES 
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Tom Hanks'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'That Thing You Do'), 'Mr. White'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Liv Tyler'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'That Thing You Do'), 'Faye Dolan'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Charlize Theron'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'That Thing You Do'), 'Tina');

INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Tom Hanks'),
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'That Thing You Do'));

INSERT INTO dbo.Movie (Title, Released, Tagline) VALUES ('The Replacements', 2000, 'Pain heals, Chicks dig scars... Glory lasts forever');
INSERT INTO dbo.Person (PersonName, born) VALUES ('Brooke Langton', 1970);
INSERT INTO dbo.Person (PersonName, born) VALUES ('Gene Hackman', 1930);
INSERT INTO dbo.Person (PersonName, born) VALUES ('Orlando Jones', 1968);
INSERT INTO dbo.Person (PersonName, born) VALUES ('Howard Deutch', 1950);

INSERT INTO dbo.ActedIn VALUES 
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Keanu Reeves'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Replacements'), 'Shane Falco'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Brooke Langton'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Replacements'), 'Annabelle Farrell'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Gene Hackman'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Replacements'), 'Jimmy McGinty'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Orlando Jones'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Replacements'), 'Clifford Franklin');

INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Howard Deutch'),
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Replacements'));

INSERT INTO dbo.Movie (Title, Released, Tagline) VALUES ('RescueDawn', 2006, 'Based on the extraordinary true story of one man''s fight for freedom')
INSERT INTO dbo.Person (PersonName, born) VALUES ('Christian Bale', 1974)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Zach Grenier', 1954)

INSERT INTO dbo.ActedIn VALUES 
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Marshall Bell'),
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'RescueDawn'), 'Admiral'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Christian Bale'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'RescueDawn'), 'Dieter Dengler'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Zach Grenier'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'RescueDawn'), 'Squad Leader'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Steve Zahn'),
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'RescueDawn'), 'Duane')

INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Werner Herzog'),
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'RescueDawn'));

INSERT INTO dbo.Movie (Title, Released, Tagline) VALUES ('The Birdcage', 1996, 'Come as you are')
INSERT INTO dbo.Person (PersonName, born) VALUES ('Mike Nichols', 1931)
INSERT INTO dbo.ActedIn VALUES 
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Robin Williams'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Birdcage'), 'Armand Goldman'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Nathan Lane'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Birdcage'), 'Albert Goldman'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Gene Hackman'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Birdcage'), 'Sen. Kevin Keeley')

INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Mike Nichols'),
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Birdcage'));

INSERT INTO dbo.Movie (Title, Released, Tagline) VALUES ('Unforgiven', 1992, 'It''s a hell of a thing, killing a man')
INSERT INTO dbo.Person (PersonName, born) VALUES ('Richard Harris', 1930)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Clint Eastwood', 1930)
INSERT INTO dbo.ActedIn VALUES 
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Richard Harris'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Unforgiven'), 'English Bob'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Clint Eastwood'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Unforgiven'), 'Bill Munny'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Gene Hackman'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Unforgiven'), 'Little Bill Daggett')

INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Clint Eastwood'),
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Unforgiven'));

INSERT INTO dbo.Movie (Title, Released, Tagline) VALUES ('Johnny Mnemonic', 1995, 'The hottest data on earth. In the coolest head in town')
INSERT INTO dbo.Person (PersonName, born) VALUES ('Takeshi Kitano', 1947)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Dina Meyer', 1968)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Ice-T', 1958)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Robert Longo', 1953)
INSERT INTO dbo.ActedIn VALUES 
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Keanu Reeves'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Johnny Mnemonic'), 'Johnny Mnemonic'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Takeshi Kitano'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Johnny Mnemonic'), 'Takahashi'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Dina Meyer'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Johnny Mnemonic'), 'Jane'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Ice-T'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Johnny Mnemonic'), 'J-Bone')

INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Robert Longo'),
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Johnny Mnemonic'));

INSERT INTO dbo.Movie (Title, Released, Tagline) VALUES ('Cloud Atlas', 2012, 'Everything is connected')
INSERT INTO dbo.Person (PersonName, born) VALUES ('Halle Berry', 1966)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Jim Broadbent', 1949)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Tom Tykwer', 1965)
INSERT INTO dbo.Person (PersonName, born) VALUES ('David Mitchell', 1969)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Stefan Arndt', 1961)

INSERT INTO dbo.ActedIn VALUES 
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Tom Hanks'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Cloud Atlas'), 'Zachry'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Tom Hanks'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Cloud Atlas'), 'Dr. Henry Goose'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Tom Hanks'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Cloud Atlas'), 'Isaac Sachs'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Tom Hanks'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Cloud Atlas'), 'Dermot Hoggins'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Hugo Weaving'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Cloud Atlas'), 'Bill Smoke'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Hugo Weaving'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Cloud Atlas'), 'Haskell Moore'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Hugo Weaving'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Cloud Atlas'), 'Tadeusz Kesselring'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Hugo Weaving'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Cloud Atlas'), 'Nurse Noakes'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Hugo Weaving'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Cloud Atlas'), 'Boardman Mephi'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Hugo Weaving'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Cloud Atlas'), 'Old Georgie'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Halle Berry'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Cloud Atlas'), 'Luisa Rey'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Halle Berry'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Cloud Atlas'), 'Jocasta Ayrs'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Halle Berry'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Cloud Atlas'), 'Ovid'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Halle Berry'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Cloud Atlas'), 'Meronym'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Jim Broadbent'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Cloud Atlas'), 'Vyvyan Ayrs'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Jim Broadbent'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Cloud Atlas'), 'Captain Molyneux'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Jim Broadbent'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Cloud Atlas'), 'Timothy Cavendish');
  
INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Tom Tykwer'),
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Cloud Atlas'));
INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Lilly Wachowski'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Cloud Atlas'));
INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Lana Wachowski'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Cloud Atlas'));
INSERT INTO dbo.Wrote VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'David Mitchell'),
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Cloud Atlas'));
INSERT INTO dbo.Produced VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Stefan Arndt'),
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Cloud Atlas'));
  

INSERT INTO dbo.Movie (Title, Released, Tagline) VALUES ('The Da Vinci Code', 2006, 'Break The Codes')
INSERT INTO dbo.Person (PersonName, born) VALUES ('Ian McKellen', 1939)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Audrey Tautou', 1976)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Paul Bettany', 1971)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Ron Howard', 1954)

INSERT INTO dbo.ActedIn VALUES 
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Tom Hanks'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Da Vinci Code'), 'Dr. Robert Langdon'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Ian McKellen'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Da Vinci Code'), 'Sir Leight Teabing'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Audrey Tautou'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Da Vinci Code'), 'Sophie Neveu'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Paul Bettany'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Da Vinci Code'), 'Silas');

INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Ron Howard'),
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Da Vinci Code'));

INSERT INTO dbo.Movie (Title, Released, Tagline) VALUES ('V for Vendetta', 2006, 'Freedom! Forever!')
INSERT INTO dbo.Person (PersonName, born) VALUES ('Natalie Portman', 1981)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Stephen Rea', 1946)
INSERT INTO dbo.Person (PersonName, born) VALUES ('John Hurt', 1940)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Ben Miles', 1967)
INSERT INTO dbo.Person (PersonName, born) VALUES ('James McTeigue', 1967)

INSERT INTO dbo.ActedIn VALUES 
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Hugo Weaving'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'V for Vendetta'), 'V'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Natalie Portman'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'V for Vendetta'), 'Evey Hammond'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Stephen Rea'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'V for Vendetta'), 'Eric Finch'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'John Hurt'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'V for Vendetta'), 'High Chancellor Adam Sutler'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Ben Miles'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'V for Vendetta'), 'Dascomb');

INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'James McTeigue'),
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'V for Vendetta'));
INSERT INTO dbo.Produced VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Lilly Wachowski'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'V for Vendetta'));
INSERT INTO dbo.Produced VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Lana Wachowski'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'V for Vendetta'));
INSERT INTO dbo.Produced VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Joel Silver'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'V for Vendetta'));
INSERT INTO dbo.Wrote VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Lilly Wachowski'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'V for Vendetta'));
INSERT INTO dbo.Wrote VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Lana Wachowski'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'V for Vendetta'));
  
INSERT INTO dbo.Movie (Title, Released, Tagline) VALUES ('Speed Racer', 2008, 'Speed has no limits')
INSERT INTO dbo.Person (PersonName, born) VALUES ('Emile Hirsch', 1985)
INSERT INTO dbo.Person (PersonName, born) VALUES ('John Goodman', 1960)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Susan Sarandon', 1946)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Matthew Fox', 1966)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Christina Ricci', 1980)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Rain', 1982)

INSERT INTO dbo.ActedIn VALUES 
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Emile Hirsch'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Speed Racer'), 'Speed Racer'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'John Goodman'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Speed Racer'), 'Pops'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Susan Sarandon'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Speed Racer'), 'Mom'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Matthew Fox'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Speed Racer'), 'Racer X'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Christina Ricci'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Speed Racer'), 'Trixie'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Rain'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Speed Racer'), 'Taejo Togokahn'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Ben Miles'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Speed Racer'), 'Cass Jones');

INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Lilly Wachowski'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Speed Racer'));
INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Lana Wachowski'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Speed Racer'));
INSERT INTO dbo.Produced VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Joel Silver'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Speed Racer'));
INSERT INTO dbo.Wrote VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Lilly Wachowski'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Speed Racer'));
INSERT INTO dbo.Wrote VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Lana Wachowski'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Speed Racer'));

INSERT INTO dbo.Movie (Title, Released, Tagline) VALUES ('Ninja Assassin', 2009, 'Prepare to enter a secret world of assassins')
INSERT INTO dbo.Person (PersonName, born) VALUES ('Naomie Harris', 1976)

INSERT INTO dbo.ActedIn VALUES 
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Rain'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Ninja Assassin'), 'Raizo'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Naomie Harris'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Ninja Assassin'), 'Mika Coretti'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Rick Yune'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Ninja Assassin'), 'Takeshi'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Ben Miles'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Ninja Assassin'), 'Ryan Maslow');

INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'James McTeigue'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Ninja Assassin'));
INSERT INTO dbo.Produced VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Lilly Wachowski'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Ninja Assassin'));
INSERT INTO dbo.Produced VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Lana Wachowski'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Ninja Assassin'));
INSERT INTO dbo.Produced VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Joel Silver'), 
  (SELECT $node_id FROM dbo.Movie WHERE Title = 'Ninja Assassin'));

INSERT INTO dbo.Movie (Title, Released, Tagline) VALUES ('The Green Mile', 1999, 'Walk a mile you''ll never forget.');
INSERT INTO dbo.Person (PersonName, born) VALUES ('Michael Clarke Duncan', 1957)
INSERT INTO dbo.Person (PersonName, born) VALUES ('David Morse', 1953)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Sam Rockwell', 1968)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Gary Sinise', 1955)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Patricia Clarkson', 1959)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Frank Darabont', 1959)

INSERT INTO dbo.ActedIn VALUES 
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Tom Hanks'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Green Mile'), 'Paul Edgecomb'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Michael Clarke Duncan'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Green Mile'), 'John Coffey'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'David Morse'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Green Mile'), 'Brutus ''Brutal'' Howell'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Bonnie Hunt'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Green Mile'), 'Jan Edgecomb'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'James Cromwell'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Green Mile'), 'Warden Hal Moores'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Sam Rockwell'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Green Mile'), '''Wild Bill'' Wharton'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Gary Sinise'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Green Mile'), 'Burt Hammersmith'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Patricia Clarkson'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Green Mile'), 'Melinda Moores')

  INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Frank Darabont'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'The Green Mile'));

INSERT INTO dbo.Movie (Title, Released, Tagline) VALUES ('Frost/Nixon', 2008, '400 million people were waiting for the truth.')
INSERT INTO dbo.Person (PersonName, born) VALUES ('Frank Langella', 1938)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Michael Sheen', 1969)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Oliver Platt', 1960)

INSERT INTO dbo.ActedIn VALUES 
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Frank Langella'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Frost/Nixon'), 'Richard Nixon'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Michael Sheen'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Frost/Nixon'), 'David Frost'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Kevin Bacon'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Frost/Nixon'), 'Jack Brennan'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Oliver Platt'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Frost/Nixon'), 'Bob Zelnick'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Sam Rockwell'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Frost/Nixon'), 'James Reston, Jr.');

  INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Ron Howard'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Frost/Nixon'));

INSERT INTO dbo.Movie (Title, Released, Tagline) VALUES ('Hoffa', 1992, 'He didn''t want law. He wanted justice.')
INSERT INTO dbo.Person (PersonName, born) VALUES ('Danny DeVito', 1944)
INSERT INTO dbo.Person (PersonName, born) VALUES ('John C. Reilly', 1965)

INSERT INTO dbo.ActedIn VALUES 
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Jack Nicholson'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Hoffa'), 'Hoffa'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Danny DeVito'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Hoffa'), 'Robert ''Bobby'' Ciaro'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'J.T. Walsh'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Hoffa'), 'Frank Fitzsimmons'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'John C. Reilly'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Hoffa'), 'Peter ''Pete'' Connelly');

  INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Danny DeVito'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Hoffa'));

INSERT INTO dbo.Movie (Title, Released, Tagline) VALUES ('Apollo 13', 1995, 'Houston, we have a problem.')
INSERT INTO dbo.Person (PersonName, born) VALUES ('Ed Harris', 1950)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Bill Paxton', 1955)
INSERT INTO dbo.ActedIn VALUES 
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Tom Hanks'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Apollo 13'), 'Jim Lovell'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Kevin Bacon'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Apollo 13'), 'Jack Swigert'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Ed Harris'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Apollo 13'), 'Gene Kranz'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Bill Paxton'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Apollo 13'), 'Fred Haise'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Gary Sinise'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Apollo 13'), 'Ken Mattingly')

INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Ron Howard'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Apollo 13'));

INSERT INTO dbo.Movie (Title, Released, Tagline) VALUES ('Twister', 1996, 'Don''t Breathe. Don''t Look Back.')
INSERT INTO dbo.Person (PersonName, born) VALUES ('Philip Seymour Hoffman', 1967)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Jan de Bont', 1943)

INSERT INTO dbo.ActedIn VALUES 
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Bill Paxton'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Twister'), 'Bill Harding'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Helen Hunt'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Twister'), 'Dr. Jo Harding'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Zach Grenier'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Twister'), 'Eddie'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Philip Seymour Hoffman'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Twister'), 'Dustin ''Dusty'' Davis');

INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Jan de Bont'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Twister'));

INSERT INTO dbo.Movie (Title, Released, Tagline) VALUES ('Cast Away', 2000, 'At the edge of the world, his journey begins.')
INSERT INTO dbo.Person (PersonName, born) VALUES ('Robert Zemeckis', 1951)
INSERT INTO dbo.ActedIn VALUES 
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Tom Hanks'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Cast Away'), 'Chuck Noland'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Helen Hunt'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Cast Away'), 'Kelly Frears');

INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Robert Zemeckis'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Cast Away'));

INSERT INTO dbo.Movie (Title, Released, Tagline) VALUES ('One Flew Over the Cuckoo''s Nest', 1975, 'If he''s crazy, what does that make you?')
INSERT INTO dbo.Person (PersonName, born) VALUES ('Milos Forman', 1932)

INSERT INTO dbo.ActedIn VALUES 
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Jack Nicholson'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'One Flew Over the Cuckoo''s Nest'), 'Randle McMurphy'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Danny DeVito'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'One Flew Over the Cuckoo''s Nest'), 'Martini');

INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Milos Forman'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'One Flew Over the Cuckoo''s Nest'));

INSERT INTO dbo.Movie (Title, Released) VALUES ('Something''s Gotta Give', 2003)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Diane Keaton', 1946)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Nancy Meyers', 1949)

INSERT INTO dbo.ActedIn VALUES 
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Jack Nicholson'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Something''s Gotta Give'), 'Harry Sanborn'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Diane Keaton'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Something''s Gotta Give'), 'Erica Barry'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Keanu Reeves'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Something''s Gotta Give'), 'Julian Mercer')

INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Nancy Meyers'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Something''s Gotta Give'));
INSERT INTO dbo.Produced VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Nancy Meyers'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Something''s Gotta Give'));
INSERT INTO dbo.Wrote VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Nancy Meyers'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Something''s Gotta Give'));

INSERT INTO dbo.Movie (Title, Released, Tagline) VALUES ('Bicentennial Man', 1999, 'One robot''s 200 year journey to become an ordinary man.')
INSERT INTO dbo.Person (PersonName, born) VALUES ('Chris Columbus', 1958)

INSERT INTO dbo.ActedIn VALUES 
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Robin Williams'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Bicentennial Man'), 'Andrew Marin'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Oliver Platt'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Bicentennial Man'), 'Rupert Burns')

INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Chris Columbus'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Bicentennial Man'));

INSERT INTO dbo.Movie (Title, Released, Tagline) VALUES ('Charlie Wilson''s War', 2007, 'A stiff drink. A little mascara. A lot of nerve. Who said they couldn''t bring down the Soviet empire.')
INSERT INTO dbo.Person (PersonName, born) VALUES ('Julia Roberts', 1967)

INSERT INTO dbo.ActedIn VALUES 
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Tom Hanks'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Charlie Wilson''s War'), 'Rep. Charlie Wilson'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Julia Roberts'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Charlie Wilson''s War'), 'Joanne Herring'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Philip Seymour Hoffman'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'Charlie Wilson''s War'), 'Gust Avrakotos')

INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Mike Nichols'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'Charlie Wilson''s War'));

INSERT INTO dbo.Movie (Title, Released, Tagline) VALUES ('The Polar Express', 2004, 'This Holiday Season? Believe');

INSERT INTO dbo.ActedIn VALUES 
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Tom Hanks'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Polar Express'), 'Hero Boy'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Tom Hanks'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Polar Express'), 'Father'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Tom Hanks'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Polar Express'), 'Conductor'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Tom Hanks'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Polar Express'), 'Hobo'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Tom Hanks'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Polar Express'), 'Scrooge'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Tom Hanks'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'The Polar Express'), 'Santa Claus');

INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Robert Zemeckis'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'The Polar Express'));

INSERT INTO dbo.Movie (Title, Released, Tagline) VALUES ('A League of Their Own', 1992, 'Once in a lifetime you get a chance to do something different.')
INSERT INTO dbo.Person (PersonName, born) VALUES ('Madonna', 1954)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Geena Davis', 1956)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Lori Petty', 1963)
INSERT INTO dbo.Person (PersonName, born) VALUES ('Penny Marshall', 1943)
INSERT INTO dbo.ActedIn VALUES 
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Tom Hanks'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'A League of Their Own'), 'Jimmy Dugan'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Geena Davis'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'A League of Their Own'), 'Dottie Hinson'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Lori Petty'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'A League of Their Own'), 'Kit Keller'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Rosie O''Donnell'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'A League of Their Own'), 'Doris Murphy'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Madonna'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'A League of Their Own'), 'All the Way'' Mae Mordabito'),
  ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Bill Paxton'), (SELECT $node_id FROM dbo.Movie WHERE Title = 'A League of Their Own'), 'Bob Hinson')

INSERT INTO dbo.Directed VALUES ((SELECT $node_id FROM dbo.Person WHERE PersonName = 'Penny Marshall'),
	(SELECT $node_id FROM dbo.Movie WHERE Title = 'A League of Their Own'));

