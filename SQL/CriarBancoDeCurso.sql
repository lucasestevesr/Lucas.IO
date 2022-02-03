USE [Curso]

DROP TABLE [Aluno]

CREATE TABLE [Aluno](
    [Id]  INT NOT NULL,
    [Nome] NVARCHAR(255) NOT NULL,
    [Email] NVARCHAR(255) NOT NULL,
    [Nascimento] DATETIME NULL,
    [Active] BIT NOT NULL DEFAULT(0)

    CONSTRAINT [PK_Aluno] PRIMARY KEY([Id]), --Primary Key é Nulo e Único
    CONSTRAINT [UQ_Aluno_Email] UNIQUE([Email])
)
GO

-- Criar índices para colunas que utilizam mais pesquisa na Tabela.
CREATE INDEX [IX_Aluno_Email] ON [Aluno]([Email])
DROP INDEX[IX_Aluno_Email] ON [Aluno]

DROP TABLE [Curso]
CREATE TABLE [Curso](
    [Id]  INT NOT NULL IDENTITY(1, 1),
    --[Id] UNIQUEIDENTIFIER NOT NULL,
    [Nome] NVARCHAR(255) NOT NULL,
    [CategoriaId] INT NOT NULL,
 
    CONSTRAINT [PK_Curso] PRIMARY KEY([Id]), --Primary Key é Nulo e Único 
    CONSTRAINT [FK_Curso_Categoria] FOREIGN KEY([CategoriaId])
        REFERENCES [Categoria]([Id])
)
GO

CREATE TABLE [Categoria](
    [Id]  INT NOT NULL,
    [Nome] NVARCHAR(255) NOT NULL,
    
    CONSTRAINT [PK_Categoria] PRIMARY KEY([Id]), --Primary Key é Nulo e Único
    
)
GO

-- Tabela Associativa
CREATE TABLE [ProgressoCurso](
    [AlunoId]  INT NOT NULL,
    [CursoId]  INT NOT NULL,
    [Progresso] INT NOT NULL,
    [UltimaAtt] DATETIME NOT NULL DEFAULT(GETDATE()), 

    CONSTRAINT PK_ProgressoCurso PRIMARY KEY ([AlunoId], [CursoId]) 
)
GO


-- ALTER TABLE [ALUNO]
--     ALTER COLUMN [Active] BIT NOT NULL 


-- ALTER TABLE [Aluno]
--     ADD [Document] NVARCHAR(11)

-- ALTER TABLE [Aluno]
--     DROP COLUMN [Document]

-- ALTER TABLE [Aluno]
--     ALTER COLUMN [Document] CHAR(11)
    
