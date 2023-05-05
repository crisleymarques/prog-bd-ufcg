-- QUESTAO 04

-- Modifique o bloco PL/SQL que você criou na questão anterior para inserir um novo departamento na tabela DEPARTMENTS.

-- ·   Em vez de imprimir o número do departamento recuperado da questão anterior, adicione 10 a ele e use-o como o número do departamento do novo departamento.
-- ·   Deixe um valor nulo na localização e no número do gerente. Informe o nome do departamento: EDUCATION.
-- ·   Execute o bloco PL/SQL.
-- ·   Com um comando SELECT, exiba o novo departamento criado.
--              DEPTNO  DNAME     MAN_ID  LOC
--              ------ ---------- ----- -------
--              50      EDUCATION

-- Copie e cole o código e os resultados.

DECLARE 
    v_department OEHR_DEPARTMENTS.DEPARTMENT_ID%type;
BEGIN
    
    SELECT MAX(DEPARTMENT_ID)
    INTO v_department
    FROM OEHR_DEPARTMENTS;

    v_department := v_department + 10;

    INSERT INTO OEHR_DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
    VALUES(v_department, 'EDUCATION', NULL, NULL);

    DBMS_OUTPUT.PUT_LINE(v_department);
END;
