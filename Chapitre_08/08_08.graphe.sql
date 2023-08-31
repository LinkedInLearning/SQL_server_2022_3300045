WITH cte AS (
	SELECT 
		actor1.PersonName,
		COUNT(actor2.PersonName) WITHIN GROUP (GRAPH PATH) AS Niveaux,
		LAST_VALUE(actor2.PersonName) WITHIN GROUP (GRAPH PATH) as Dernier,
		STRING_AGG(CONCAT(actor2.PersonName, '(', Movie.Title, ')'), '->') WITHIN GROUP (GRAPH PATH) as Chemin
	FROM 
		dbo.Person AS actor1, 
		dbo.ActedIn FOR PATH AS ActedIn1, 
		dbo.Movie FOR PATH AS Movie, 
		dbo.ActedIn FOR PATH AS ActedIn2, 
		dbo.Person FOR PATH AS actor2 
	WHERE MATCH(SHORTEST_PATH(actor1(-(ActedIn1)->Movie<-(ActedIn2)-actor2)+))
	AND actor1.PersonName = 'Meg Ryan'
)
SELECT *
FROM cte
WHERE cte.Dernier = 'Diane Keaton'
