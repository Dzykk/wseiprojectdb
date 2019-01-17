CREATE TABLE [dbo].[Employee] (
    [EmployeeID]  INT           NOT NULL,
    [Name]        VARCHAR (20)  NOT NULL,
    [Surname]     VARCHAR (25)  NOT NULL,
    [Gender]      VARCHAR (6)   NULL,
    [Email]       VARCHAR (50)  NULL,
    [PhoneNumber] VARCHAR (20)  NULL,
    [PESEL]       CHAR (11)     NOT NULL,
    [HireDate]    SMALLDATETIME NOT NULL,
    [Job]         VARCHAR (50)  NOT NULL,
    [JobDateFrom] SMALLDATETIME NOT NULL,
    [JobDateTo]   SMALLDATETIME NOT NULL,
    [Team]        VARCHAR (60)  NOT NULL,
    [WageAmount]  SMALLMONEY    NULL,
    PRIMARY KEY CLUSTERED ([EmployeeID] ASC),
    CHECK ([Gender] like '%male'),
    UNIQUE NONCLUSTERED ([Email] ASC),
    UNIQUE NONCLUSTERED ([PESEL] ASC),
    UNIQUE NONCLUSTERED ([PhoneNumber] ASC)
);



