sp_configure 'show adv',1
reconfigure

sp_configure 'max ser',4096
go
sp_configure 'min ser',1024

sp_configure 'max ser'
go
sp_configure 'min ser'

select 1024 * 5