--SERVIDOR 1-------------------------------------------------------------------------------

DECLARE @servidor AS VARCHAR(MAX) = '127.0.0.1';

if exists(select * from sys.servers where name = @servidor)
begin
EXEC sp_dropserver                @servidor, 'droplogins';
END
EXEC sp_addlinkedserver @server = @servidor
EXEC sp_addlinkedsrvlogin         @servidor,'false',NULL,'sa','epilef';
EXEC sp_serveroption              @servidor, 'rpc', true;
EXEC sp_serveroption              @servidor, 'rpc out', true
GO

--SERVIDOR 2-------------------------------------------------------------------------------

DECLARE @servidor AS VARCHAR(MAX) = '127.0.0.2'

if exists(select * from sys.servers where name = @servidor)
begin
EXEC sp_dropserver                @servidor, 'droplogins';
END
EXEC sp_addlinkedserver @server = @servidor
EXEC sp_addlinkedsrvlogin         @servidor,'false',NULL,'sa','epilef';
EXEC sp_serveroption              @servidor, 'rpc', true;
EXEC sp_serveroption              @servidor, 'rpc out', true;
GO
