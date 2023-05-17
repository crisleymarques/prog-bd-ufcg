-- QUESTAO 01
-- Crie um bloco PL/SQL anônimo que recupera o e-mail de um empregado cujo valor do código (employee_id) 
-- deve ser fornecido por intermédio de uma variável local numérica. Imprima o e-mail recuperado. 
-- Caso nenhuma email seja recuperado, o bloco deve tratar o erro imprimindo a mensagem "Empregado inexistente".
-- Caso seja atribuído um valor não numérico à variável local, o bloco também deve tratar o erro imprimindo 
-- a mensagem "Código inválido". NÃO use o handler OTHERS. 
-- Execute o bloco PL/SQL três vezes atribuindo os seguintes valores à variável local em cada execução: 
-- 101, 999 e '101a'. Copie e cole o código produzido, bem como o resultado das três execuções. 

DECLARE
    v_email EMPLOYEES.email%TYPE;
    v_employee_id INTEGER;
BEGIN
    v_employee_id := 101;
    -- v_employee_id := 999;
    -- v_employee_id := '101a';

    SELECT email
    INTO v_email
    FROM EMPLOYEES
    WHERE employee_id = v_employee_id;
    
    DBMS_OUTPUT.PUT_LINE(v_email);

    EXCEPTION
      WHEN no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('Empregado inexistente');
      WHEN VALUE_ERROR THEN 
        DBMS_OUTPUT.PUT_LINE('Código inválido');
END;