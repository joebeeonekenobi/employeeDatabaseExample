/*
	FYI on JOINS

	An inner join returns only the rows which have the join condition met, and contain a full row of amalgamated data from each table.
	An outer join 'also' returns rows that do not meet the join condition, and have only partially filled rows of data (padded with nulls)

	A left join (has to be outer) returns full matched rows; as well as the rows that do not meet the join condition from the former specified table. ie from A in (A join B)
	A right join (has to be outer) returns full matched rows; as well as the rows that do not meet the join condition from the latter specified table. ie from B in (A join B)
	A full outer join returns full matched rows; as well as half filled rows from both the former and latter specified tables.

	There is no such thing as a full inner join, wouldnt make sense as only the rows that match the join condition are returned from an inner.
*/

CREATE TABLE employee (
	[eid] INT NOT NULL IDENTITY,
    [eNumber]      CHAR (8)     NOT NULL,
    [lastName]     VARCHAR (32) NULL,
    [firstName]    VARCHAR (32) NULL,
    [mobileNumber] CHAR (13)    NULL,
    UNIQUE(eNumber),
    PRIMARY KEY CLUSTERED ([eid])
);
INSERT INTO [employee] ([eNumber], [lastName], [firstName], [mobileNumber]) VALUES ('0R4K96OY', 'Harding', 'John', '+441933502413');
INSERT INTO [employee] ([eNumber], [lastName], [firstName], [mobileNumber]) VALUES ('4G87TLM2', 'Benn', 'Hilary', '+447944820855');
INSERT INTO [employee] ([eNumber], [lastName], [firstName], [mobileNumber]) VALUES ('87ER4TN9', 'Aldershot', 'Charlie', '+448202701445');
INSERT INTO [employee] ([eNumber], [lastName], [firstName], [mobileNumber]) VALUES ('UUR863G1', 'Bennet', 'Maria', '+449631554797');

CREATE TABLE clockingData
(
	[cid] INT NOT NULL IDENTITY,
	[eid] INT NOT NULL,
    [isClockIn] BIT NULL,
    [clockDate] DATETIME2 NULL,
    PRIMARY KEY ([cid], [eid]),
    FOREIGN KEY ([eid]) REFERENCES [employee]([eid]),
);
INSERT INTO [clockingData] ([eid], [isClockIn], [clockDate]) VALUES ((select [eid] from [employee] where eNumber = '0R4K96OY'), 'True', '2016-08-12 09:01:55');
INSERT INTO [clockingData] ([eid], [isClockIn], [clockDate]) VALUES ((select [eid] from [employee] where eNumber = '4G87TLM2'), 'True', '2016-08-12 12:00:21');
INSERT INTO [clockingData] ([eid], [isClockIn], [clockDate]) VALUES ((select [eid] from [employee] where eNumber = '87ER4TN9'), 'True', '2016-08-12 10:00:30');
INSERT INTO [clockingData] ([eid], [isClockIn], [clockDate]) VALUES ((select [eid] from [employee] where eNumber = 'UUR863G1'), 'True', '2016-08-12 13:02:59');
INSERT INTO [clockingData] ([eid], [isClockIn], [clockDate]) VALUES ((select [eid] from [employee] where eNumber = '0R4K96OY'), 'False', '2016-08-12 14:00:45');
INSERT INTO [clockingData] ([eid], [isClockIn], [clockDate]) VALUES ((select [eid] from [employee] where eNumber = '4G87TLM2'), 'False', '2016-08-12 17:00:11');
INSERT INTO [clockingData] ([eid], [isClockIn], [clockDate]) VALUES ((select [eid] from [employee] where eNumber = '87ER4TN9'), 'False', '2016-08-12 18:33:19');
INSERT INTO [clockingData] ([eid], [isClockIn], [clockDate]) VALUES ((select [eid] from [employee] where eNumber = 'UUR863G1'), 'False', '2016-08-12 19:12:00');

INSERT INTO [clockingData] ([eid], [isClockIn], [clockDate]) VALUES ((select [eid] from [employee] where eNumber = '0R4K96OY'), 'True', '2016-08-13 08:59:22');
INSERT INTO [clockingData] ([eid], [isClockIn], [clockDate]) VALUES ((select [eid] from [employee] where eNumber = '4G87TLM2'), 'True', '2016-08-13 11:59:53');
INSERT INTO [clockingData] ([eid], [isClockIn], [clockDate]) VALUES ((select [eid] from [employee] where eNumber = '87ER4TN9'), 'True', '2016-08-13 10:57:20');
INSERT INTO [clockingData] ([eid], [isClockIn], [clockDate]) VALUES ((select [eid] from [employee] where eNumber = 'UUR863G1'), 'True', '2016-08-13 13:28:01');
INSERT INTO [clockingData] ([eid], [isClockIn], [clockDate]) VALUES ((select [eid] from [employee] where eNumber = '0R4K96OY'), 'False', '2016-08-13 14:11:41');
INSERT INTO [clockingData] ([eid], [isClockIn], [clockDate]) VALUES ((select [eid] from [employee] where eNumber = '4G87TLM2'), 'False', '2016-08-13 17:11:10');
INSERT INTO [clockingData] ([eid], [isClockIn], [clockDate]) VALUES ((select [eid] from [employee] where eNumber = '87ER4TN9'), 'False', '2016-08-13 18:11:15');
INSERT INTO [clockingData] ([eid], [isClockIn], [clockDate]) VALUES ((select [eid] from [employee] where eNumber = 'UUR863G1'), 'False', '2016-08-13 19:46:55');

