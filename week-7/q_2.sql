-- QUESTAO 02
-- Crie um bloco PL/SQL anônimo contendo um cursor que recupere o nome dos departamentos e a quantidade de 
-- empregados dos departamentos, mas apenas dos departamentos com mais de 5 funcionários. 
-- A cada iteração do laço, imprima o valor do atributo de cursor explícito %ROWCOUNT, bem como o nome do 
-- departamento e a quantidade de empregados. 
-- Use um laço LOOP e a opção %ROWTYPE. 
-- Execute o bloco PL/SQL. Copie e cole o código produzido, bem como o resultado da execução.

DECLARE
    CURSOR c_depts IS 
      SELECT DEPARTMENT_NAME, COUNT(EMPLOYEE_ID) as qtd_emp
      FROM OEHR_EMPLOYEES e, OEHR_DEPARTMENTS d 
      WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID 
      GROUP BY DEPARTMENT_NAME
      HAVING count(e.employee_id) > 5; 
    v_depts c_depts%ROWTYPE;
BEGIN
    OPEN c_depts;
    LOOP
        FETCH c_depts INTO v_depts;
        EXIT WHEN c_depts%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(c_depts%ROWCOUNT || '. ' || v_depts.department_name || ' - ' || v_depts.qtd_emp || ' funcionários');
    END LOOP;
    CLOSE c_depts;
END;