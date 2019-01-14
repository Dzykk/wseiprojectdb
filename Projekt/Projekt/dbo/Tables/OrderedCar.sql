CREATE TABLE [dbo].[OrderedCar] (
    [OrderedCarID] INT        IDENTITY (1, 1) NOT NULL,
    [ModelID]      INT        NULL,
    [OrderID]      INT        NULL,
    [FinalPrice]   SMALLMONEY NOT NULL,
    PRIMARY KEY CLUSTERED ([OrderedCarID] ASC),
    CHECK ([FinalPrice]>(0)),
    FOREIGN KEY ([ModelID]) REFERENCES [dbo].[Model] ([ModelID]) ON DELETE SET NULL ON UPDATE SET NULL,
    FOREIGN KEY ([OrderID]) REFERENCES [dbo].[Order] ([OrderID]) ON DELETE SET NULL ON UPDATE SET NULL
);

