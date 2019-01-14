CREATE TABLE [dbo].[OrderedCar] (
    [OrderedCarID] INT IDENTITY (1, 1) NOT NULL,
    [ModelID]      INT NULL,
    [OrderID]      INT NULL,
    PRIMARY KEY CLUSTERED ([OrderedCarID] ASC),
    FOREIGN KEY ([ModelID]) REFERENCES [dbo].[Model] ([ModelID]) ON DELETE SET NULL ON UPDATE SET NULL,
    FOREIGN KEY ([OrderID]) REFERENCES [dbo].[Order] ([OrderID]) ON DELETE SET NULL ON UPDATE SET NULL
);



