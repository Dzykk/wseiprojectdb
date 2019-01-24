CREATE TABLE [dbo].[Model] (
    [ModelID]        INT           IDENTITY (1, 1) NOT NULL,
    [ManufacturerID] INT           NOT NULL DEFAULT -1,
    [Name]           VARCHAR (30)  NOT NULL,
    [YearStart]      SMALLDATETIME NULL,
    [YearEnd]        SMALLDATETIME NULL,
    PRIMARY KEY CLUSTERED ([ModelID] ASC),
    FOREIGN KEY ([ManufacturerID]) REFERENCES [dbo].[Manufacturer] ([ManufacturerID]) ON DELETE SET DEFAULT ON UPDATE SET DEFAULT,
    UNIQUE NONCLUSTERED ([Name] ASC)
);

