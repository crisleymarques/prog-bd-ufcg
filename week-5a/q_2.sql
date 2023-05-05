-- QUESTAO 02

-- Crie um bloco PL/SQL anônimo que identifica o empregado que começou a trabalhar há mais tempo na empresa. 
-- Em seguida, imprima na tela a situação do empregado em relação à aposentadoria. 
-- Por exemplo, se ele já trabalhou mais de 25 anos, imprima "Apto"; "Inapto", caso contrário. 
-- Copie e cole o código-fonte e o resultado da execução do bloco.

DECLARE
    v_hire_date OEHR_EMPLOYEES.HIRE_DATE%TYPE;
    tempo number;
    response varchar2(40);
BEGIN

    select MIN(HIRE_DATE)
    INTO v_hire_date
    FROM OEHR_EMPLOYEES;

    tempo := months_between(sysdate, v_hire_date) / 12;
    tempo := trunc(tempo);
    
    IF tempo > 25 then
        response := 'Apto';
    ELSE 
        response := 'Inapto';
    end if;

    DBMS_OUTPUT.PUT_LINE(tempo || ' anos de trabalho');
    DBMS_OUTPUT.PUT_LINE(v_hire_date || ' foi a data de contratação');
    DBMS_OUTPUT.PUT_LINE(response);
END;
