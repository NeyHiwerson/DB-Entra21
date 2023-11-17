/* 1. CRIAR NO MYSQL
 
  Cliente    N  -----   1  UF  1 ------- N Cidade
 
#idCliente             #siglaUF         #idCidade
  nome                  nomeUF           nomeCidade
  dtNasc                                FK siglaUF
FK siglaUF
 
2. Criar as chaves: primária e estrangeiras
3. Inserir registros. (Cadastre primeiros os estados)
4. Crie e documente (dê print na consulta e no resultado) as seguintes consultas:
a) Selecione todos os nascidos no ano de 2019 em Santa Catarina.
b) Conte quantos clientes são de Santa Catarina.
c) Mostre todas as cidades de Santa Catarina que foram cadastradas.
d) Selecione todos os clientes que o nome comece com a letra "M" dos estados do Sul.
e) Altere o nome da cidade de Jlle para Joinville.
f) Selecione todas as pessoas que não são nascidos em Santa Catarina.
     Pesquise como usar o sinal de diferente no MySQL.
g) Mostre todas as cidades, ordenadas em ordem alfabética.
h) Altere a data de nascimento das  pessoas que nasceram em 29/02/2020.
     Esse é um ano bissexto. Altere para que fique: 28/02/2020.
 
Exporte o banco e envie.
Crie um documento e envie os SQL's. */


/* 1 e 2 */
CREATE table cliente(
    id_cliente int PRIMARY KEY AUTO_INCREMENT,
    nome varchar(50) NOT NULL,
    dt_nasc DATE NOT NULL     
);

CREATE table UF(
    Sigla_UF VARCHAR(2) PRIMARY KEY NOT NULL,
    nome_UF varchar(50) NOT NULL     
);

CREATE table cidade(
    id_cidade int PRIMARY KEY AUTO_INCREMENT,
    nome_cidade varchar(50) NOT NULL,
    Sigla_UF varchar(2) NOT NULL
);

alter table cidade 
add constraint Sigla_UF foreign key (Sigla_UF) 
references UF(Sigla_UF);

alter table cliente 
add column Sigla_UF VARCHAR(2);

alter table cliente 
add foreign key (Sigla_UF) 
references uf(Sigla_UF);

--------------------------------------------------
/* Todos os estados brasileiros */
INSERT INTO UF (Sigla_UF, nome_UF) VALUES
('AC', 'Acre'),
('AL', 'Alagoas'),
('AP', 'Amapá'),
('AM', 'Amazonas'),
('BA', 'Bahia'),
('CE', 'Ceará'),
('DF', 'Distrito Federal'),
('ES', 'Espírito Santo'),
('GO', 'Goiás'),
('MA', 'Maranhão'),
('MT', 'Mato Grosso'),
('MS', 'Mato Grosso do Sul'),
('MG', 'Minas Gerais'),
('PA', 'Pará'),
('PB', 'Paraíba'),
('PR', 'Paraná'),
('PE', 'Pernambuco'),
('PI', 'Piauí'),
('RJ', 'Rio de Janeiro'),
('RN', 'Rio Grande do Norte'),
('RS', 'Rio Grande do Sul'),
('RO', 'Rondônia'),
('RR', 'Roraima'),
('SC', 'Santa Catarina'),
('SP', 'São Paulo'),
('SE', 'Sergipe'),
('TO', 'Tocantins');

/* 5 maiores cidades de cada estado PR, SC, RS: */
INSERT INTO cidade (nome_cidade, Sigla_UF) VALUES
-- PR - Paraná
('Curitiba', 'PR'),
('Londrina', 'PR'),
('Maringá', 'PR'),
('Ponta Grossa', 'PR'),
('Cascavel', 'PR'),

-- SC - Santa Catarina
('Florianópolis', 'SC'),
('Joinville', 'SC'),
('Blumenau', 'SC'),
('São José', 'SC'),
('Chapecó', 'SC'),

-- RS - Rio Grande do Sul
('Porto Alegre', 'RS'),
('Caxias do Sul', 'RS'),
('Pelotas', 'RS'),
('Canoas', 'RS'),
('Santa Maria', 'RS');

