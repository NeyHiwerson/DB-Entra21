
/* //exercicio do arquivo "sql_roteiro_aula_01" */
create TABLE Vendas (
	ID_Vendas int,
    Curso varchar(100),
    Aluno varchar(100),
    Estado varchar(100),
    Valor Decimal(10,2)
);

ALTER TABLE Vendas
ADD PRIMARY KEY(ID_Vendas);

INSERT INTO Vendas (ID_Vendas, Curso, Aluno, Estado, Valor)
VALUES
(1, 'PHP Básico', '', 'SC', 120),
(2, 'Java Básico', '', 'SC', 120),
(3, 'C# Básico', '', 'SC', 120),
(4, 'PHP Intermediario', '', 'SC', 150),
(5, 'Java Intermediario', '', 'SC', 150),
(6, 'C# Intermediario', '', 'SC', 150),
(7, 'PHP Avançado', '', 'SC', 180),
(8, 'Java Avançado', '', 'SC', 180),
(9, 'C# Avançado', '', 'SC', 180)
;

CREATE TABLE Funcionario (
	Id_Funcionario int PRIMARY KEY,
    nome varchar(120),
    endereco varchar(100),
    salario Decimal(10,2)
);

ALTER TABLE Funcionario
ADD COLUMN cidade VARCHAR(100) NOT Null AFTER endereco;

INSERT INTO Funcionario (Id_Funcionario, nome, endereco, salario)
VALUES
(1, 'João Silva', 'Rua A, 123', 3500.00),
(2, 'Maria Santos', 'Rua B, 456', 4200.00),
(3, 'Carlos Oliveira', 'Rua C, 789', 3800.00),
(4, 'Ana Pereira', 'Rua D, 321', 4100.00),
(5, 'Pedro Mendes', 'Rua E, 654', 3900.00),
(6, 'Sandra Costa', 'Rua F, 987', 3600.00),
(7, 'Ricardo Almeida', 'Rua G, 135', 4300.00),
(8, 'Fernanda Sousa', 'Rua H, 246', 3700.00),
(9, 'Miguel Fernandes', 'Rua I, 579', 4000.00),
(10, 'Lúcia Pereira', 'Rua J, 864', 3800.00),
(11, 'Gustavo Lima', 'Rua K, 159', 4200.00),
(12, 'Patrícia Ferreira', 'Rua L, 753', 3900.00),
(13, 'Luiz Oliveira', 'Rua M, 852', 4400.00),
(14, 'Aline Santos', 'Rua N, 147', 3600.00),
(15, 'Rafaela Costa', 'Rua O, 369', 4100.00),
(16, 'Fábio Mendes', 'Rua P, 654', 3800.00),
(17, 'Cristina Alves', 'Rua Q, 789', 4300.00),
(18, 'Luciano Pereira', 'Rua R, 246', 3700.00),
(19, 'Sônia Lima', 'Rua S, 753', 4000.00),
(20, 'Felipe Silva', 'Rua T, 852', 3900.00);

SELECT * FROM Funcionario;

SELECT * FROM Funcionario
WHERE salario > 4000;

SELECT nome, salario
FROM Funcionario
WHERE nome LIKE 'R%';

SELECT SUM(salario) AS 'Soma total de salarios da equipe'
FROM funcionario;

select COUNT(Id_Funcionario) AS 'quantidade de funcionarios'
FROM Funcionario;

SELECT max(salario) as 'Maior salario da compania'
FROM funcionario;

SELECT min(salario) as 'Menor salario da compania'
FROM funcionario;

UPDATE funcionario SET nome = 'xiru' WHERE Id_Funcionario = 2;

SELECT * FROM Funcionario WHERE Id_Funcionario = 2;

UPDATE funcionario SET salario = salario - (salario * 0.08) WHERE Id_Funcionario = 2;

SELECT * FROM Funcionario WHERE Id_Funcionario = 2;

UPDATE funcionario SET salario = salario + (salario * 0.15);

DELETE FROM funcionario where Id_Funcionario = 2;

CREATE table alunos(
    matricula int PRIMARY KEY,
    nome varchar(50),
    endereco varchar(100),
    bairro varchar(40),
    cidade varchar(50),
    cep varchar(9),
    estado varchar(2),
    mensalidade DECIMAL(10, 2),
    advertencia INT
);

