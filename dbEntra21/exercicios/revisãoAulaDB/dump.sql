CREATE DATABASE nil_multimarcas;

use nil_multimarcas;

CREATE TABLE funcionario (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    dt_nascimento DATE,
    cargo VARCHAR(100),
    salario DECIMAL(10, 2),
    dt_admissao DATE,
    dt_demissao DATE,
    departamento VARCHAR(100)
);

INSERT INTO funcionario (nome, dt_nascimento, cargo, salario, dt_admissao, departamento) VALUES
('Maria Silva', '1990-04-15', 'Gerente de RH', 5000.00, '2015-06-01', 'Recursos Humanos'),
('José Santos', '1985-02-22', 'Vendedor Sênior', 4000.00, '2016-08-15', 'Vendas'),
('Carlos Oliveira', '1993-11-10', 'Operador de Máquina', 3000.00, '2017-03-10', 'Produção'),
('Ana Pereira', '1988-09-20', 'Assistente Administrativo', 3500.00, '2018-01-05', 'Administrativo'),
('Luiz Ferreira', '1991-07-08', 'Recrutador', 4800.00, '2015-04-02', 'Recursos Humanos'),
('Sandra Alves', '1994-06-25', 'Vendedor Júnior', 3200.00, '2017-11-20', 'Vendas'),
('Ricardo Costa', '1987-03-30', 'Supervisor de Produção', 4200.00, '2016-02-22', 'Produção'),
('Mariana Rodrigues', '1992-12-12', 'Assistente de RH', 3800.00, '2019-07-10', 'Recursos Humanos'),
('Antônio Soares', '1989-08-05', 'Vendedor Pleno', 3800.00, '2018-05-12', 'Vendas'),
('Paula Santos', '1990-01-15', 'Técnico de Manutenção', 3500.00, '2017-09-30', 'Produção'),
('Fernando Barbosa', '1996-07-19', 'Analista de RH', 4600.00, '2016-04-18', 'Recursos Humanos'),
('Isabela Gomes', '1993-04-22', 'Vendedor Sênior', 4200.00, '2019-01-05', 'Vendas'),
('Julio Torres', '1985-11-10', 'Gerente de Produção', 5500.00, '2015-11-22', 'Produção'),
('Luciana Martins', '1992-06-03', 'Assistente Administrativo', 3600.00, '2016-08-15', 'Administrativo'),
('Gustavo Oliveira', '1994-03-17', 'Recrutador', 4900.00, '2017-10-20', 'Recursos Humanos'),
('Patricia Costa', '1990-12-30', 'Vendedor Júnior', 3300.00, '2018-03-10', 'Vendas'),
('Roberto Almeida', '1988-09-10', 'Supervisor de Produção', 4400.00, '2019-04-02', 'Produção'),
('Amanda Pereira', '1995-07-25', 'Analista de RH', 4700.00, '2015-02-20', 'Recursos Humanos'),
('Lucas Souza', '1987-01-30', 'Técnico de Vendas', 3900.00, '2016-11-05', 'Vendas'),
('Camila Ferreira', '1993-03-12', 'Gerente de RH', 5200.00, '2018-10-10', 'Recursos Humanos'),
('Felipe Barbosa', '1986-11-15', 'Vendedor Pleno', 4000.00, '2017-07-30', 'Vendas'),
('Larissa Santos', '1991-08-19', 'Técnico de Produção', 3600.00, '2016-09-15', 'Produção'),
('Bruno Torres', '1995-05-02', 'Assistente Administrativo', 3500.00, '2019-05-22', 'Administrativo'),
('Roberta Silva', '1994-02-17', 'Recrutador', 4800.00, '2017-12-20', 'Recursos Humanos'),
('Guilherme Alves', '1992-10-30', 'Vendedor Sênior', 4200.00, '2018-04-10', 'Vendas'),
('Aline Oliveira', '1990-03-08', 'Supervisor de Produção', 4500.00, '2016-11-22', 'Produção'),
('Fernanda Gomes', '1996-06-25', 'Analista de RH', 4600.00, '2015-07-15', 'Recursos Humanos'),
('André Costa', '1988-12-15', 'Técnico de Manutenção', 3600.00, '2017-03-10', 'Produção');

INSERT INTO funcionario (nome, dt_nascimento, cargo, salario, dt_admissao, departamento) VALUES
('Eduardo Silva', '1992-05-15', 'Desenvolvedor', 5000.00, '2022-03-01', 'TI'),
('Mariana Santos', '1990-11-22', 'Analista de Redes', 4500.00, '2022-01-15', 'TI'),
('Rafael Oliveira', '1991-07-10', 'Gerente de TI', 5500.00, '2021-05-10', 'TI'),
('Julia Ferreira', '1993-04-05', 'Analista de Segurança', 4800.00, '2022-06-20', 'TI'),
('André Costa', '1988-12-20', 'Técnico de Suporte', 3800.00, '2022-04-10', 'TI');


/* // Tivemos que demitir 2 funcionarios de cada setor dia 12/10/2023(dia das crianças) */
UPDATE funcionario
SET dt_demissao = '2023-10-12'
WHERE id_funcionario = 4;

UPDATE funcionario
SET dt_demissao = '2023-10-12'
WHERE id_funcionario = 9;

UPDATE funcionario
SET dt_demissao = '2023-10-12'
WHERE departamento = 'Produção' AND id_funcionario IN (3, 7);

UPDATE funcionario
SET dt_demissao = '2023-10-12'
WHERE departamento = 'Vendas'
AND nome IN ('José Santos', 'Sandra Alves');

/* // no setor de RH sorteamos os demitidos */
UPDATE funcionario
SET dt_demissao = '2023-10-12'
WHERE departamento = 'Recursos Humanos'
ORDER BY RAND()
LIMIT 2;

/* a) */
select * from funcionarios;

/* b) */
SELECT * FROM funcionario WHERE departamento like "Vendas";

/* c) */
SELECT * FROM funcionario WHERE salario > 5000;

/* d) */
SELECT COUNT(*) Total_de_Funcionários FROM funcionario;

/* e) */
SELECT * FROM funcionario WHERE dt_admissao >= '2018-01-01';

/* f) */
SELECT * FROM funcionario ORDER BY salario DESC;

/* h */
SELECT AVG(salario) Média_Salarial FROM funcionario;

SELECT ROUND(AVG(salario), 2) AS Média_Salarial FROM funcionario;

/* i) */
UPDATE funcionario
SET salario = 6000
WHERE departamento LIKE 'TI';

/* j) */
insert into funcionario(id_funcionario, nome, dt_nascimento, cargo, salario, dt_admissao, departamento) VALUES
(101, "Ana Maria", "15/06/1990", "Analista de Sistemas", 4500.00, '2022-07-15', 'Recursos Humanos');

/* k) */
SELECT * FROM funcionario WHERE nome LIKE 'A%';

/* l) */
UPDATE funcionario SET salario = salario * 1.1;

/* m) */
ALTER TABLE funcionario ADD COLUMN nr_filhos INT;

/* n */
UPDATE funcionario SET nr_filhos = 3 WHERE nome LIKE 'Gustavo Oliveira';

/* o */
SELECT nome, departamento, salario
FROM funcionario
WHERE salario = (SELECT MIN(salario) FROM funcionario);

