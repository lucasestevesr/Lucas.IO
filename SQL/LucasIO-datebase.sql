CREATE DATABASE [LucasIO]

USE [LucasIO]
GO

Create Table [Student]
(
    [Id] UNIQUEIDENTIFIER NOT NULL, --guid: Contras: Utiliza mto mais espaço, busca mais complexa. Prós: Previbilidade(Segurança), mais fácil de gerar pelo SQL e pelo .Net
    [Name] NVARCHAR(255) NOT NULL,
    [Email] NVARCHAR(180) NOT NULL,
    [Document] NVARCHAR(20) NULL,
    [Phone] NVARCHAR(20) NULL,
    [BirthDate] DATETIME NULL,
    [CreateDate] DATETIME NOT NULL DEFAULT(GETDATE()), --Pega a hora do SERVIDOR (No momento local)
    CONSTRAINT [PK_Student] PRIMARY KEY ([Id])
);
GO

Create Table [Author]
(
    [Id] UNIQUEIDENTIFIER NOT NULL, --guid: Contras: Utiliza mto mais espaço, busca mais complexa. Prós: Previbilidade(Segurança), mais fácil de gerar pelo SQL e pelo .Net
    [Name] NVARCHAR(255) NOT NULL,
    [Title] NVARCHAR(255) NOT NULL,
    [Image] NVARCHAR(1024) NOT NULL,
    [Bio] NVARCHAR(2000) NULL,
    [Url] NVARCHAR(450) NULL,
    [Email] NVARCHAR(160) NULL,
    [Type] TINYINT NOT NULL, --TINYINT: é diferente do inteiro (-32000 até ... 32000) TINYINT(0...255)  
    CONSTRAINT [PK_Author] PRIMARY KEY ([Id])
);
GO

Create Table [Career]
(
    [Id] UNIQUEIDENTIFIER NOT NULL, --guid: Contras: Utiliza mto mais espaço, busca mais complexa. Prós: Previbilidade(Segurança), mais fácil de gerar pelo SQL e pelo .Net
    [Title] NVARCHAR(255) NOT NULL,
    [Summary] NVARCHAR(2000) NOT NULL,    
    [Url] NVARCHAR(1024) NULL,
    [DurationInMinutes] INT NOT NULL,
    [Active] BIT NOT NULL,
    [Featured] BIT NOT NULL,
    [Tags] NVARCHAR(160) NOT NULL,    
    CONSTRAINT [PK_Career] PRIMARY KEY ([Id])
);
GO

Create Table [Category]
(
    [Id] UNIQUEIDENTIFIER NOT NULL, --guid: Contras: Utiliza mto mais espaço, busca mais complexa. Prós: Previbilidade(Segurança), mais fácil de gerar pelo SQL e pelo .Net
    [Title] NVARCHAR(255) NOT NULL,  
    [Url] NVARCHAR(1024) NULL,
    [Summary] NVARCHAR(2000) NOT NULL, 
    [Order] INT NOT NULL,
    [Description] TEXT NOT NULL,
    [Featured] BIT NOT NULL,    
    CONSTRAINT [PK_Category] PRIMARY KEY ([Id])
);
GO


Create Table [Course]
(
    [Id] UNIQUEIDENTIFIER NOT NULL, --guid: Contras: Utiliza mto mais espaço, busca mais complexa. Prós: Previbilidade(Segurança), mais fácil de gerar pelo SQL e pelo .Net
    [Tag] NVARCHAR(20) NOT NULL,
    [Title] NVARCHAR(160) NOT NULL,
    [Summary] NVARCHAR(2000) NOT NULL,
    [Url] NVARCHAR(1024) NOT NULL,
    [Level] TINYINT NOT NULL, -- Enum, por isso é TinyInt
    [DurationInMinutes] INT NOT NULL,
    [CreateDate] DATETIME NOT NULL,
    [LastUpdateDate] DATETIME NOT NULL,
    [Active] BIT NOT NULL,
    [Free] BIT NOT NULL,
    [Featured] BIT NOT NULL,
    [AuthorId] UNIQUEIDENTIFIER NOT NULL,
    [CategoryId] UNIQUEIDENTIFIER NOT NULL,
    [Tags] NVARCHAR(160) NOT NULL,
    CONSTRAINT [PK_Course] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Course_Author_AuthorId] FOREIGN KEY ([AuthorId]) REFERENCES [Author] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Course_Author_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [Category] ([Id]) ON DELETE NO ACTION
);
GO

Create Table [CareerItem]
(
    [CareerId] UNIQUEIDENTIFIER NOT NULL,
    [CourseId] UNIQUEIDENTIFIER NOT NULL,
    [Title] NVARCHAR(160) NOT NULL,
    [Description] TEXT NOT NULL,
    [Order] TINYINT NOT NULL,  
    CONSTRAINT [PK_CareerItem] PRIMARY KEY ([CourseId], [CareerId]),
    CONSTRAINT [FK_CareerItem_Career_CareerId] FOREIGN KEY ([CareerId]) REFERENCES [Career] ([Id]),
    CONSTRAINT [FK_CareerItem_Course_CourseId] FOREIGN KEY ([CourseId]) REFERENCES [Course] ([Id])
);
GO

Create Table [StudentCourse]
(
    [CourseId] UNIQUEIDENTIFIER NOT NULL,
    [StudentId] UNIQUEIDENTIFIER NOT NULL,
    [Progress] TINYINT NOT NULL,
    [Favorite] BIT NOT NULL,
    [StartDate] DATETIME NOT NULL,
    [LastUpdateDate] DATETIME NULL,   
    CONSTRAINT [PK_StudentCourse] PRIMARY KEY ([CourseId], [StudentId]),
    CONSTRAINT [FK_StudentCourse_Course_CourseId] FOREIGN KEY ([CourseId]) REFERENCES [Course] ([Id]),
    CONSTRAINT [FK_StudentCourse_Student_StudentId] FOREIGN KEY ([StudentId]) REFERENCES [Student] ([Id])
);
GO