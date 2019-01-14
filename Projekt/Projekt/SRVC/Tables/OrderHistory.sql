CREATE TABLE [SRVC].[OrderHistory] (
    [OrderHistoryID]    INT           IDENTITY (1, 1) NOT NULL,
    [OrderID]           INT           NOT NULL,
    [Status]            VARCHAR (20)  NOT NULL,
    [DateOfUpdate]      SMALLDATETIME NOT NULL,
    [UpdatedByEmployee] INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([OrderHistoryID] ASC),
    FOREIGN KEY ([OrderID]) REFERENCES [SRVC].[Order] ([OrderID]),
    FOREIGN KEY ([Status]) REFERENCES [SRVC].[OrderStatus] ([Name]),
    FOREIGN KEY ([UpdatedByEmployee]) REFERENCES [dbo].[Employee] ([EmployeeID])
);



