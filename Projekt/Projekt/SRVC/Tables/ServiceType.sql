CREATE TABLE [SRVC].[ServiceType] (
    [ServiceTypeID] INT           IDENTITY (1, 1) NOT NULL,
    [Name]          VARCHAR (100) NOT NULL,
    [Price]         SMALLMONEY    NULL,
    PRIMARY KEY CLUSTERED ([ServiceTypeID] ASC),
    UNIQUE NONCLUSTERED ([Name] ASC)
);

