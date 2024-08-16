
SELECT * FROM (SELECT s.host_name, s.session_id,s.program_name,DB_NAME(p.dbid) as NomeBanco,COUNT(dbid) as Numero_Conexoes,loginame as Login  FROM sys.dm_exec_sessions s, sys.sysprocesses p WHERE p.dbid > 0 GROUP BY s.host_name,s.session_id,s.program_name, p.dbid, p.loginame)  Consulta



DBCC TRACEOFF

SELECT session_id,program_name FROM sys.dm_exec_sessions WHERE PROGRAM_NAME = 'Express Profiler'

KILL 51


SELECT * FROM sys.traces

SELECT * FROM sys.traces WHERE is_default = 1

---ATIVANDO TRACES
EXEC sp_configure 'show advanced options', 1;
GO
RECONFIGURE;
GO
EXEC sp_configure 'default trace enabled', 1;
GO
RECONFIGURE;
GO
EXEC sp_configure 'show advanced options', 0;
GO
RECONFIGURE;
GO



---DESATIVANDO TRACES
EXEC sp_configure 'show advanced options', 1;
GO
RECONFIGURE;
GO
EXEC sp_configure 'default trace enabled', 0;
GO
RECONFIGURE;
GO
EXEC sp_configure 'show advanced options', 0;
GO
RECONFIGURE;
GO



SELECT session_id,program_name FROM sys.dm_exec_sessions WHERE PROGRAM_NAME = 'Express Profiler'



SELECT * FROM sys.dm_exec_sessions 
              sys.sysprocesses


SELECT * FROM (SELECT s.status,s.host_name, s.session_id,s.program_name,DB_NAME(p.dbid) as NomeBanco,COUNT(dbid) as Numero_Conexoes,loginame as Login  FROM sys.dm_exec_sessions s, sys.sysprocesses p WHERE p.dbid > 0 GROUP BY s.status,s.host_name,s.session_id,s.program_name, p.dbid, p.loginame)  Consulta where status='running'



WHERE dbid > 0 GROUP BY dbid, loginame



SELECT * FROM sys.dm_exec_sessions

KILL 51


SELECT * FROM sys.traces

SELECT * FROM sys.traces WHERE is_default = 1

---ATIVANDO TRACES
EXEC sp_configure 'show advanced options', 1;
GO
RECONFIGURE;
GO
EXEC sp_configure 'default trace enabled', 1;
GO
RECONFIGURE;
GO
EXEC sp_configure 'show advanced options', 0;
GO
RECONFIGURE;
GO



---DESATIVANDO TRACES
EXEC sp_configure 'show advanced options', 1;
GO
RECONFIGURE;
GO
EXEC sp_configure 'default trace enabled', 0;
GO
RECONFIGURE;
GO
EXEC sp_configure 'show advanced options', 0;
GO
RECONFIGURE;
GO