--As an inspiration for the popular Stack Exchange Data Dump
--https://archive.org/details/stackexchange
BEGIN TRAN;
	CREATE TABLE Posts(
		PostId INT IDENTITY(1000000, 1) PRIMARY KEY,
		Content VARCHAR(3000),
		PostTypeId INT,
		LastActivityDate DATETIME
	);
	SELECT * FROM dbo.Posts;
COMMIT;
--ROLLBACK;

BEGIN TRAN;
	INSERT INTO Posts (Content, PostTypeId, LastActivityDate) VALUES
		('How do I optimize a SQL Server query that uses multiple joins?', 1, '2025-11-08 10:15:32'),
		('What are the differences between READ COMMITTED and REPEATABLE READ?', 2, '2025-11-08 11:02:10'),
		('Here is my stored procedure for calculating averages.', 1, '2025-11-08 09:48:55'),
		('Why does my transaction deadlock when running multiple updates?', 2, '2025-11-08 13:21:44'),
		('Updated documentation for the new indexing strategy.', 3, '2025-11-07 17:32:11'),
		('Example of phantom reads in SQL Server.', 2, '2025-11-08 08:05:19'),
		('Is it safe to use NOLOCK in reporting queries?', 1, '2025-11-06 16:45:22'),
		('Added diagrams for lock escalation behavior.', 3, '2025-11-08 12:11:09'),
		('Why does SERIALIZABLE prevent inserts?', 2, '2025-11-08 11:59:42'),
		('Testing performance impact of clustered index rebuilds.', 1, '2025-11-05 14:22:50');
	SELECT * FROM dbo.Posts;
COMMIT;
--ROLLBACK;

