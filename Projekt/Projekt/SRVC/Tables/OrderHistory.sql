CREATE TABLE [SRVC].[OrderHistory] (
    [OrderHistoryID]    INT           IDENTITY (1, 1) NOT NULL,
    [OrderID]           INT           NOT NULL DEFAULT -1,
    [StatusID]          INT           NOT NULL DEFAULT -1,
    [DateOfUpdate]      SMALLDATETIME NULL,
    [UpdatedByEmployee] INT           NOT NULL DEFAULT -1,
    PRIMARY KEY CLUSTERED ([OrderHistoryID] ASC),
    FOREIGN KEY ([OrderID]) REFERENCES [SRVC].[Order] ([OrderID]) ON DELETE SET DEFAULT ON UPDATE SET DEFAULT,
    FOREIGN KEY ([StatusID]) REFERENCES [SRVC].[OrderStatus] ([OrderStatusID]) ON DELETE SET DEFAULT ON UPDATE SET DEFAULT,
    FOREIGN KEY ([UpdatedByEmployee]) REFERENCES [dbo].[Employee] ([EmployeeID]) ON DELETE SET DEFAULT ON UPDATE SET DEFAULT,
    UNIQUE NONCLUSTERED ([OrderID] ASC, [StatusID] ASC)
);







