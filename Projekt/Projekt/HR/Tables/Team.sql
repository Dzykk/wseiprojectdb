﻿CREATE TABLE [HR].[Team] (
    [TeamID] INT          IDENTITY (1, 1) NOT NULL,
    [Name]   VARCHAR (60) NOT NULL,
    PRIMARY KEY CLUSTERED ([TeamID] ASC),
    UNIQUE NONCLUSTERED ([Name] ASC)
);

