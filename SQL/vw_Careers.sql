CREATE OR ALTER VIEW vwCareers AS
    Select 
        [Career].[Id],
        [Career].[Title],
        [Career].[Url],
        Count([Id]) AS [Courses]
    FROM 
    [Career]
    Inner Join [CareerItem] ON [CareerItem].[CareerId] = [Career].[Id]
    Group BY
        [Career].[Id],
        [Career].[Title],
        [Career].[Url]

