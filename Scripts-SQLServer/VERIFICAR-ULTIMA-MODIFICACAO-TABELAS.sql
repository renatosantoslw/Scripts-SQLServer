SELECT
OBJECT_NAME(object_id,database_id) As Tabela, Index_Id,
last_user_seek, last_user_scan, last_user_lookup, last_user_update
FROM sys.dm_db_index_usage_stats
WHERE database_id = DB_ID()
order by last_user_update desc


SELECT * FROM sys.tables ORDER BY MODIFY_DATE