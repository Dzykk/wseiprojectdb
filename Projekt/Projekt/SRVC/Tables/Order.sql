CREATE TABLE [SRVC].[Order] (
    [OrderID]       INT IDENTITY (1, 1) NOT NULL,
    [ServiceTypeID] INT NOT NULL,
    [ClientID]      INT NULL,
    PRIMARY KEY CLUSTERED ([OrderID] ASC),
    FOREIGN KEY ([ServiceTypeID]) REFERENCES [SRVC].[ServiceType] ([ServiceTypeID]),
    CONSTRAINT [FKClientID] FOREIGN KEY ([ClientID]) REFERENCES [dbo].[Client] ([ClientID])
);



