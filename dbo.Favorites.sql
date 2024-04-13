CREATE TABLE [dbo].[Favorites] (
    [podcastID]   VARCHAR (50)  NOT NULL,
    [podcastName] VARCHAR (200) NOT NULL,
    [EPName]      VARCHAR (300) NOT NULL,
    [authorName]  VARCHAR (100) NOT NULL,
    [Username]    VARCHAR (30)  NOT NULL,
    PRIMARY KEY CLUSTERED ([podcastID] ASC)
);

