-- Crie um pacote chamado DDPACK contendo uma procedure chamada GETINVALIDOBJ. 
-- A procedure deve receber como parâmetro um tipo de objeto (e.g. PROCEDURE, FUNCTION, etc.) e imprimir 
-- na tela o nome dos objetos do tipo fornecido como entrada que estão inválidos no banco de dados. 
-- Crie tanto a especificação quanto o corpo do pacote. 
-- Execute a procedure empacotada para listar as funções inválidas, a partir de um bloco anônimo. 
-- Mostre código e resultado da execução.

CREATE OR REPLACE PACKAGE DDPACK IS
  PROCEDURE GETINVALIDOBJ (p_object_type VARCHAR2);
END DDPACK;

----------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PACKAGE BODY DDPACK IS
  PROCEDURE GETINVALIDOBJ (p_object_type VARCHAR2) IS
  CURSOR c_obj IS
    SELECT object_name
    FROM user_objects
    WHERE object_type = p_object_type AND status = 'INVALID';
  BEGIN
    for o in c_obj loop
      dbms_output.put_line(o.object_name);
    end loop;
  END;
END DDPACK;

----------------------------------------------------------------------------------------------------------------

BEGIN
  DDPACK.GETINVALIDOBJ('PROCEDURE');
END;