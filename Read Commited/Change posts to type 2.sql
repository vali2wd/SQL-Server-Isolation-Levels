 -- _____  ______          _____     _____ ____  __  __ __  __ _____ _______ ______ _____  
 --|  __ \|  ____|   /\   |  __ \   / ____/ __ \|  \/  |  \/  |_   _|__   __|  ____|  __ \ 
 --| |__) | |__     /  \  | |  | | | |   | |  | | \  / | \  / | | |    | |  | |__  | |  | |
 --|  _  /|  __|   / /\ \ | |  | | | |   | |  | | |\/| | |\/| | | |    | |  |  __| | |  | |
 --| | \ \| |____ / ____ \| |__| | | |___| |__| | |  | | |  | |_| |_   | |  | |____| |__| |
 --|_|  \_\______/_/    \_\_____/   \_____\____/|_|  |_|_|  |_|_____|  |_|  |______|_____/ 

 --	Specifies that statements can't read data that was modified but not committed by other transactions. This prevents dirty reads. Data can be changed by other transactions between individual statements within the current transaction, resulting in nonrepeatable reads or phantom data. This option is the SQL Server default.    
 
BEGIN TRAN;
	UPDATE p
	SET p.PostTypeId = 1
	FROM dbo.Posts p
	WHERE p.Id IN (
		927378,
		927386,
		927397,
		3377569);
	
	SELECT p.Id, p.PostTypeId
	FROM dbo.Posts p
	WHERE p.Id IN (
		927378,
		927386,
		927397,
		3377569);
ROLLBACK;

-- IMPORTANT.
-- Use this to update demo posts to type 1.
UPDATE p
SET p.PostTypeId = 2
FROM dbo.Posts p
WHERE p.Id IN (
		927378,
		927386,
		927397,
		3377569
);