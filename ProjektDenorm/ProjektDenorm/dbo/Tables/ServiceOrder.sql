CREATE TABLE [dbo].[ServiceOrder] (
    [OrderID]           INT           NOT NULL,
    [ServiceType]       VARCHAR (100) NOT NULL,
    [OrderStatus]       VARCHAR (20)  NOT NULL,
    [DateOfUpdate]      SMALLDATETIME NOT NULL,
    [UpdatedByEmployee] INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([OrderID] ASC, [OrderStatus] ASC),
    FOREIGN KEY ([UpdatedByEmployee]) REFERENCES [dbo].[Employee] ([EmployeeID])
);

