--Eliminando as conexões de um database via KILL:

DECLARE @query VARCHAR(MAX) = ''

SELECT
    @query = COALESCE(@query, ',') + 'KILL ' + CONVERT(VARCHAR, spid) + '; '
FROM
    master..sysprocesses
WHERE
    dbid = DB_ID('Testes') -- Nome do database
    AND dbid > 4 -- Não eliminar sessões em databases de sistema
    AND spid <> @@SPID -- Não eliminar a sua própria sessão


IF (LEN(@query) > 0)
    EXEC(@query)
	
--Eliminando as conexões de um database via ALTER DATABASE:

ALTER DATABASE Testes SET SINGLE_USER WITH ROLLBACK IMMEDIATE
GO

ALTER DATABASE Testes SET MULTI_USER
GO

--Colocando todos os databases da instância no modo SINGLE_USER:

EXEC sp_msforeachdb '
IF (DB_ID(''?'') > 4)
    EXEC (''ALTER DATABASE [?] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;'')'


--Voltando todos os databases da instância para o modo MULTI_USER:

IF (OBJECT_ID('tempdb..#Databases') IS NOT NULL) DROP TABLE #Databases
SELECT IDENTITY(INT, 1,1) AS Id, name
INTO #Databases
FROM sys.sysdatabases
WHERE dbid > 4 -- Ignorar databases de sistema
    

DECLARE 
    @Contador INT = 1, 
    @Total_Databases INT = (SELECT COUNT(*) FROM #Databases),
    @Query VARCHAR(MAX)


WHILE(@Contador <= @Total_Databases)
BEGIN
    
    SELECT @Query = 'ALTER DATABASE [' + name + '] SET MULTI_USER;'
    FROM #Databases
    WHERE Id = @Contador
    
    EXEC(@Query)
    
    SET @Contador = @Contador + 1
    
END

--Voltando todos os databases da instância para o modo MULTI_USER:


IF (OBJECT_ID('tempdb..#Databases') IS NOT NULL) DROP TABLE #Databases
SELECT IDENTITY(INT, 1,1) AS Id, name
INTO #Databases
FROM sys.sysdatabases
WHERE dbid > 4 -- Ignorar databases de sistema
    

DECLARE 
    @Contador INT = 1, 
    @Total_Databases INT = (SELECT COUNT(*) FROM #Databases),
    @Query VARCHAR(MAX)


WHILE(@Contador <= @Total_Databases)
BEGIN
    
    SELECT @Query = 'ALTER DATABASE [' + name + '] SET MULTI_USER;'
    FROM #Databases
    WHERE Id = @Contador
    
    EXEC(@Query)
    
    SET @Contador = @Contador + 1
    
END
