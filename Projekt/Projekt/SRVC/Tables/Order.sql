CREATE TABLE [SRVC].[Order] (
    [OrderID]       INT IDENTITY (1, 1) NOT NULL,
    [ServiceTypeID] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([OrderID] ASC),
    FOREIGN KEY ([ServiceTypeID]) REFERENCES [SRVC].[ServiceType] ([ServiceTypeID])
);

