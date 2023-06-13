-- Crie uma stored procedure chamada TabelasUsuario para selecionar e imprimir na tela o nome das tabelas 
-- (e a quantidade de linhas) do usuário no qual você está conectado ao Apex. Só devem ser mostradas as tabelas
--  que tiverem mais de n linhas, onde n deve ser fornecido como parâmetro de entrada para a procedure. 
-- A partir de um bloco anônimo, execute a procedure para os seguintes valores de n: 10 e 100. 
-- Apresente o código-fonte e o resultado das execuções. Crie apenas as estruturas que estão sendo solicitadas.

-- ATENÇÃO: na procedure, é obrigatório usar a visão do dicionário de dados USER_TABLES e
-- o comando EXECUTE IMMEDIATE. Para este último, pesquise como funciona e sua sintaxe.

CREATE OR REPLACE PROCEDURE TabelasUsuario 
(n INTEGER) IS
CURSOR c_tables IS
  SELECT TABLE_NAME 
  FROM USER_TABLES;
sql_stmt VARCHAR2(200);
v_num_rows INTEGER;
BEGIN
  FOR t IN c_tables LOOP
    sql_stmt := 'SELECT count(*) FROM ' || t.table_name;
    EXECUTE IMMEDIATE sql_stmt INTO v_num_rows;
    IF(v_num_rows > n)THEN
      dbms_output.put_line(t.TABLE_NAME|| ' => ' || 'Quantidade de linhas: ' || v_num_rows);
    END IF;
  END LOOP;
END;

----------------------------------------------------------------------------------------------------------------

BEGIN
  TabelasUsuario(10);
  TabelasUsuario(100);
END;