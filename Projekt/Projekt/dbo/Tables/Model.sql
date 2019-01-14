CREATE TABLE [dbo].[Model] (
    [ModelID]        INT           IDENTITY (1, 1) NOT NULL,
    [ManufacturerID] INT           NULL,
    [Name]           VARCHAR (30)  NOT NULL,
    [YearStart]      SMALLDATETIME NULL,
    [YearEnd]        SMALLDATETIME NULL,
    PRIMARY KEY CLUSTERED ([ModelID] ASC),
    FOREIGN KEY ([ManufacturerID]) REFERENCES [dbo].[Manufacturer] ([ManufacturerID]) ON DELETE SET NULL ON UPDATE SET NULL,
    UNIQUE NONCLUSTERED ([Name] ASC)
);

