CREATE TABLE [HR].[Wage] (
    [WageID]     INT           IDENTITY (1, 1) NOT NULL,
    [EmployeeID] INT           NOT NULL,
    [Amount]     SMALLMONEY    NULL,
    [DateFrom]   SMALLDATETIME NULL,
    [DateTo]     SMALLDATETIME NULL,
    PRIMARY KEY CLUSTERED ([WageID] ASC),
    CHECK ([Amount]>=(0)),
    CHECK ([DateTo]>[DateFrom]),
    FOREIGN KEY ([EmployeeID]) REFERENCES [dbo].[Employee] ([EmployeeID])
);

