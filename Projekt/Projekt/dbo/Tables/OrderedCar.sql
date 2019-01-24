CREATE TABLE [dbo].[OrderedCar] (
    [OrderedCarID] INT        IDENTITY (1, 1) NOT NULL,
    [ModelID]      INT        NOT NULL DEFAULT -1,
    [OrderID]      INT        NOT NULL DEFAULT -1,
    [FinalPrice]   SMALLMONEY NOT NULL,
    PRIMARY KEY CLUSTERED ([OrderedCarID] ASC),
    CHECK ([FinalPrice]>(0)),
    FOREIGN KEY ([ModelID]) REFERENCES [dbo].[Model] ([ModelID]) ON DELETE SET DEFAULT ON UPDATE SET DEFAULT,
    FOREIGN KEY ([OrderID]) REFERENCES [dbo].[Order] ([OrderID]) ON DELETE SET DEFAULT ON UPDATE SET DEFAULT
);





