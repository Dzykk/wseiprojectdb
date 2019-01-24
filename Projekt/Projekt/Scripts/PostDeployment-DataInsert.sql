

INSERT INTO HR.Job ([Name])
VALUES
('Manager'), ('Vendor'), ('Specialist'), ('Mechanic'), ('Customer Service');
GO

SET IDENTITY_INSERT HR.Job ON
INSERT INTO HR.Job ([JobID] ,[Name])
VALUES
(-1, 'Technical')
SET IDENTITY_INSERT HR.Job OFF;
GO

INSERT INTO HR.Team ([Name])
VALUES
('Management'), ('Salesroom'), ('Workshop'), ('Support');
GO

SET IDENTITY_INSERT HR.Team ON
INSERT INTO HR.Team ([TeamID] ,[Name])
VALUES
(-1, 'Technical')
SET IDENTITY_INSERT HR.Team OFF;
GO

INSERT INTO [dbo].[Employee] ([Name], [Surname], [Gender], [Email], [PhoneNumber], [PESEL], [HireDate])
VALUES
('Collie', 'Elnough', 'Female', 'celnough0@clickbank.net', '294-125-8387', '00100635553', '20101223'),
('Thorpe', 'Dwerryhouse', 'Male', 'tdwerryhouse1@telegraph.co.uk', '818-124-9872', '25598673779', '20160814'),
('Mandie', 'Tumbridge', 'Female', 'mtumbridge2@360.cn', '534-388-5563', '66049117199', '20111018'),
('Conrado', 'Excell', 'Male', 'cexcell3@clickbank.net', '666-406-5401', '60216346732', '20150317'),
('Kory', 'Clynmans', 'Male', 'kclynmans4@biblegateway.com', '668-153-5330', '99604202608', '20120621'),
('Garth', 'Vanderplas', 'Male', 'gvanderplas5@hhs.gov', '289-590-8836', '02284310246', '20110528'),
('Milt', 'Tooze', 'Male', 'mtooze6@walmart.com', '923-857-7244', '11791493770', '20110906'),
('Geoffry', 'Frith', 'Male', 'gfrith0@odnoklassniki.ru', '859-560-1221', '88172604819', '20180104'),
('Paulo', 'Josofovitz', 'Male', 'pjosofovitz1@sakura.ne.jp', '652-076-8181', '44306761057', '20180214'),
('Prince', 'Paff', 'Male', 'ppaff2@google.it', '349-922-5041', '70178158659', '20170212'),
('Bartolomeo', 'Cornil', 'Male', 'bcornil3@cam.ac.uk', '374-733-1240', '96443709812', '20170902'),
('Fanchette', 'Leppard', 'Female', 'fleppard4@vistaprint.com', '630-864-0545', '52711510068', '20161102');
GO

SET IDENTITY_INSERT [dbo].[Employee] ON
INSERT INTO [dbo].[Employee] ([EmployeeID], [Surname], [PESEL])
VALUES
(-1, 'Technical', 'Employee', 00000000000)
SET IDENTITY_INSERT [dbo].[Employee] OFF;
GO

INSERT INTO HR.EmployeeJob (EmployeeID, JobID, DateFrom, DateTo)
VALUES
(1, 1, '20101223', '20190125'),
(2, 2, '20160814', '20190125'),
(3, 2, '20111018', '20190125'),
(4, 2, '20150317', '20190125'),
(5, 3, '20120621', '20190125'),
(6, 3, '20110528', '20190125'),
(7, 4, '20110906', '20190125'),
(8, 4, '20180104', '20190125'),
(9, 4, '20180214', '20190125'),
(10, 5, '20170212', '20190125'),
(11, 5, '20170902', '20190125'),
(12, 5, '20161102', '20190125');
GO

INSERT INTO HR.EmployeeTeam (EmployeeID, TeamID)
VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 4),
(7, 3),
(8, 3),
(9, 3),
(10, 4),
(11, 4),
(12, 4);
GO

INSERT INTO HR.Wage (EmployeeID, Amount, DateFrom, DateTo)
VALUES
(1, 6000, '20101223', '20190125'),
(2, 3000, '20160814', '20190125'),
(3, 3200, '20111018', '20190125'),
(4, 3350, '20150317', '20190125'),
(5, 4150, '20120621', '20190125'),
(6, 3900, '20110528', '20190125'),
(7, 2500, '20110906', '20190125'),
(8, 2900, '20180104', '20190125'),
(9, 2650, '20180214', '20190125'),
(10, 1500, '20170212', '20190125'),
(11, 1650, '20170902', '20190125'),
(12, 1450, '20161102', '20190125');
GO


