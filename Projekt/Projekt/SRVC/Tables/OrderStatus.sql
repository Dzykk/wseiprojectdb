CREATE TABLE [SRVC].[OrderStatus] (
    [OrderStatusID] INT          IDENTITY (1, 1) NOT NULL,
    [Name]          VARCHAR (20) NOT NULL,
    PRIMARY KEY CLUSTERED ([OrderStatusID] ASC),
    UNIQUE NONCLUSTERED ([Name] ASC)
);

