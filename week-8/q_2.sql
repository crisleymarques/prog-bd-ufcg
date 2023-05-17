-- QUESTAO 02
-- Crie um bloco PL/SQL que recupere o maior salário e a média salarial. 
-- Se a diferença entre o maior salário e a média dos salários for menor que a constante 5000, 
-- imprima 'Dentro da lei'; caso contrário, dispare uma exceção definida pelo usuário e imprima 'Lei violada'. 
-- NÃO use o handler OTHERS. Execute o bloco PL/SQL duas vezes atribuindo os seguintes valores à constante em 
-- cada execução: 15000 e 25000. Copie e cole o código produzido, bem como o resultado das duas execuções. 
-- Faça apenas o que está sendo pedido.

DECLARE
    value constant INTEGER := 15000;
    -- value constant INTEGER := 25000;
    v_avg NUMBER;
    v_max NUMBER;
    e EXCEPTION;
    PRAGMA EXCEPTION_INIT(e, -20001);
BEGIN
    SELECT TRUNC(avg(salary), 2), max(salary) 
    INTO v_avg, v_max
    FROM EMPLOYEES;

    IF v_max - v_avg < value THEN
        DBMS_OUTPUT.PUT_LINE('Dentro da lei');
    ELSE
        raise_application_error(-20001, 'Lei violada');
    END IF;

    EXCEPTION
      WHEN e THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;