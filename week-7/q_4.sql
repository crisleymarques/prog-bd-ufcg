-- QUESTAO 04
-- Crie um bloco PL/SQL anônimo para renomear tabelas. 
-- As tabelas que apresentam o prefixo "OEHR_" no nome, devem ser renomeadas para ficar sem o prefixo. 
-- Por exemplo, a tabela OEHR_EMPLOYEES deve ser renomeada para EMPLOYEES.

-- Dicas:
-- - use o comando ALTER TABLE ... RENAME to... para mudar o nome da tabela;
-- - use o comando EXECUTE IMMEDIATE... para executar a alteração do nome;
-- - os nomes das tabelas podem ser recuperadas a partir da visão do dicionário de dados USER_TABLES.

DECLARE 
  CURSOR c_tables IS
    SELECT table_name 
    FROM USER_TABLES 
    WHERE table_name LIKE 'OEHR_%';
  sql_stmt VARCHAR2(200);
BEGIN 
  FOR t IN c_tables LOOP
    sql_stmt := 'ALTER TABLE ' || t.table_name || ' RENAME TO ' || SUBSTR(t.table_name, LENGTH('OEHR_')+1);
    EXECUTE IMMEDIATE sql_stmt;
  END LOOP;
END;