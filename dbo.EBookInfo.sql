CREATE TABLE [dbo].[EBookInfo] (
    [ebookID]       UNIQUEIDENTIFIER NOT NULL,
    [ebookName]     VARCHAR (200)    NOT NULL,
    [username]      VARCHAR (100)    NOT NULL,
    [voiceType]     VARCHAR (50)     NOT NULL,
    [ebookFilepath] VARCHAR (500)    NOT NULL,
    [totalPages]    VARCHAR (50)     NOT NULL,
    [ebookAudiopath] VARCHAR(500) NOT NULL, 
    PRIMARY KEY CLUSTERED ([ebookID] ASC)
);

