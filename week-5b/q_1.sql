-- QUESTAO 01b

-- Crie um bloco PL/SQL anônimo e, na parte executável do bloco, escreva um comando para criar uma tabela qualquer no banco de dados. 
-- Exemplo: CREATE TABLE mytab (id NUMBER). Execute o bloco. O bloco foi executado com sucesso? Ocorreu algum erro? A tabela foi criada? 
-- Caso não tenha conseguido criar a tabela, pesquise na documentação do SGBD Oracle como executar um comando DDL a partir de um bloco PL/SQL.


-- DDL: DATA DEFINITION LANGUAGEM
-- - São comando utilizados para criar e modificar a estrutura dos objetos no BD. 
-- - CREATE, DROP, ALTER, TRUNCATE, COMMENT, RENAME...

Para executar comandos DDL em um bloco PL/SQL é preciso fazer uso de SQL dinâmico, utilizando o comando EXECUTE IMMEDIATE:

BEGIN
    EXECUTE IMMEDIATE 'CREATE TABLE teste2 (id number, 
                                            nome varchar2(45))';
END;