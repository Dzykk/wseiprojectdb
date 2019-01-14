﻿CREATE TABLE [dbo].[Price] (
    [PriceID]  INT           IDENTITY (1, 1) NOT NULL,
    [ModelID]  INT           NULL,
    [Price]    SMALLMONEY    NOT NULL,
    [DateFrom] SMALLDATETIME NOT NULL,
    [DateTo]   SMALLDATETIME NOT NULL,
    PRIMARY KEY CLUSTERED ([PriceID] ASC),
    CHECK ([Price]>(0)),
    FOREIGN KEY ([ModelID]) REFERENCES [dbo].[Model] ([ModelID]) ON DELETE SET NULL ON UPDATE SET NULL
);

