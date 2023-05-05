-- QUESTAO 02

-- Elabore um bloco PL/SQL que compute a remuneração total (salário + salário * bônus). 
-- As variáveis salário anual e a porcentagem do bônus anual devem ser inicializadas na seção executável do bloco. 
-- Execute o bloco PL/SQL. Copie e cole o código e o resultado.

-- Exemplo:

-- Salário anual: 50000

-- Percentual de bônus: 10

-- PL/SQL procedure successfully completed.

-- V_TOTAL
-- -------
-- 55000

DECLARE
    v_salario OEHR_EMPLOYEES.SALARY%TYPE;
    v_bonus NUMBER;
    v_total NUMBER;
BEGIN

    SELECT SALARY, SALARY * NVL(COMMISSION_PCT, 0)
    INTO v_salario, v_bonus
    FROM OEHR_EMPLOYEES
    WHERE EMPLOYEE_ID = 145;

    v_total := v_salario + v_bonus;

    DBMS_OUTPUT.PUT_LINE('Salário anual: ' || v_salario);
    DBMS_OUTPUT.PUT_LINE('Percentual de bônus: ' || v_bonus);
    DBMS_OUTPUT.PUT_LINE('TOTAL: ' || v_total);
END;