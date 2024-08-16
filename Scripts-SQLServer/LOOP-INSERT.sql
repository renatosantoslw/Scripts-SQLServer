DECLARE @cnt INT =1;
WHILE @cnt < 216
BEGIN
   Insert Into Produto (Codigo,Nome,Unidade) Values (@cnt, 'NOME PRODUTO ' + CAST(@CNT AS VARCHAR),'KG')
   SET @cnt = @cnt + 1;
END;

PRINT 'Fim';
GO

