CREATE TABLE [dbo].[Client] (
    [ClientID]           INT          NOT NULL,
    [Name]               VARCHAR (20) NOT NULL,
    [Surname]            VARCHAR (25) NOT NULL,
    [Gender]             VARCHAR (6)  NULL,
    [Email]              VARCHAR (50) NULL,
    [PhoneNumber]        VARCHAR (20) NULL,
    [IdentityCardNumber] CHAR (9)     NOT NULL,
    [Address]            VARCHAR (60) NOT NULL,
    [ZipCode]            CHAR (6)     NOT NULL,
    [City]               VARCHAR (40) NOT NULL,
    PRIMARY KEY CLUSTERED ([ClientID] ASC),
    CHECK ([Gender] like '%male')
);

