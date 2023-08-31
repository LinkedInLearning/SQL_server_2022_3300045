WITH cte AS (
	SELECT EmployeId, Nom, ChefId FROM dbo.Employe WHERE EmployeId = 8

	UNION ALL

	SELECT e2.EmployeId, e2.Nom, e2.ChefId
	FROM cte e1
	JOIN dbo.Employe e2 ON e1.ChefId = e2.EmployeId
)
SELECT *
FROM cte;

