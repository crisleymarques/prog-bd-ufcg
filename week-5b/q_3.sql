-- QUESTAO 03b

-- Crie um bloco PL/SQL anônimo que recupere os dados do empregado cujo employee_id é igual a 101 
-- e imprima seus dados na tela de acordo com o formato a seguir.

-- <<Ficha do Empregado>>
-- Nome do Empregado: Neena Kochhar
-- Departamento: Executive
-- Tempo de trabalho: 13 anos.
-- Email: Neena@empresa.com
-- Salário: $17,000.00
-- Cargo: Administration Vice President


DECLARE
    TYPE EMP_REC_TYPE IS RECORD (
        v_first_name OEHR_EMPLOYEES.FIRST_NAME%TYPE,
        v_last_name OEHR_EMPLOYEES.LAST_NAME%TYPE,
        v_depto_name OEHR_DEPARTMENTS.DEPARTMENT_NAME%TYPE,
        v_working_time INTEGER,
        v_email OEHR_EMPLOYEES.EMAIL%TYPE,
        v_salary OEHR_EMPLOYEES.SALARY%TYPE,
        v_job_title OEHR_JOBS.JOB_TITLE%TYPE
    );
    emp_rec EMP_REC_TYPE;
BEGIN
    SELECT e.FIRST_NAME, 
            e.LAST_NAME, 
            d.DEPARTMENT_NAME, 
            TRUNC(MONTHS_BETWEEN(SYSDATE, e.HIRE_DATE) / 12), 
            e.EMAIL, 
            e.SALARY + e.SALARY * NVL(e.COMMISSION_PCT, 0),
            j.JOB_TITLE
    INTO emp_rec
    FROM OEHR_EMPLOYEES e 
        INNER JOIN OEHR_DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
        INNER JOIN OEHR_JOBS j ON e.JOB_ID = j.JOB_ID
    WHERE e.EMPLOYEE_ID = 101;

    DBMS_OUTPUT.PUT_LINE('<<Ficha do Empregado>>');
    DBMS_OUTPUT.PUT_LINE('Nome do Empregado: ' || emp_rec.v_first_name || ' ' || emp_rec.v_last_name);
    DBMS_OUTPUT.PUT_LINE('Departamento: ' || emp_rec.v_depto_name);
    DBMS_OUTPUT.PUT_LINE('Tempo de trabalho: ' || emp_rec.v_working_time || ' anos.');
    DBMS_OUTPUT.PUT_LINE('Email: ' || emp_rec.v_email || '@empresa.com');
    DBMS_OUTPUT.PUT_LINE('Salário: $' || emp_rec.v_salary);
    DBMS_OUTPUT.PUT_LINE('Cargo: ' || emp_rec.v_job_title);
END;
