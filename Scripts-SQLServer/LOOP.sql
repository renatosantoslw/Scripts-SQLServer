
DECLARE @cnt INT = 0;
WHILE @cnt < 216
BEGIN
   PRINT 'Loop: ' + cast(@cnt as varchar);
   SET @cnt = @cnt + 1;
END;

PRINT 'Fim';
GO