SELECT NEWID()

INSERT INTO 
    [Student]
VALUES (
    '038156ed-de1b-40aa-938e-bdd954ba1465',
    'Lucas Esteves',
    'Lucas.E@gmail.com',
    '11122244455',
    '3299995555',
    '1995-01-01',
    GETDATE()
)

INSERT INTO
    [StudentCourse]
VALUES(
    '5f5a33f8-4ff3-7e10-cc6e-3fa000000000',
    '038156ed-de1b-40aa-938e-bdd954ba1465',
    50,
    0,
    '2022-01-29 12:35:54',
    GETDATE()
)

