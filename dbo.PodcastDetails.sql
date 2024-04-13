CREATE TABLE [dbo].[PodcastDetails] (
    [podcastID]     UNIQUEIDENTIFIER NOT NULL,
    [podcastName]   VARCHAR (200)    NOT NULL,
    [thumbnailPath] VARCHAR (200)    NOT NULL,
    [authorName]    VARCHAR (100)    NOT NULL,
    PRIMARY KEY CLUSTERED ([podcastID] ASC)
);

