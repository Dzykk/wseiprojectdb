
CREATE   PROCEDURE DenormClient
AS
BEGIN --begin proc

MERGE dbo.Client AS tar
USING Projekt.dbo.Client AS src
ON tar.ClientID = src.ClientID
WHEN MATCHED THEN
UPDATE SET
tar.Surname = src.Surname,
tar.Email = src.Email,
tar.PhoneNumber = src.PhoneNumber,
tar.IdentityCardNumber = src.IdentityCardNumber,
tar.[Address] = src.[Address],
tar.ZipCode = src.ZipCode,
tar.City = src.City
WHEN NOT MATCHED BY TARGET THEN
INSERT (ClientID, [Name], Surname, Gender, Email, PhoneNumber, IdentityCardNumber, [Address], ZipCode, City)
VALUES
(src.ClientID, src.[Name], src.Surname, src.Gender, src.Email, src.PhoneNumber, src.IdentityCardNumber, src.[Address], src.ZipCode, src.City);
END --end proc