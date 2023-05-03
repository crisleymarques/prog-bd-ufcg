-- QUESTAO 01
-- Crie um bloco PL/SQL anônimo para recuperar o salário do empregado 101, atribuindo o resultado a uma variável. 
-- Em seguida, no mesmo bloco, imprima o valor do atributo de cursor implícito %ROWCOUNT. 
-- Ainda, imprima "aberto" caso o valor de %ISOPEN seja TRUE; "fechado", caso contrário. 
-- De modo análogo, imprima "encontrou" caso o valor de %FOUND seja TRUE; "não encontrou", caso contrário. 
-- Execute o bloco PL/SQL. 
-- Copie e cole o código produzido, bem como o resultado da execução.

DECLARE
    v_salary OEHR_EMPLOYEES.SALARY%TYPE;
    v_employee_id INTEGER := 101;
BEGIN
    SELECT salary
    INTO v_salary
    FROM OEHR_EMPLOYEES
    WHERE employee_id = v_employee_id;
    
    DBMS_OUTPUT.PUT_LINE(v_salary);
    DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT);

    IF SQL%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('aberto');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('fechado');
    END IF;

    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('encontrou');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('não encontrou');
    END IF;
END;