INSERT INTO HR.Payment (EmployeeID, Amount, [Type], DateFrom, DateTo)
VALUES
(1, 6000, 'Payout', '20181201', '20190101'),
(2, 3000, 'Payout', '20181201', '20190101'),
(3, 3200, 'Payout', '20181201', '20190101'),
(4, 3350, 'Payout', '20181201', '20190101'),
(5, 4150, 'Payout', '20181201', '20190101'),
(6, 3900, 'Payout', '20181201', '20190101'),
(7, 2500, 'Payout', '20181201', '20190101'),
(8, 2900, 'Payout', '20181201', '20190101'),
(9, 2650, 'Payout', '20181201', '20190101'),
(10, 1500, 'Payout', '20181201', '20190101'),
(11, 1650, 'Payout', '20181201', '20190101'),
(12, 1450, 'Payout', '20181201', '20190101'),
(2, 500, 'Bonus', '20181101', '20181201'),
(2, 300, 'Bonus', '20181201', '20190101'),
(5, 350, 'Bonus', '20181201', '20190101'),
(9, 250, 'Bonus', '20181101', '20181201'),
(9, 400, 'Bonus', '20181201', '20190101');
GO



INSERT INTO SRVC.OrderStatus ([Name])
VALUES
('Confirmed'),
('In progress'),
('Ready for pick-up'),
('Closed');
GO

SET IDENTITY_INSERT SRVC.OrderStatus ON
INSERT INTO SRVC.OrderStatus (OrderStatusID, [Name])
VALUES
(-1, 'Technical')
SET IDENTITY_INSERT SRVC.OrderStatus OFF;
GO

INSERT INTO SRVC.ServiceType ([Name], [Price])
VALUES
('Maintenance Service', 150),
('Running Repairs', 250),
('Body Repair', 200),
('Car care', 100),
('Tyres Replacement', 100);
GO

SET IDENTITY_INSERT SRVC.ServiceType ON
INSERT INTO SRVC.ServiceType (ServiceTypeID, [Name])
VALUES
(-1, 'Technical')
SET IDENTITY_INSERT SRVC.ServiceType OFF;
GO

