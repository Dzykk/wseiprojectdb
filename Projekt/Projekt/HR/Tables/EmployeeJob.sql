CREATE TABLE [HR].[EmployeeJob] (
    [EmployeeID] INT           NOT NULL,
    [JobID]      INT           NOT NULL,
    [DateFrom]   SMALLDATETIME NOT NULL,
    [DateTo]     SMALLDATETIME NOT NULL,
    PRIMARY KEY CLUSTERED ([EmployeeID] ASC, [JobID] ASC),
    CHECK ([DateTo]>[DateFrom]),
    FOREIGN KEY ([EmployeeID]) REFERENCES [dbo].[Employee] ([EmployeeID]),
    FOREIGN KEY ([JobID]) REFERENCES [HR].[Job] ([JobID])
);

