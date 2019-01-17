CREATE TABLE [dbo].[Order] (
    [OrderID]      INT           NOT NULL,
    [ClientID]     INT           NOT NULL,
    [EmployeeID]   INT           NOT NULL,
    [FullPrice]    SMALLMONEY    NULL,
    [OrderDate]    SMALLDATETIME NOT NULL,
    [DeliveryDate] SMALLDATETIME NULL,
    [Completed]    BIT           DEFAULT ('0') NOT NULL,
    [Delivered]    BIT           DEFAULT ('0') NOT NULL,
    [OrderedCarID] INT           NOT NULL,
    [CarModelID]   INT           NOT NULL,
    [FinalPrice]   SMALLMONEY    NOT NULL,
    PRIMARY KEY NONCLUSTERED ([OrderID] ASC),
    CHECK ([FullPrice]>(0)),
    FOREIGN KEY ([CarModelID]) REFERENCES [dbo].[CarModel] ([CarModelID]),
    FOREIGN KEY ([ClientID]) REFERENCES [dbo].[Client] ([ClientID]),
    FOREIGN KEY ([EmployeeID]) REFERENCES [dbo].[Employee] ([EmployeeID])
);




GO
CREATE CLUSTERED COLUMNSTORE INDEX [occindex]
    ON [dbo].[Order];