INSERT INTO dbo.[Client] ([Name], [Surname], [Gender], [Email], [PhoneNumber], [IdentityCardNumber], [Address], [ZipCode], [City]) 
VALUES 
('Katinka', 'Lukianovich', 'Female', 'klukianovich0@dedecms.com', '617-184-6712', '917682978', '6 Messerschmidt Way', '77-043', 'Boston'),
('Thorstein', 'Wolfenden', 'Male', 'twolfenden1@examiner.com', '501-437-3646', '756248139', '3948 Acker Avenue', '97-436', 'Ciudian'),
('Olga', 'Hoyle', 'Female', 'ohoyle2@upenn.edu', '138-743-7892', '921911339', '1 Blue Bill Park Junction', '56-813', 'Fergana'),
('Curr', 'Filipiak', 'Male', 'cfilipiak3@woothemes.com', '118-301-8720', '431392093', '6 Gina Parkway', '87-853', 'Kentau'),
('Pancho', 'Newlove', 'Male', 'pnewlove4@telegraph.co.uk', '417-200-6663', '434216796', '23708 Clemons Alley', '57-590', 'Tiantai'),
('Cristal', 'Webby', 'Female', 'cwebby5@bravesites.com', '869-276-0537', '505981254', '30 Union Terrace', '70-020', 'Bagneux'),
('Mandie', 'Egle of Germany', 'Female', 'megleofgermany6@ezinearticles.com', '240-669-2618', '285883770', '8 Village Court', '49-728', 'Srubec'),
('Tailor', 'Mapes', 'Male', 'tmapes7@umich.edu', '423-415-8116', '377048264', '70410 Westridge Street', '90-691', 'Jalupang Dua'),
('Terrie', 'Trassler', 'Female', 'ttrassler8@freewebs.com', '877-338-8232', '992344456', '489 Marquette Circle', '50-795', 'Urachiche'),
('Terrill', 'Brandolini', 'Male', 'tbrandolini9@blinklist.com', '586-828-0275', '823110220', '859 New Castle Alley', '10-053', 'San Pedro de Macorís'),
('Hal', 'Benning', 'Male', 'hbenninga@yolasite.com', '847-565-2896', '475948550', '1564 Crowley Crossing', '50-848', 'Xi’an'),
('Luise', 'Holberry', 'Female', 'lholberryb@huffingtonpost.com', '277-248-4369', '491534529', '65226 Vernon Crossing', '62-194', 'Ribeiro'),
('Brnaba', 'Henric', 'Male', 'bhenricc@irs.gov', '942-935-5933', '394722940', '738 Marcy Center', '78-749', 'Santa Quitéria do Maranhão'),
('Lane', 'Kuhndel', 'Male', 'lkuhndeld@ow.ly', '863-964-2444', '150275889', '09010 International Alley', '91-096', 'Al Qāmishlī'),
('Ulrike', 'Byrne', 'Female', 'ubyrnee@cyberchimps.com', '189-122-5974', '825953493', '8008 Shasta Road', '28-313', 'Baracatan'),
('Brittany', 'Leamy', 'Female', 'bleamyf@csmonitor.com', '800-767-5100', '524512058', '3700 Summit Avenue', '70-898', 'Mabiton'),
('Sylvan', 'Sapena', 'Male', 'ssapenag@nbcnews.com', '334-159-6031', '562025725', '8 Manufacturers Place', '99-543', 'Montgomery'),
('Lowell', 'Windous', 'Male', 'lwindoush@biglobe.ne.jp', '552-359-9108', '878051912', '224 Esker Parkway', '92-358', 'Damascus'),
('Casey', 'Krzysztof', 'Male', 'ckrzysztofi@addtoany.com', '346-845-5857', '796006371', '5 Sauthoff Pass', '77-503', 'Amherstburg'),
('Sarine', 'Cromett', 'Female', 'scromettj@blogs.com', '734-120-7167', '111167420', '8798 Pearson Street', '55-368', 'Kochenëvo');
GO

SET IDENTITY_INSERT [dbo].[Client] ON
INSERT INTO [dbo].[Client] (ClientID, [Name], [Surname], [IdentityCardNumber])
VALUES
(-1, 'Technical', 'Client', 000000000)
SET IDENTITY_INSERT [dbo].[Client] OFF;
GO


INSERT INTO [Manufacturer] ([Name], [Country], [Founded])
VALUES ('Ford', 'Cambodia', '19000112'),
('Nissan', 'China', '19030930'),
('Mitsubishi', 'Ukraine', '19280820'),
('Maybach', 'Brazil', '19570610'),
('Mercedes-Benz', 'China', '19040426'),
('Toyota', 'Costa Rica', '19270719'),
('Honda', 'Japan', '19530208'),
('Lotus', 'China', '19230818'),
('Bugatti', 'Russia', '19771012'),
('Chevrolet', 'Russia', '19191114'),
('Land Rover', 'China', '19540416'),
('Cadillac', 'Croatia', '19620730'),
('Volkswagen', 'Pakistan', '19710220'),
('Dodge', 'Russia', '19111214'),
('Buick', 'Indonesia', '19650113');
GO


SET IDENTITY_INSERT [dbo].[Manufacturer] ON
INSERT INTO [dbo].[Manufacturer] ([ManufacturerID], [Name])
VALUES
(-1, 'Technical')
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF;
GO

