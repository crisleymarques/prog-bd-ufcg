-- QUESTAO 03
-- Reescreva o código da questão anterior usando um laço FOR. 
-- Execute o bloco PL/SQL. Copie e cole o código produzido, bem como o resultado da execução.

DECLARE
    CURSOR c_depts IS 
      SELECT DEPARTMENT_NAME, COUNT(EMPLOYEE_ID) as qtd_emp
      FROM OEHR_EMPLOYEES e, OEHR_DEPARTMENTS d 
      WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID 
      GROUP BY DEPARTMENT_NAME
      HAVING count(e.employee_id) > 5; 
BEGIN
    FOR dept IN c_depts LOOP
        DBMS_OUTPUT.PUT_LINE(c_depts%ROWCOUNT || '. ' || dept.department_name || ' - ' || dept.qtd_emp || ' funcionários');
    END LOOP;
END;