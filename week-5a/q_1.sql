-- QUESTAO 01

-- Crie um bloco anônimo que recupere o sobrenome (last_name) e o email do empregado 101, bem como o nome do seu departamento. 
-- Os valores recuperados devem ser atribuídos a um registro. Imprima os valores na tela no seguinte formato:

-- Last_name: Kochhar

-- Email: NKOCHHAR@store.com

-- Department_name: Executive

-- Copie e cole o código-fonte e o resultado da execução do bloco.


DECLARE

    TYPE EMP_REC_TYPE IS RECORD (
        v_last_name OEHR_EMPLOYEES.LAST_NAME%type,
        v_email OEHR_EMPLOYEES.email%type,
        v_department_name OEHR_DEPARTMENTS.DEPARTMENT_NAME%type
    );
    emp_rec EMP_REC_TYPE;

BEGIN

    SELECT e.last_name, e.email, d.department_name
    INTO emp_rec
    FROM OEHR_EMPLOYEES e INNER JOIN OEHR_DEPARTMENTS d ON e.department_id = d.department_id
    WHERE e.employee_id = 101;

    DBMS_OUTPUT.PUT_LINE('Last_name: ' || emp_rec.v_last_name);
    DBMS_OUTPUT.PUT_LINE('Email: ' || emp_rec.v_email || '@store.com');
    DBMS_OUTPUT.PUT_LINE('Department_name: ' || emp_rec.v_department_name);
    
END;