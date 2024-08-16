CREATE FUNCTION Fn_extrairnumero(@String VARCHAR(2000)) 
RETURNS VARCHAR(1000) 
AS
  BEGIN
      DECLARE @Count INT
      DECLARE @IntNumeros VARCHAR(1000) 
 
      SET @Count = 0 
      SET @IntNumeros = ''
 
      WHILE @Count <= Len(@String) 
        BEGIN
            IF Substring(@String, @Count, 1) >= '0'
               AND Substring(@String, @Count, 1) <= '9'
              BEGIN
                  SET @IntNumeros = @IntNumeros + Substring(@String, @Count, 1) 
              END
 
            SET @Count = @Count + 1 
        END
 
      RETURN @IntNumeros 
  END
 
go


SELECT DBO.Fn_extrairnumero('TESTE123');