INSERT INTO [clockingData] ([eid], [isClockIn], [clockDate]) VALUES ((select [eid] from [employee] where eNumber = '0R4K96OY'), 'True', '2016-08-14 08:55:57');
INSERT INTO [clockingData] ([eid], [isClockIn], [clockDate]) VALUES ((select [eid] from [employee] where eNumber = '4G87TLM2'), 'True', '2016-08-14 11:55:05');
INSERT INTO [clockingData] ([eid], [isClockIn], [clockDate]) VALUES ((select [eid] from [employee] where eNumber = '87ER4TN9'), 'True', '2016-08-14 10:40:02');
INSERT INTO [clockingData] ([eid], [isClockIn], [clockDate]) VALUES ((select [eid] from [employee] where eNumber = 'UUR863G1'), 'True', '2016-08-14 13:55:19');
INSERT INTO [clockingData] ([eid], [isClockIn], [clockDate]) VALUES ((select [eid] from [employee] where eNumber = '0R4K96OY'), 'False', '2016-08-14 13:42:08');
INSERT INTO [clockingData] ([eid], [isClockIn], [clockDate]) VALUES ((select [eid] from [employee] where eNumber = '4G87TLM2'), 'False', '2016-08-14 16:42:47');
INSERT INTO [clockingData] ([eid], [isClockIn], [clockDate]) VALUES ((select [eid] from [employee] where eNumber = '87ER4TN9'), 'False', '2016-08-14 18:01:11');
INSERT INTO [clockingData] ([eid], [isClockIn], [clockDate]) VALUES ((select [eid] from [employee] where eNumber = 'UUR863G1'), 'False', '2016-08-14 19:42:48');

INSERT INTO [clockingData] ([eid], [isClockIn], [clockDate]) VALUES ((select [eid] from [employee] where eNumber = '0R4K96OY'), 'True', '2016-08-15 09:04:21');
INSERT INTO [clockingData] ([eid], [isClockIn], [clockDate]) VALUES ((select [eid] from [employee] where eNumber = '4G87TLM2'), 'True', '2016-08-15 12:04:53');
INSERT INTO [clockingData] ([eid], [isClockIn], [clockDate]) VALUES ((select [eid] from [employee] where eNumber = '87ER4TN9'), 'True', '2016-08-15 10:16:45');
INSERT INTO [clockingData] ([eid], [isClockIn], [clockDate]) VALUES ((select [eid] from [employee] where eNumber = 'UUR863G1'), 'True', '2016-08-15 13:04:53');
INSERT INTO [clockingData] ([eid], [isClockIn], [clockDate]) VALUES ((select [eid] from [employee] where eNumber = '0R4K96OY'), 'False', '2016-08-15 14:22:28');
INSERT INTO [clockingData] ([eid], [isClockIn], [clockDate]) VALUES ((select [eid] from [employee] where eNumber = '4G87TLM2'), 'False', '2016-08-15 16:22:12');
INSERT INTO [clockingData] ([eid], [isClockIn], [clockDate]) VALUES ((select [eid] from [employee] where eNumber = '87ER4TN9'), 'False', '2016-08-15 18:00:10');
INSERT INTO [clockingData] ([eid], [isClockIn], [clockDate]) VALUES ((select [eid] from [employee] where eNumber = 'UUR863G1'), 'False', '2016-08-15 19:22:42');

CREATE VIEW [clockingInData] AS 
select 
	[clockingData].[clockDate] AS [dateTime], 
	[employee].[firstName] AS [firstName], 
	[employee].[lastName] AS [lastName], 
	[employee].[eid] AS [eid],
	[employee].[eNumber] AS [eNumber]
FROM [employee] 
JOIN [clockingData] 
ON [employee].[eid] = [clockingData].[eid]
Where [clockingData].[isClockIn] = 1;

CREATE VIEW [clockingOutData] AS 
select 
	[clockingData].[clockDate] AS [dateTime], 
	[employee].[firstName] AS [firstName], 
	[employee].[lastName] AS [lastName], 
	[employee].[eid] AS [eid],
	[employee].[eNumber] AS [eNumber]
FROM [employee] 
JOIN [clockingData] 
ON [employee].[eid] = [clockingData].[eid]
Where [clockingData].[isClockIn] = 1;