INSERT INTO alunos (matricula, nome, endereco, bairro, cidade, cep, estado, mensalidade, advertencia)
VALUES
(1, 'Ronaldo Fenomeno', 'rua do futebol', 'guanabara', 'rio de janeiro', '12569-555', 'RJ', 350.00, 0),
(2, 'Lionel Messi', 'Avenida do Futebol', 'Barcelona', 'Barcelona', '08001', 'ES', 450.00, 0),
(3, 'Cristiano Ronaldo', 'Rua dos Gols', 'Madrid', 'Madrid', '28001', 'ES', 500.00, 2),
(4, 'Neymar Jr.', 'Rua do Drible', 'Paris', 'Paris', '75001', 'FR', 550.00, 1),
(5, 'Luka Modric', 'Avenida dos Passes', 'Madrid', 'Madrid', '28001', 'ES', 480.00, 0),
(6, 'Kylian Mbappé', 'Boulevard das Velocidades', 'Paris', 'Paris', '75001', 'FR', 520.00, 0),
(7, 'Sergio Ramos', 'Rua das Defesas', 'Madrid', 'Madrid', '28001', 'ES', 400.00, 3),
(8, 'Virgil van Dijk', 'Avenida da Segurança', 'Liverpool', 'Liverpool', 'L1 1JQ', 'UK', 480.00, 0),
(9, 'Robert Lewandowski', 'Rua dos Gols', 'Munique', 'Munique', '80333', 'DE', 490.00, 0),
(10, 'Kevin De Bruyne', 'Avenida dos Passes', 'Manchester', 'Manchester', 'M1 3GH', 'UK', 520.00, 0),
(11, 'Mohamed Salah', 'Boulevard dos Gols', 'Liverpool', 'Liverpool', 'L1 1JQ', 'UK', 480.00, 0),
(12, 'Sadio Mané', 'Avenida da Velocidade', 'Liverpool', 'Liverpool', 'L1 1JQ', 'UK', 490.00, 0),
(13, 'Paul Pogba', 'Rua das Jogadas', 'Manchester', 'Manchester', 'M1 3GH', 'UK', 510.00, 1),
(14, 'Antoine Griezmann', 'Avenida dos Gols', 'Barcelona', 'Barcelona', '08001', 'ES', 460.00, 0),
(15, 'Karim Benzema', 'Boulevard dos Dribles', 'Madrid', 'Madrid', '28001', 'ES', 490.00, 0),
(16, 'Gareth Bale', 'Rua da Velocidade', 'Cardiff', 'Cardiff', 'CF10 1EW', 'UK', 480.00, 0),
(17, 'Eden Hazard', 'Avenida da Criatividade', 'Madrid', 'Madrid', '28001', 'ES', 510.00, 0),
(18, 'Harry Kane', 'Boulevard dos Gols', 'Londres', 'Londres', 'SW1A 1AA', 'UK', 520.00, 0),
(19, 'Raheem Sterling', 'Rua da Rapidez', 'Manchester', 'Manchester', 'M1 3GH', 'UK', 500.00, 0),
(20, 'Frenkie de Jong', 'Avenida do Controle', 'Barcelona', 'Barcelona', '08001', 'ES', 470.00, 0),
(21, 'Joshua Kimmich', 'Boulevard das Assistências', 'Munique', 'Munique', '80333', 'DE', 490.00, 0),
(22, 'Toni Kroos', 'Avenida dos Passe Precisos', 'Madrid', 'Madrid', '28001', 'ES', 480.00, 0),
(23, 'Thiago Alcântara', 'Rua da Técnica', 'Liverpool', 'Liverpool', 'L1 1JQ', 'UK', 480.00, 0),
(24, 'Bruno Fernandes', 'Boulevard dos Chutes', 'Manchester', 'Manchester', 'M1 3GH', 'UK', 500.00, 0),
(25, 'Virgil van Dijk Jr.', 'Avenida da Defesa', 'Liverpool', 'Liverpool', 'L1 1JQ', 'UK', 460.00, 0),
(26, 'Erling Haaland', 'Boulevard dos Gols', 'Dortmund', 'Dortmund', '44137', 'DE', 530.00, 0),
(27, 'N Golo Kanté', 'Rua da Intercepção', 'Londres', 'Londres', 'SW1A 1AA', 'UK', 490.00, 0),
(28, 'Jadon Sancho', 'Avenida da Velocidade', 'Dortmund', 'Dortmund', '44137', 'DE', 510.00, 0),
(29, 'Kai Havertz', 'Boulevard das Assistências', 'Londres', 'Londres', 'SW1A 1AA', 'UK', 480.00, 0),
(30, 'Ansu Fati', 'Rua da Juventude', 'Barcelona', 'Barcelona', '08001', 'ES', 470.00, 0);
*/

/* 4. Crie as seguintes consultas SQLs: */
SELECT * FROM alunos

/* a) Modifique o campo estado, coloque SC para todos alunos da cidade de Joinville.​ */
UPDATE alunos SET estado = 'SC' WHERE cidade LIKE 'Joinville';

/* b) Apague todos os registros dos alunos que não são de SC.​ */
DELETE FROM alunos WHERE estado != 'SC';

/* c) 'Neymar Jr.' brigou com 'Kylian Mbappé' na escola e os dois ganharam advertência. Atualize a tabela Alunos.​ */
UPDATE alunos SET advertencia = advertencia + 1 WHERE nome LIKE 'Neymar Jr.';
UPDATE alunos SET advertencia = advertencia + 1 WHERE nome LIKE 'Kylian Mbappé';

/* d) Houve um aumento na mensalidade de todos os alunos, modifique o campo mensalidade. Dê um aumento de 8%.​ */
UPDATE alunos SET mensalidade = mensalidade * 1.08;

/* e) A partir de hoje todos os alunos que possuem mais de 2 advertências terão um aumento na mensalidade de 15 %.​ */
UPDATE alunos SET mensalidade = mensalidade * 1.15 WHERE advertencia > 2;

/* f) Todos os alunos que não possuem advertências ganharão 5 % de desconto na mensalidade.​ */
UPDATE alunos SET mensalidade = mensalidade * 0.95 WHERE advertencia = 0;

/* g) Dê um desconto de 15 % para todas as alunas que se chamam Cláudia.​ */
UPDATE alunos SET mensalidade = mensalidade * 0.85 WHERE nome LIKE 'Cláudia';

/* h) Aumente 20% a mensalidade de todos os alunos que possuem mais de 5 advertências.​ */
UPDATE alunos SET mensalidade = mensalidade * 1.20 WHERE advertencia > 5;

/* i) Altere o nome do aluno Josué Sampaio para José Sampaio, pois o nome do aluno foi cadastrado errado.​ */
UPDATE alunos SET nome = 'José Sampaio' WHERE nome LIKE 'Josué Sampaio';

/* j) Exclua o aluno José Sampaio pois o mesmo deixou a escola.​ */
DELETE FROM alunos WHERE nome LIKE 'José Sampaio';

/* l) Devido a pandemia foi necessário aumentar a mensalidade dos a​
alunos em 6%, altere a tabela.​ */
UPDATE alunos SET mensalidade = mensalidade * 1.06;
