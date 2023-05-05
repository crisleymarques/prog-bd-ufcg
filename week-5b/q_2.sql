-- QUESTAO 02b

-- Crie um bloco PL/SQL anônimo que recupere o nome do departamento (cujo department_id é igual a 40) 
-- e a quantidade de empregados que trabalham nele. 
-- Perceba que duas tabelas devem ser utilizadas na consulta: EMPLOYEES e DEPARTMENTS. 
-- Use a função de agregação COUNT. Imprima ambas as informações obedecendo a formatação abaixo:

-- Departamento: Human Resources
-- Quantidade de empregados: 1


DECLARE
    v_department_name OEHR_DEPARTMENTS.DEPARTMENT_NAME%type;
    v_qtd_emp number;
BEGIN

    SELECT COUNT(e.employee_id), d.department_name
    INTO v_qtd_emp, v_department_name
    FROM OEHR_EMPLOYEES e INNER JOIN OEHR_DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
    where d.department_id = 40
    group by d.department_name;

    DBMS_OUTPUT.PUT_LINE('Nome do departamento: ' || v_department_name);
    DBMS_OUTPUT.PUT_LINE('Quantidade de Funcionários: ' || v_qtd_emp);

END;
