 -- _____  ______          _____     _____ ____  __  __ __  __ _____ _______ ______ _____  
 --|  __ \|  ____|   /\   |  __ \   / ____/ __ \|  \/  |  \/  |_   _|__   __|  ____|  __ \ 
 --| |__) | |__     /  \  | |  | | | |   | |  | | \  / | \  / | | |    | |  | |__  | |  | |
 --|  _  /|  __|   / /\ \ | |  | | | |   | |  | | |\/| | |\/| | | |    | |  |  __| | |  | |
 --| | \ \| |____ / ____ \| |__| | | |___| |__| | |  | | |  | |_| |_   | |  | |____| |__| |
 --|_|  \_\______/_/    \_\_____/   \_____\____/|_|  |_|_|  |_|_____|  |_|  |______|_____/ 

 --	Specifies that statements can't read data that was modified but not committed by other transactions. This prevents dirty reads. Data can be changed by other transactions between individual statements within the current transaction, resulting in nonrepeatable reads or phantom data. This option is the SQL Server default.
 
SELECT 
	p.*
FROM dbo.Posts AS p WITH (INDEX = PK_Posts__Id)
WHERE p.ParentId = 
(
	SELECT TOP(1)
		p2.ParentId
	FROM dbo.Posts AS p2
	WHERE p2.PostTypeId = 2
	ORDER BY
		p2.Score DESC,
		p2.Id DESC
)
OPTION(MAXDOP 1);