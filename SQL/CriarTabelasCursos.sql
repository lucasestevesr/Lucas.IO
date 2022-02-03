
CREATE DATABASE [Cursos]
GO

USE [Cursos]

CREATE TABLE [Categoria](
    [Id]  INT NOT NULL IDENTITY(1, 1),
    [Nome] NVARCHAR(255) NOT NULL,
    
    CONSTRAINT [PK_Categoria] PRIMARY KEY([Id]), --Primary Key é Nulo e Único
    
)
GO

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

