CREATE TABLE [dbo].[Order] (
    [OrderID]      INT           IDENTITY (1, 1) NOT NULL,
    [ClientID]     INT           NULL,
    [EmployeeID]   INT           NULL,
    [FullPrice]    SMALLMONEY    NULL,
    [OrderDate]    SMALLDATETIME DEFAULT (getdate()) NOT NULL,
    [DeliveryDate] SMALLDATETIME NULL,
    [Completed]    BIT           DEFAULT ('0') NOT NULL,
    [Delivered]    BIT           DEFAULT ('0') NOT NULL,
    PRIMARY KEY CLUSTERED ([OrderID] ASC),
    CONSTRAINT [CK__Order__FullPrice__68487DD7] CHECK ([FullPrice]>=(0)),
    FOREIGN KEY ([ClientID]) REFERENCES [dbo].[Client] ([ClientID]) ON DELETE SET NULL ON UPDATE SET NULL,
    FOREIGN KEY ([EmployeeID]) REFERENCES [dbo].[Employee] ([EmployeeID]) ON DELETE SET NULL ON UPDATE SET NULL
);







