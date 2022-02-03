CREATE OR ALTER PROCEDURE [spListCourse] 
    @Category NVARCHAR(255)
AS    
    
    DECLARE @CategoryId INT
    SET @CategoryId = (SELECT TOP 1 [Id] FROM [Categoria] WHERE [Nome] = @Category)


    SELECT * FROM [Curso] WHERE [CategoriaId] = @CategoryId

--EXEC [spListCourse]
--DROP [spListCourse]

EXEC [spListCourse] 'Azure'