
/*SUBSTITUI STRINGS*/
UPDATE PRODUTO
SET NOME = REPLACE ( NOME , 'SUBSTITUIR' , 'POR' )
WHERE NOME LIKE '%SUBSTITUIR%'
  
SELECT Nome FROM PRODUTO WHERE Nome LIKE '%''%'

/*REMOVE ESPA�OS EM BRANCO*/
UPDATE Produto set Nome = lTRIM(NOME)

/*ADICIONA ESPACOS*/
SELECT SPACE(3) + nome FROM produto

/*CONTA STRINGS*/
select  Nome ,LEN(nome) Qtde FROM Produto order by Qtde

/*select ultimo registro*/
 Select max(Codigo) from Contas_Receber
 
 /*SELECT CONVERTENDO TIPOS*/
SELECT CAST(Codigo_Barra AS  TEXT) AS 'CODIGO DE BARRAS CONVERTIDO EM TXT' FROM Produto

/*APAGA TODOS OS DADO DA TABELA*/
TRUNCATE TABLE ESTOQUE
TRUNCATE  TABLE PRODUTO

/* ALTERA TIPOS DE UMA COLUNA*/ 
ALTER TABLE IMPORTACAO ALTER COLUMN [CODIGO DE BARRAS] VARCHAR(25)

/* COLUNA COM SEQUENCIA*/ 
SELECT ROW_NUMBER() OVER(ORDER BY nome ASC) AS 'N_CODIGO', * FROM PRODUTOS



 
 
  
  