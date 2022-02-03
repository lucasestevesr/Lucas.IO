SELECT TOP 5 
    [Id], [Nome], [CategoriaId]
FROM
    [Curso] -- Trazer só os 2 primeiros dados
-- WHERE
--     [CategoriaId] = 1
--     [Id] = 5 OR 
--     [CategoriaId] IS NOT NULL
ORDER BY 
    [Nome] ASC --DESC


BEGIN TRANSACTION
    UPDATE 
        [Categoria] 
    SET 
        [NOME] = 'BackEnd'
    WHERE Id =1
--ROLLBACK
COMMIT 

-- DELETE FROM 
--     [Categoria]
-- WHERE 
--     [Id] = 4

SELECT TOP 100
    * -- COUNT, MAX, MIN, AVG, SUM
FROM 
    [Curso]
WHERE 
    --[Nome] = 'Fundamentos' -- não vai encontrar nada.
    -- [Nome] LIKE '%de%'
    -- [Id] in (1,2,3) 
    --[Id] in (SELECT [Id] FROM [Categoria])
    [Id] BETWEEN 1 AND 4

-------- Joins --------

--Inner Join, Interseção--
SELECT TOP 100 
    A.Nome, a.CategoriaId, B.Nome as Categoria
From 
    [Curso] AS A
    INNER JOIN [Categoria] AS B
    ON  A.CategoriaId = B.Id
--Left Join: Todos os Itens da Primeira Tabela--
SELECT TOP 100 
    A.Nome, a.CategoriaId, B.Nome as Categoria
From 
    [Curso] AS A
    LEFT JOIN [Categoria] AS B
    ON  A.CategoriaId = B.Id
--Union--
SELECT [Id], [Nome] FROM [Curso]
UNION 
SELECT [Id], [Nome] FROM [Categoria]

-------------- GROUP BY --------------

SELECT [Categoria].[Nome], COUNT([Curso].[CategoriaId]) as Cursos FROM [Categoria]
Inner Join [Curso] on [Categoria].[Id] = [Curso].[CategoriaId]
GROUP BY [Curso].[CategoriaId], [Categoria].[Nome]
HAVING COUNT([Curso].[CategoriaId]) > 1 -- NÃO UTILIZA WHERE SOBRE GROUP BY, UTILIZA HAVING
-------------------------------------------------------------------------------------------
------Views------
CREATE OR ALTER VIEW vwContagemCursosPorCategoria AS
    SELECT [Categoria].[Nome], COUNT([Curso].[CategoriaId]) as Cursos, [Categoria].[Id] FROM [Categoria]
        Inner Join [Curso] on [Categoria].[Id] = [Curso].[CategoriaId]
    GROUP BY [Curso].[CategoriaId], [Categoria].[Nome], [Categoria].[Id]
    HAVING COUNT([Curso].[CategoriaId]) > 1

SELECT * FROM vwContagemCursosPorCategoria
WHERE [Nome] = 'BackEnd';