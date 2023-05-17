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



CREATE OR REPLACE FUNCTION CALCULATARIFA(p_cpf PROPRIETARIO.cpf%TYPE) RETURN NUMBER IS
    CURSOR veiculos_c(id_prop PROPRIETARIO.cpf%TYPE) IS 
        SELECT id_veiculo FROM VEICULO WHERE id_proprietario = id_prop;

    CURSOR registros_c(veiculo VEICULO.id_veiculo%TYPE) IS 
        SELECT permanencia FROM REGISTRO WHERE id_veiculo = veiculo;

    v_id_proprietario PROPRIETARIO.id_proprietario%TYPE;
    v_taxa NUMBER;
BEGIN
    v_taxa := 0;
    SELECT id_proprietario
    INTO v_id_proprietario
    FROM PROPRIETARIO
    WHERE cpf = p_cpf;

    FOR v in veiculos_c(v_id_proprietario) LOOP
        FOR r IN registros_c(v.id_veiculo) LOOP
            IF r.permanencia > 30 THEN
                v_taxa := v_taxa + (r.permanencia - 30) * 0.1;
            END IF;
        END LOOP;
    END LOOP;
    RETURN v_taxa;
END;


DECLARE
    v_tarifa NUMBER;
BEGIN
    -- v_tarifa := CALCULATARIFA('939387738-98');
    v_tarifa := CALCULATARIFA('928282882-1');
    DBMS_OUTPUT.PUT_LINE('A tarifa é de R$ ' || TRUNC(v_tarifa, 2));

    EXCEPTION 
    WHEN no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('Dados não encontrados.');
END;