-- Inserindo 25 registros de clientes nascidos em SC
INSERT INTO cliente (nome, dt_nasc, Sigla_UF) VALUES
('João Silva', '1990-01-15', 'SC'),
('João Souza', '2019-01-15', 'SC'),
('Maria Oliveira', '1985-03-22', 'SC'),
('Carlos Santos', '1988-07-10', 'SC'),
('Ana Pereira', '2020-02-29', 'SC'),
('Rodrigo Souza', '1983-09-18', 'SC'),
('Luciana Costa', '1995-02-28', 'SC'),
('Eduardo Lima', '1987-06-14', 'SC'),
('Camila Rocha', '2023-02-29', 'SC'),
('Felipe Almeida', '1984-04-25', 'SC'),
('Amanda Cardoso', '1993-08-20', 'SC'),
('Gustavo Oliveira', '1989-10-07', 'SC'),
('Isabela Santos', '2020-02-29', 'SC'),
('Ricardo Pereira', '1986-03-12', 'SC'),
('Juliana Souza', '1990-09-05', 'SC'),
('Marcos Costa', '1982-12-18', 'SC'),
('Fernanda Lima', '1997-04-08', 'SC'),
('José Rocha', '1981-01-22', 'SC'),
('Patrícia Almeida', '1996-07-15', 'SC'),
('Paulo Cardoso', '1988-11-28', 'SC'),
('Renata Oliveira', '1992-02-10', 'SC'),
('Thiago Santos', '1983-05-04', 'SC'),
('Vanessa Souza', '1994-08-17', 'SC'),
('Daniel Costa', '1985-10-29', 'SC'),
('Mariana Lima', '1999-03-01', 'SC');

-- Inserindo 15 registros de clientes que não nasceram em SC
INSERT INTO cliente (nome, dt_nasc, Sigla_UF) VALUES
('Fernando Silva', '1990-01-15', 'RS'),
('Carla Oliveira', '1985-03-22', 'PR'),
('Rafael Santos', '1988-07-10', 'RS'),
('Sandra Pereira', '1992-12-05', 'PR'),
('Márcio Souza', '2020-02-29', 'RS'),
('Luiza Costa', '1995-02-28', 'PR'),
('José Lima', '1987-06-14', 'RS'),
('Aline Rocha', '1991-11-03', 'PR'),
('Mateus Almeida', '1984-04-25', 'RS'),
('Beatriz Cardoso', '1993-08-20', 'PR'),
('Vinícius Oliveira', '1989-10-07', 'RS'),
('Bianca Santos', '1994-06-30', 'PR'),
('Diego Pereira', '1986-03-12', 'RS'),
('Tatiane Souza', '1990-09-05', 'PR'),
('Carlos Costa', '1982-12-18', 'RS');

-------------------------------------------------------
--4) 
--a) Selecione todos os nascidos no ano de 2019 em Santa Catarina.
SELECT * FROM cliente WHERE YEAR(dt_nasc) = 2019 AND Sigla_UF = 'SC';

--b) Conte quantos clientes são de Santa Catarina.
SELECT COUNT(*) FROM cliente WHERE Sigla_UF = 'SC';

--c) Mostre todas as cidades de Santa Catarina que foram cadastradas.
SELECT * FROM cidade WHERE Sigla_UF = 'SC';

--d) Selecione todos os clientes que o nome comece com a letra "M" dos estados do Sul.
SELECT * FROM cliente
WHERE cliente.Sigla_UF IN('RS', 'SC', 'PR')
AND cliente.nome like 'M%';

--e) Altere o nome da cidade de Jlle para Joinville.
UPDATE cidade SET nome_cidade = 'Joinville' WHERE nome_cidade LIKE 'Jlle';

--f) Selecione todas as pessoas que não são nascidos em Santa Catarina.
--    Pesquise como usar o sinal de diferente no MySQL.
SELECT * from cliente
WHERE cliente.Sigla_UF != 'SC';

--g) Mostre todas as cidades, ordenadas em ordem alfabética.
SELECT * FROM cidade 
ORDER BY nome_cidade ASC;

--h) Altere a data de nascimento das  pessoas que nasceram em 29/02/2023.
     --Esse não é um ano bissexto. Altere para que fique: 28/02/2023.
UPDATE cliente 
SET dt_nasc = '2020-02-28' 
WHERE dt_nasc = '2020-02-29';