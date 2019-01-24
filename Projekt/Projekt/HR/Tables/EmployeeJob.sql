﻿CREATE TABLE [HR].[EmployeeJob] (
    [EmployeeID] INT           NOT NULL DEFAULT -1,
    [JobID]      INT           NOT NULL DEFAULT -1,
    [DateFrom]   SMALLDATETIME NOT NULL,
    [DateTo]     SMALLDATETIME NOT NULL,
    PRIMARY KEY CLUSTERED ([EmployeeID] ASC, [JobID] ASC),
    CHECK ([DateTo]>[DateFrom]),
    FOREIGN KEY ([EmployeeID]) REFERENCES [dbo].[Employee] ([EmployeeID]) ON DELETE SET DEFAULT ON UPDATE SET DEFAULT,
    FOREIGN KEY ([JobID]) REFERENCES [HR].[Job] ([JobID]) ON DELETE SET DEFAULT ON UPDATE SET DEFAULT
);

