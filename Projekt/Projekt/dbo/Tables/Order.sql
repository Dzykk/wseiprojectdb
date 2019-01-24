CREATE TABLE [dbo].[Order] (
    [OrderID]      INT           IDENTITY (1, 1) NOT NULL,
    [ClientID]     INT           NOT NULL DEFAULT -1,
    [EmployeeID]   INT           NOT NULL DEFAULT -1,
    [FullPrice]    SMALLMONEY    NULL,
    [OrderDate]    SMALLDATETIME DEFAULT (getdate()) NULL,
    [DeliveryDate] SMALLDATETIME NULL,
    [Completed]    BIT           NOT NULL DEFAULT 0,
    [Delivered]    BIT           NOT NULL DEFAULT 0,
    PRIMARY KEY CLUSTERED ([OrderID] ASC),
    CONSTRAINT [CK__Order__FullPrice__68487DD7] CHECK ([FullPrice]>(0)),
    FOREIGN KEY ([ClientID]) REFERENCES [dbo].[Client] ([ClientID]) ON DELETE SET DEFAULT ON UPDATE SET DEFAULT,
    FOREIGN KEY ([EmployeeID]) REFERENCES [dbo].[Employee] ([EmployeeID]) ON DELETE SET DEFAULT ON UPDATE SET DEFAULT
);







