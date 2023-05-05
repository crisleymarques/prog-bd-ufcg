-- QUESTAO 01

-- Crie um bloco PL/SQL anônimo que declare duas variáveis e imprima os resultados das variáveis na tela. 
-- Execute o bloco PL/SQL. Copie e cole o código e o resultado.

-- V_CHAR              Character (variable length)
-- V_NUM               Number

-- Atribua valores a essas variáveis do seguinte modo:

-- Variable              Value
-- -----------------------------------------------------------
-- V_CHAR              O literal a seguir: '42 é a resposta'

-- V_NUM               Os primeiros dois caracteres de V_CHAR

DECLARE
    V_CHAR CHARACTER(45);
    V_NUM NUMBER;

BEGIN
    V_CHAR := '42 é a resposta';

    V_NUM := SUBSTR(V_CHAR, 1, 2);
    
    DBMS_OUTPUT.PUT_LINE(V_CHAR);
    DBMS_OUTPUT.PUT_LINE(V_NUM);
END;