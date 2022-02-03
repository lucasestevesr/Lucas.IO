-- Inserir Registros
INSERT INTO [Categoria]([Nome]) VALUES ('BackEnd')  -- Id é Identity, atualiza sozinho.
INSERT INTO [Categoria]([Nome]) VALUES ('FrontEnd')  -- Id é Identity, atualiza sozinho.
INSERT INTO [Categoria]([Nome]) VALUES ('Mobile')  -- Id é Identity, atualiza sozinho.


INSERT INTO [Curso]([Nome], [CategoriaId]) VALUES ('Fundamentos de C#', 1)  
INSERT INTO [Curso]([Nome], [CategoriaId]) VALUES ('Fundamentos de OOP', 1)  
INSERT INTO [Curso]([Nome], [CategoriaId]) VALUES ('Angular', 2)  
INSERT INTO [Curso]([Nome], [CategoriaId]) VALUES ('Flutter', 3)
INSERT INTO [Curso] VALUES ('Flutter e SQLIte', 3)  -- forma de inserção resumida. Porém não use e abuse disso.