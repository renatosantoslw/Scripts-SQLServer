/*REINDEXAR APOS O SHRINK*/

/*Desabilitar AutoShrink*/
/*Desabilitar AutoClose*/

GO
DECLARE @TableName varchar(255)
DECLARE TableCursor CURSOR FOR
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'base table'
OPEN TableCursor
FETCH NEXT FROM TableCursor INTO @TableName
	WHILE @@FETCH_STATUS = 0
	BEGIN
		PRINT 'Reindexing: ' + @TableName
		DBCC DBREINDEX(@TableName,' ',90)
		FETCH NEXT FROM TableCursor INTO @TableName
	END
CLOSE TableCursor
DEALLOCATE TableCursor