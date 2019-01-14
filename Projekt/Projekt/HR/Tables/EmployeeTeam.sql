CREATE TABLE [HR].[EmployeeTeam] (
    [EmployeeID] INT NOT NULL,
    [TeamID]     INT NOT NULL,
    PRIMARY KEY CLUSTERED ([EmployeeID] ASC, [TeamID] ASC),
    FOREIGN KEY ([EmployeeID]) REFERENCES [dbo].[Employee] ([EmployeeID]),
    FOREIGN KEY ([TeamID]) REFERENCES [HR].[Team] ([TeamID])
);

