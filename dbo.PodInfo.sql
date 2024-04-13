CREATE TABLE [dbo].[PodInfo] (
    [podcastID]   VARCHAR (50)  NOT NULL,
    [podcastName] VARCHAR (200) NOT NULL,
    [EPName]      VARCHAR (300) NOT NULL,
    [podcastEPNo] VARCHAR (20)  NOT NULL,
    [authorName]  VARCHAR (100) NOT NULL,
    [epFilepath]  VARCHAR (500) NOT NULL,
    PRIMARY KEY CLUSTERED ([podcastID] ASC)
);

