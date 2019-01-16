CREATE TABLE [SRVC].[OrderHistory] (
    [OrderHistoryID]    INT           IDENTITY (1, 1) NOT NULL,
    [OrderID]           INT           NOT NULL,
    [StatusID]          INT           NOT NULL,
    [DateOfUpdate]      SMALLDATETIME NOT NULL,
    [UpdatedByEmployee] INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([OrderHistoryID] ASC),
    FOREIGN KEY ([OrderID]) REFERENCES [SRVC].[Order] ([OrderID]),
    FOREIGN KEY ([StatusID]) REFERENCES [SRVC].[OrderStatus] ([OrderStatusID]),
    FOREIGN KEY ([UpdatedByEmployee]) REFERENCES [dbo].[Employee] ([EmployeeID]),
    UNIQUE NONCLUSTERED ([OrderID] ASC, [StatusID] ASC)
);







