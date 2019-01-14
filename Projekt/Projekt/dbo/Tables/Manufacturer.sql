CREATE TABLE [dbo].[Manufacturer] (
    [ManufacturerID] INT          IDENTITY (1, 1) NOT NULL,
    [Name]           VARCHAR (30) NOT NULL,
    [Country]        VARCHAR (30) NULL,
    [Founded]        DATETIME     NULL,
    PRIMARY KEY CLUSTERED ([ManufacturerID] ASC),
    UNIQUE NONCLUSTERED ([Name] ASC)
);