INSERT INTO [Model] ([ManufacturerID], [Name], [YearStart], [YearEnd]) 
VALUES 
(2, 'Solara', '19450316', '19900919'),
 (3, '740', '19500902', '20090401'),
 (8, 'XL-7', '19011125', '20110522'),
 (9, 'G35', '19570102', '19911117'),
 (14, 'S-Series', '19220602', '20151030'),
 (1, 'S-Class', '19310819', '20081119'),
 (15, 'A8', '19400408', '20010103'),
 (8, 'Econoline E350', '19071213', '20160302'),
 (7, 'Esteem', '19291111', '19990922'),
 (7, 'Passat', '19581107', '20010612'),
 (14, 'Corolla', '19090501', '20000620'),
 (10, 'Aspen', '19371108', '20070821'),
 (15, 'Tempo', '19211201', '20160805'),
 (14, 'Talon', '19311113', '20140523'),
 (4, 'Focus', '19330529', '19940629'),
 (3, 'LX', '19560409', '19930927'),
 (8, 'Skylark', '19070403', '20030815'),
 (2, 'Quest', '19161117', '19900801'),
 (13, 'Tracker', '19261211', '20010522'),
 (4, 'M-Class', '19040703', '19910927'),
 (15, 'Rondo', '19411031', '20050130'),
 (1, 'ES', '19301003', '20010815'),
 (3, 'Esprit', '19140506', '19890814'),
 (12, 'i-280', '19580525', '19920110'),
 (4, 'Marauder', '19551107', '19861218'),
 (7, 'Stylus', '19410628', '19810503'),
 (14, 'Sportvan G20', '19250903', '19831017'),
 (15, 'Gemini', '19290721', '19910623'),
 (9, 'Fleetwood', '19381230', '19961009'),
 (8, 'MDX', '19130724', '19720602'),
 (15, 'Avalon', '19540913', '19910723'),
 (7, 'Mountaineer', '19061015', '19900818'),
 (6, 'Gallardo', '19351007', '20080428'),
 (13, 'Land Cruiser', '19230407', '20150914'),
 (15, 'Grand Cherokee', '19381119', '19741210'),
 (4, 'RL', '19151228', '19821007'),
 (5, 'A6', '19190622', '20081211'),
 (13, 'Acclaim', '19310806', '19860319');
 GO

SET IDENTITY_INSERT [dbo].[Model] ON
INSERT INTO [dbo].[Model] ([ModelID], [ManufacturerID], [Name])
VALUES
(-1, -1, 'Technical')
SET IDENTITY_INSERT [dbo].[Model] OFF;
GO


INSERT INTO [Price] ([ModelID], [Price], [DateFrom], [DateTo]) VALUES
(1, 15563, '20180415', '20180515'),
(2, 7569, '20180415', '20180515'),
(3, 20388, '20180415', '20180515'),
(4, 7874, '20180415', '20180515'),
(5, 16169, '20180415', '20180515'),
(6, 8967, '20180415', '20180515'),
(7, 15470, '20180415', '20180515'),
(8, 11736, '20180415', '20180515'),
(9, 18794, '20180415', '20180515'),
(10, 10247, '20180415', '20180515'),
(11, 7316, '20180415', '20180515'),
(12, 8494, '20180415', '20180515'),
(13, 12842, '20180415', '20180515'),
(14, 15441, '20180415', '20180515'),
(15, 18554, '20180415', '20180515'),
(16, 10689, '20180415', '20180515'),
(17, 16361, '20180415', '20180515'),
(18, 6427, '20180415', '20180515'),
(19, 10636, '20180415', '20180515'),
(20, 20871, '20180415', '20180515'),
(21, 8338, '20180415', '20180515'),
(22, 9792, '20180415', '20180515'),
(23, 14347, '20180415', '20180515'),
(24, 16635, '20180415', '20180515'),
(25, 10949, '20180415', '20180515'),
(26, 18835, '20180415', '20180515'),
(27, 7040, '20180415', '20180515'),
(28, 24525, '20180415', '20180515'),
(29, 10955, '20180415', '20180515'),
(30, 22089, '20180415', '20180515'),
(31, 20166, '20180415', '20180515'),
(32, 6395, '20180415', '20180515'),
(33, 22946, '20180415', '20180515'),
(34, 13810, '20180415', '20180515'),
(35, 19661, '20180415', '20180515'),
(36, 8538, '20180415', '20180515'),
(37, 11237, '20180415', '20180515'),
(38, 17178, '20180415', '20180515');
GO


SET IDENTITY_INSERT [dbo].[Order] ON
INSERT INTO [dbo].[Order] (OrderID, ClientID, EmployeeID, Completed, Delivered)
VALUES
(-1, -1, -1, 0, 0)
SET IDENTITY_INSERT [dbo].[Order] OFF;
GO


SET IDENTITY_INSERT SRVC.[Order] ON
INSERT INTO SRVC.[Order] (OrderID, ServiceTypeID, ClientID)
VALUES
(-1, -1, -1)
SET IDENTITY_INSERT SRVC.[Order] OFF;
GO