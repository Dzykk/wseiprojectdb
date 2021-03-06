﻿CREATE TABLE [HR].[Payment] (
    [PaymentID]  INT           IDENTITY (1, 1) NOT NULL,
    [EmployeeID] INT           NOT NULL DEFAULT -1,
    [Amount]     SMALLMONEY    NULL,
    [Type]       VARCHAR (10)  NULL,
    [DateFrom]   SMALLDATETIME NULL,
    [DateTo]     SMALLDATETIME NULL,
    PRIMARY KEY CLUSTERED ([PaymentID] ASC),
    CHECK ([Amount]>=(0)),
    CHECK ([DateTo]>[DateFrom]),
    CHECK ([Type] like 'Payout' OR [Type] like 'Bonus'),
    FOREIGN KEY ([EmployeeID]) REFERENCES [dbo].[Employee] ([EmployeeID]) ON DELETE SET DEFAULT ON UPDATE SET DEFAULT
);



