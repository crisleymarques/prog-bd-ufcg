-- QUESTAO 03

-- Crie um bloco PL/SQL anônimo que seleciona o maior valor de departamento na tabela DEPARTMENTS e o armazena em uma variável.
-- Imprima o resultado na tela. Execute o bloco PL/SQL. Copie e cole o código e o resultado.

-- V_MAX_DEPTNO
-- ------------
-- 40

DECLARE 
    v_department OEHR_DEPARTMENTS.DEPARTMENT_ID%type;
BEGIN
    
    SELECT MAX(DEPARTMENT_ID)
    INTO v_department
    FROM OEHR_DEPARTMENTS;

    DBMS_OUTPUT.PUT_LINE(v_department);
END;


--------------------------------------------------------------------------------------------


DECLARE
    v_depto_name OEHR_DEPARTMENTS.DEPARTMENT_NAME%type;
    v_max_depto integer;
BEGIN

    SELECT DEPARTMENT_ID, DEPARTMENT_NAME
    INTO v_max_depto, v_depto_name
    FROM OEHR_DEPARTMENTS
    where department_id = ( select MAX(DEPARTMENT_ID) from OEHR_DEPARTMENTS );

    DBMS_OUTPUT.PUT_LINE('O maior número de departamento é o ' 
                            || v_max_depto ||
                            ' nomeado de ' ||
                            v_depto_name);
END;
