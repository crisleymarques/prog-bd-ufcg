-- QUESTAO 02
-- Considere agora que o comando 'DELETE FROM departments WHERE department_id = 90' foi executado. 
-- O que acontecerá se o bloco anônimo da questão anterior for re-executado? Explique detalhadamente.

-- R: No PL SQL, quando se faz um SELECT INTO é sempre esperado o retorno de um único valor, 
-- quando não se retorna nenhum ou mais de um valor é considerado um comportamento inválido. 
-- Sendo assim, é retornada a exceção NO_DATA_FOUND.