
-- Adicione ao pacote DDPACK uma função GENERATESTAT para gerar estatísticas sobre todas
-- as tabelas do usuário. Essas estatísticas incluem informações sobre o número de linhas
-- de uma tabela, a distribuição dos dados, etc. e são úteis para o Otimizador de Consultas 
-- do Oracle. 
-- A função não recebe parâmetros e deve retornar um inteiro que corresponde ao número de
-- tabelas que tiveram estatísticas geradas. 
-- Para tal, use os comandos ANALYZE TABLE .. ESTIMATE STATISTICS e EXECUTE IMMEDIATE. 
-- Recrie tanto a especificação quanto o corpo do pacote DDPACK. 
-- Execute a função empacotada GENERATESTAT a partir de um bloco anônimo. 
-- Mostre código e resultado da execução.

CREATE OR REPLACE PACKAGE DDPACK IS
  PROCEDURE GETINVALIDOBJ (p_object_type VARCHAR2);
  FUNCTION GENERATESTAT() RETURN INTEGER;
END DDPACK;

----------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PACKAGE BODY DDPACK IS
  PROCEDURE GETINVALIDOBJ (p_object_type VARCHAR2) IS
  CURSOR c_obj IS
    SELECT object_name
    FROM user_objects
    WHERE object_type = p_object_type AND status = 'INVALID';
  BEGIN
    for o in c_obj loop
      dbms_output.put_line(o.object_name);
    end loop;
  END;
  FUNCTION GENERATESTAT RETURN INTEGER IS
    CURSOR c_tables IS
      SELECT table_name
      FROM user_tables;
    v_num_tables INTEGER;
    sql_stmt VARCHAR2(200);
  BEGIN
    v_num_tables := 0;
    FOR t IN c_tables LOOP
      sql_stmt := 'ANALYZE TABLE ' || t.table_name || ' ESTIMATE STATISTICS;';
      EXECUTE IMMEDIATE sql_stmt;
    v_num_tables := v_num_tables + 1;
    END LOOP;
    RETURN v_num_tables;
  END;
END DDPACK;

----------------------------------------------------------------------------------------------------------------

BEGIN
  DDPACK.GENERATESTAT();
END;