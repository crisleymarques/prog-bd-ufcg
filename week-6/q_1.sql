-- QUESTAO 01
-- Execute um comando SELECT para exibir os valores da coluna department_id da tabela DEPARTMENTS. 
-- Analise os valores retornados a fim de identificar se existe algum padrão. 
-- Crie um bloco PL/SQL anônimo que recupere e imprima na tela o nome de todos os departamentos. 
-- Use um laço WHILE ou LOOP. NÃO use cursor. Execute o bloco.

DECLARE
    v_department_name OEHR_DEPARTMENTS.department_name%type;
    step constant INTEGER := 10;
    min_id INTEGER;
    max_id INTEGER;
    i INTEGER;
BEGIN
    SELECT MIN(department_id)
    INTO min_id
    FROM OEHR_DEPARTMENTS;
    
    SELECT MAX(department_id)
    INTO max_id
    FROM OEHR_DEPARTMENTS;

    dbms_output.put_line('Department Names');

    i := min_id;

    LOOP 
        SELECT department_name
        INTO v_department_name
        FROM OEHR_DEPARTMENTS
        WHERE department_id = i;
        dbms_output.put_line(i || ' - ' || v_department_name);
        EXIT WHEN i >= max_id;
        i := i + step;
    END LOOP;
END;

-- Department Names
-- 10 - Administration
-- 20 - Marketing
-- 30 - Purchasing
-- 40 - Human Resources
-- 50 - Shipping
-- 60 - IT
-- 70 - Public Relations
-- 80 - Sales
-- 90 - Executive
-- 100 - Finance
-- 110 - Accounting
-- 120 - Treasury
-- 130 - Corporate Tax
-- 140 - Control And Credit
-- 150 - Shareholder Services
-- 160 - Benefits
-- 170 - Manufacturing
-- 180 - Construction
-- 190 - Contracting
-- 200 - Operations
-- 210 - IT Support
-- 220 - NOC
-- 230 - IT Helpdesk
-- 240 - Government Sales
-- 250 - Retail Sales
-- 260 - Recruiting
-- 270 - Payroll
-- 280 - EDUCATION

-- Statement processed.
