select st.name As Tabela,sc.name As Coluna,sp.name As Tipo,sp.max_length As Tamanho 
from sys.tables st 
inner join sys.objects so 
on so.object_id = st.object_id 
inner join sys.columns sc
on st.object_id = sc.object_id
inner join sys.types sp
on sp.system_type_id = sc.system_type_id
where sc.name like '%Preco_produto%'
order by sc.name 