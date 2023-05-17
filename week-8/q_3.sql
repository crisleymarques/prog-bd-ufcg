-- QUESTAO 03
-- Crie um bloco PL/SQL anônimo para verificar se existe algum empregado que NÃO está alocado a um departamento.
-- Caso exista, dispare numa exceção e imprima uma mensagem de tratamento usando a função 
-- RAISE_APPLICATION_ERROR.

DECLARE
    CURSOR c_emps IS 
        select employee_id, first_name, department_id from employees;
    e EXCEPTION;
    PRAGMA EXCEPTION_INIT(e, -20001);
BEGIN
    FOR emp in c_emps LOOP
        IF emp.department_id = null THEN
            DBMS_OUTPUT.PUT_LINE(emp.employee_id || ' ' || emp.first_name);
            RAISE_APPLICATION_ERROR(-20001, 'Existe um empregado desalocado.');
        END IF;
    END LOOP;

    EXCEPTION
      WHEN e THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;