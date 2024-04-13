CREATE TABLE [dbo].[ProfileInfo] (
    [Username] VARCHAR (30)  NOT NULL,
    [Email]    VARCHAR (100) NOT NULL,
    [Password] VARCHAR (15)  NOT NULL,
    [Name]     VARCHAR (100) NOT NULL,
    [DOB]      DATE          NULL,
    PRIMARY KEY CLUSTERED ([Username] ASC)
);

