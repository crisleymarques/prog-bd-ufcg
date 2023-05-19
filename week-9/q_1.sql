-- QUESTAO 01
-- Crie uma função chamada CALCULATARIFA para computar e retornar o valor total a ser cobrado para os estacionamentos de um proprietário. 
-- O CPF deve ser fornecido como entrada. Um proprietário pode ter mais de um veículo cadastrado. 
-- A taxa a ser cobrada é de R$ 0,10 por cada minuto excedido em cada estacionamento que tenha durado mais de 30 minutos. 
-- Caso o tempo de um estacionamento não tenha excedido 30 minutos a taxa é zero. 
-- Por exemplo, o proprietário de CPF 939387738-98 fez três estacionamentos com duração de 60, 22 e 32 minutos. 
-- O valor total a ser retornado é de 30 (minutos excedidos) * 0,10 (reais) + 0 (minuto excedido) * 0,10 (reais) + 2 (minutos excedidos) * 0,10 (reais) = 3,20 reais. 
-- Usando uma seção EXCEPTION na função, trate o caso em que não existe registro de estacionamento para o proprietário informado, retornando uma mensagem de erro. 
-- NÃO use o handler OTHERS. Crie um bloco PL/SQL anônimo para executar a função CALCULATARIFA e imprimir na tela o resultado retornado. 
-- Mostre o código-fonte e os resultados da execução do bloco anônimo com um CPF cadastrado e outro inexistente na tabela. 
-- Crie apenas as estruturas que estão sendo solicitadas. Não use função local nem blocos aninhados.


-- Está com um bug que não funciona quando o proprietário não tem registros de estacionamento
CREATE OR REPLACE FUNCTION CALCULATARIFA(p_cpf PROPRIETARIO.cpf%TYPE) RETURN NUMBER IS
    CURSOR veiculos_c IS 
        SELECT id_veiculo FROM PROPRIETARIO p, VEICULO v WHERE p.cpf = p_cpf AND p.id_proprietario = v.id_proprietario;

    CURSOR registros_c(veiculo VEICULO.id_veiculo%TYPE) IS 
        SELECT permanencia FROM REGISTRO WHERE id_veiculo = veiculo;

    v_registro registros_c%ROWTYPE;
    v_taxa NUMBER;
    tem_registo BOOLEAN;
    e EXCEPTION;
    PRAGMA EXCEPTION_INIT(e, -20001);
BEGIN
    v_taxa := 0;
    tem_registo := false;

    FOR v in veiculos_c LOOP
        OPEN registros_c(v.id_veiculo);
        LOOP
            FETCH registros_c into v_registro;
            EXIT WHEN registros_c%NOTFOUND;
            IF registros_c%FOUND THEN
                tem_registo := true;
            END IF;
            IF v_registro.permanencia > 30 THEN
                v_taxa := v_taxa + (v_registro.permanencia - 30) * 0.1;
            END IF;
        END LOOP;
        CLOSE registros_c;
    END LOOP;

    IF tem_registo = false THEN
        raise_application_error(-20001, 'Não tem registro para esse proprietario.');
    END IF;

    RETURN v_taxa;

    EXCEPTION
      WHEN e THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;


DECLARE
    CURSOR cpf_prop IS
        SELECT cpf FROM PROPRIETARIO;
    v_tarifa NUMBER;
    v_cpf cpf_prop%rowtype;
    v_comando VARCHAR2(300);
BEGIN

    OPEN cpf_prop;
    LOOP
        FETCH cpf_prop INTO v_cpf;
        EXIT WHEN cpf_prop%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_cpf.cpf);
        v_tarifa := CALCULATARIFA('928282882-12');
        DBMS_OUTPUT.PUT_LINE('A tarifa é de R$ ' || TRUNC(v_tarifa, 2) || ' proprietario => ' || v_cpf.cpf);
    END LOOP;
    CLOSE cpf_prop;

END;
