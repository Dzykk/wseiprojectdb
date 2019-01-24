﻿CREATE TABLE [SRVC].[Order] (
    [OrderID]       INT IDENTITY (1, 1) NOT NULL,
    [ServiceTypeID] INT NOT NULL DEFAULT -1,
    [ClientID]      INT NOT NULL DEFAULT -1,
    PRIMARY KEY CLUSTERED ([OrderID] ASC),
    FOREIGN KEY ([ServiceTypeID]) REFERENCES [SRVC].[ServiceType] ([ServiceTypeID]) ON DELETE SET DEFAULT ON UPDATE SET DEFAULT,
    CONSTRAINT [FKClientID] FOREIGN KEY ([ClientID]) REFERENCES [dbo].[Client] ([ClientID]) ON DELETE SET DEFAULT ON UPDATE SET DEFAULT
);



