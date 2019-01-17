CREATE TABLE [dbo].[CarModel] (
    [CarModelID]          INT           IDENTITY (1, 1) NOT NULL,
    [ManufacturerName]    VARCHAR (30)  NOT NULL,
    [ManufacturerCountry] VARCHAR (30)  NULL,
    [ModelID]             INT           NOT NULL,
    [ModelName]           VARCHAR (30)  NOT NULL,
    [ModelYearStart]      SMALLDATETIME NULL,
    [ModelYearEnd]        SMALLDATETIME NULL,
    [Price]               SMALLMONEY    NOT NULL,
    [PriceDateFrom]       SMALLDATETIME NOT NULL,
    [PriceDateTo]         SMALLDATETIME NOT NULL,
    PRIMARY KEY CLUSTERED ([CarModelID] ASC)
);



