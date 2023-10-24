-- Demitir 2 funcionários de cada departamento no dia 12/10/2023 (exemplo aleatório)
-- Lembre-se de que esta consulta pode variar dependendo do seu banco de dados.

-- Demissões no departamento de Recursos Humanos
UPDATE funcionario
SET dt_demissao = '2023-10-12'
WHERE departamento = 'Recursos Humanos'
ORDER BY RAND()
LIMIT 2;

-- Demissões no departamento de Vendas
UPDATE funcionario
SET dt_demissao = '2023-10-12'
WHERE departamento = 'Vendas'
ORDER BY RAND()
LIMIT 2;

-- Demissões no departamento de Produção
UPDATE funcionario
SET dt_demissao = '2023-10-12'
WHERE departamento = 'Produção'
ORDER BY RAND()
LIMIT 2;

-- Demissões no departamento Administrativo
UPDATE funcionario
SET dt_demissao = '2023-10-12'
WHERE departamento = 'Administrativo'
ORDER BY RAND()
LIMIT 2;


-- Demissões no departamento de Recursos Humanos
UPDATE funcionario
SET dt_demissao = '2023-10-12'
WHERE departamento = 'Recursos Humanos'
AND nome IN ('Maria Silva', 'Luiz Ferreira');

-- Demissões no departamento de Vendas
UPDATE funcionario
SET dt_demissao = '2023-10-12'
WHERE departamento = 'Vendas'
AND nome IN ('José Santos', 'Sandra Alves');

-- Demissões no departamento de Produção
UPDATE funcionario
SET dt_demissao = '2023-10-12'
WHERE departamento = 'Produção'
AND nome IN ('Carlos Oliveira', 'Julio Torres');

-- Demissões no departamento Administrativo
UPDATE funcionario
SET dt_demissao = '2023-10-12'
WHERE departamento = 'Administrativo'
AND nome IN ('Ana Pereira', 'Bruno Torres');


-- Demitir funcionários no departamento de Recursos Humanos pelo ID
UPDATE funcionario
SET dt_demissao = '2023-10-12'
WHERE departamento = 'Recursos Humanos' AND id_funcionario IN (1, 6);

-- Demitir funcionários no departamento de Vendas pelo ID
UPDATE funcionario
SET dt_demissao = '2023-10-12'
WHERE departamento = 'Vendas' AND id_funcionario IN (2, 7);

-- Demitir funcionários no departamento de Produção pelo ID
UPDATE funcionario
SET dt_demissao = '2023-10-12'
WHERE departamento = 'Produção' AND id_funcionario IN (3, 7);

-- Demitir funcionários no departamento Administrativo pelo ID
UPDATE funcionario
SET dt_demissao = '2023-10-12'
WHERE departamento = 'Administrativo' AND id_funcionario IN (4, 9);
