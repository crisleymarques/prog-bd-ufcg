-- QUESTAO 04
-- Crie um bloco PL/SQL anônimo com um cursor explícito (laço LOOP) que seleciona os salários dos empregados. 
-- Na quarta iteração do cursor provoque uma exceção de divisão por zero e trate-a com o handler pré-definido pelo Oracle. 
-- O handler deve fechar o cursor e mostrar uma mensagem "Cursor fechado".

DECLARE
    CURSOR c_emps IS select salary from employees;
    v_salary EMPLOYEES.salary%TYPE;
BEGIN
    OPEN c_emps;
    LOOP
        FETCH c_emps INTO v_salary;
        EXIT WHEN c_emps%NOTFOUND;
        IF c_emps%ROWCOUNT = 4 THEN
            RAISE zero_divide;
        END IF;
    END LOOP;

    EXCEPTION
      WHEN zero_divide THEN
        close c_emps;
        DBMS_OUTPUT.PUT_LINE('Cursor fechado');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
