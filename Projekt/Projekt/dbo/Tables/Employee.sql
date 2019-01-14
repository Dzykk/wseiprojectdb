CREATE TABLE [dbo].[Employee] (
    [EmployeeID]  INT           IDENTITY (1, 1) NOT NULL,
    [Name]        VARCHAR (20)  NOT NULL,
    [Surname]     VARCHAR (25)  NOT NULL,
    [Gender]      VARCHAR (6)   NULL,
    [Email]       VARCHAR (50)  NULL,
    [PhoneNumber] VARCHAR (20)  NULL,
    [PESEL]       CHAR (11)     NOT NULL,
    [HireDate]    SMALLDATETIME NOT NULL,
    PRIMARY KEY CLUSTERED ([EmployeeID] ASC),
    CHECK ([Gender] like '%male'),
    UNIQUE NONCLUSTERED ([Email] ASC),
    UNIQUE NONCLUSTERED ([PESEL] ASC),
    UNIQUE NONCLUSTERED ([PhoneNumber] ASC)
);

