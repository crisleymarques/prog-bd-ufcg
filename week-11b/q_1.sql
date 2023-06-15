-- Crie a tabela LOCACAO e insira as linhas abaixo.

CREATE TABLE locacao (
  cod_locacao INTEGER PRIMARY KEY,
  cod_carro INTEGER,
  cod_cliente INTEGER,
  dt_locacao DATE,
  dt_entrega DATE,
  dias INTEGER,
  valor NUMBER(7,2));

INSERT INTO locacao VALUES (100,12,19,'22/03/2020','28/03/2020',null,1045.30);
INSERT INTO locacao VALUES (101,17,22,'12/01/2020','31/01/2020',null,2300.15);
INSERT INTO locacao VALUES (119,29,18,'09/01/2020','25/01/2020',null,2454.18);
INSERT INTO locacao VALUES (239,28,19,'15/01/2021','20/01/2021',null,897.87);
INSERT INTO locacao VALUES (292,88,16,'15/06/2021','22/06/2021',null,999.87);

-- 1. Crie o pacote LOCA_PACK com a seguinte função e procedure:

-- Função MAIORVALOR que recebe como entrada um ano (INTEGER) e retorna o maior valor 
-- pago em uma locação naquele ano. [3,0 Pontos]
-- Procedure CALCULADIAS que calcula a quantidade de dias de cada locação e atualiza a 
-- coluna dias com o valor calculado. [3,0 Pontos]
-- Mostre o código-fonte.

CREATE OR REPLACE PACKAGE LOCA_PACK IS 
  FUNCTION MAIORVALOR(ano INTEGER) RETURN NUMBER;
  PROCEDURE CALCULADIAS;
END LOCA_PACK;

CREATE OR REPLACE PACKAGE BODY LOCA_PACK IS
  FUNCTION MAIORVALOR(ano INTEGER) RETURN NUMBER IS
    v_maior_valor NUMBER;
  BEGIN
    SELECT MAX(valor) 
    INTO v_maior_valor
    FROM locacao
    WHERE EXTRACT(YEAR FROM dt_locacao) = ano;
    RETURN v_maior_valor;
  END;
  PROCEDURE CALCULADIAS IS
    CURSOR c_loc IS SELECT cod_locacao, dt_locacao, dt_entrega FROM locacao;
    v_dias locacao.dias%TYPE;
  BEGIN
    FOR loc IN c_loc LOOP 
      v_dias := loc.dt_entrega - loc.dt_locacao;
      update locacao set dias = v_dias where cod_locacao = loc.cod_locacao;
    END LOOP;
  END;
END LOCA_PACK;


-- 2. Execute a procedure empacotada CALCULADIAS. 
-- Em seguida, execute um comando SELECT para mostrar os valores das colunas cod_locacao e dias. 
-- Mostre o código-fonte e a saída do SELECT. [2,0 Pontos]

begin
  LOCA_PACK.CALCULADIAS;
end;

select cod_locacao, dias from locacao;

-- 3. Execute a função empacotada MAIORVALOR (entrada = ano de 2020) e imprima na tela o
-- resultado da função. Mostre o código-fonte usado e a saída. [2,0 Pontos]

declare
  v_ano INTEGER;
begin
  v_ano := 2020;
  dbms_output.put_line('O maior valor para ' || v_ano || ' é ' || LOCA_PACK.MAIORVALOR(v_ano));
end;