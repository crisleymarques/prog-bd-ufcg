-- QUESTAO 03
-- Crie uma tabela chamada SINTETICA com as colunas codigo (PRIMARY KEY) INTEGER, nome VARCHAR2(10), 
-- nascimento DATE e sexo CHAR(1). Crie um bloco PL/SQL anônimo para inserir 500 linhas na tabela criada. 
-- O povoamento das colunas deve obedecer as seguintes regras:

-- - codigo: valor do contador
-- - nome: se contador for par, deve ser Mr. <valor do contador>. Caso contrário, Mrs. <valor do contador>
-- - nascimento: data atual - valor do contador
-- - sexo: se contador for par, deve ser M. Caso contrário, F.

-- Execute o bloco criado. Execute uma consulta para mostrar a quantidade de valores distintos na coluna nome.

CREATE TABLE SINTETICA (
  codigo INTEGER PRIMARY KEY,
  nome VARCHAR2(10),
  nascimento DATE,
  sexo CHAR(1)
);

DECLARE
    qtd CONSTANT INTEGER := 500;

BEGIN   
    FOR i IN 1..qtd LOOP
        IF MOD(i, 2) = 0 THEN
            INSERT INTO SINTETICA (codigo, nome, nascimento, sexo)
            VALUES (i, 'Mr ' || i, SYSDATE - i, 'M');
        ELSE
            INSERT INTO SINTETICA (codigo, nome, nascimento, sexo)
            VALUES (i, 'Mrs ' || i, SYSDATE - i, 'F');
        END IF;
    END LOOP;
END;

SELECT COUNT(DISTINCT nome) qtd_nomes FROM sintetica;

-- QTD_NOMES
-- ---------
-- 500