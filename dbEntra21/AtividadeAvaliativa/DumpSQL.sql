/*
Uma imobiliária com especialidade em aluguéis deseja desenvolver uma aplicação para controle do recebimento e repasse dos aluguéis a seus clientes. Esta empresa cadastra todos os seus clientes e os inquilinos destes. Ela necessita guardar informações dos imóveis sob sua responsabilidade e dos contratos de aluguel por ela efetuados.
Para facilidade de controle nos pagamentos dos aluguéis, estes serão feitos via sistema de cobrança bancária. O banco credenciado, após a cobrança, irá depositar automaticamente na conta da imobiliária o valor de 5% relativo à comissão de seus serviços e o restante, na conta do proprietário do imóvel, em conta/banco/agência indicada por ele. O sistema mensalmente repassará ao banco de cobrança informações para tal.
Os contratos podem ser cancelados a qualquer instante, dentro da legislação vigente. Quinzenalmente o sistema deverá emitir uma relação dos inquilinos em atraso.
*/
/* observaçoes no PDF de modelagem ImobiliariaSorriso.pdf */
/* *1)  cliente.cliente_tipo:
                    proprietario
                    proprietario-inquilino
                    inquilino
*/

/* *2)  cliente_endereco.endereco_tipo
                            residencial
                            comercial
*/


/* *3)  imovel_tipo.tipo_de_imovel:
                casa
                apartamento
                terreno
                loja
                galpao
*/

/* *4)  imovel.imovel_status:
                disponivel
                indisponivel
 */

drop database imobiliariaSorriso;
create database imobiliariaSorriso;
use imobiliariaSorriso;

/*t1 - tabela estado */
CREATE TABLE estado (
  id_estado INT PRIMARY KEY AUTO_INCREMENT,
  nome_estado VARCHAR(50) NOT NULL,
  sigla_estado CHAR(2) NOT NULL
);

/*t2 - tabela cidade */
CREATE TABLE cidade (
  id_cidade INT PRIMARY KEY AUTO_INCREMENT,
  nome_cidade VARCHAR(50) NOT NULL,
  id_estado INT NOT NULL,
  FOREIGN KEY (id_estado) REFERENCES estado (id_estado)
);

/*t3 - tabela endereco */
CREATE TABLE endereco (
  id_endereco INT PRIMARY KEY AUTO_INCREMENT,
  rua VARCHAR(100) NOT NULL,
  numero VARCHAR(20) NOT NULL,
  complemento VARCHAR(50),
  bairro VARCHAR(50),
  id_cidade INT NOT NULL,
  cep VARCHAR(8) NOT NULL,
  FOREIGN KEY (id_cidade) REFERENCES cidade (id_cidade)
);

/*t4 - conta_banco */
CREATE TABLE conta_banco (
  id_conta_banco INT PRIMARY KEY AUTO_INCREMENT,
  banco_numero int NOT NULL,
  banco_nome VARCHAR(30) NOT NULL,
  banco_agencia int NOT NULL,
  numero_conta int NOT NULL,
  cpf_cnpj VARCHAR(14) NOT NULL,
  chave_pix_conta VARCHAR(320)
);

/*t5 - cliente */
CREATE TABLE cliente (
  id_cliente INT PRIMARY KEY AUTO_INCREMENT,
  cliente_tipo VARCHAR(30) NOT NULL,
  nome VARCHAR(50) NOT NULL,
  dt_nasc DATE NOT NULL,
  cliente_cpf VARCHAR(14) NOT NULL,
  cadastro_positivo boolean NOT NULL,
  cliente_renda INT NOT NULL,
  id_conta_banco INT NOT NULL,
  FOREIGN KEY (id_conta_banco) REFERENCES conta_banco (id_conta_banco)
);

/*t6 - cliente_endereco */
CREATE TABLE cliente_endereco (
  id_cliente_endereco INT PRIMARY KEY AUTO_INCREMENT,
  endereco_tipo VARCHAR(30) NOT NULL,
  id_cliente INT NOT NULL,
  id_endereco INT NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
  FOREIGN KEY (id_endereco) REFERENCES endereco (id_endereco)
);

/* t7 - imovel_tipo */
CREATE TABLE imovel_tipo (
  id_imovel_tipo INT PRIMARY KEY AUTO_INCREMENT,
  tipo_de_imovel VARCHAR(30) NOT NULL
);

/*t8 - imovel */
CREATE TABLE imovel (
  id_imovel INT PRIMARY KEY AUTO_INCREMENT,
  inscricao_estadual VARCHAR(20) NOT NULL,
  id_imovel_tipo INT NOT NULL,
  id_endereco INT NOT NULL,
  imovel_status VARCHAR(20) NOT NULL,
  metragem INT NOT NULL,
  valor_aluguel INT NOT NULL,
  FOREIGN KEY (id_imovel_tipo) REFERENCES imovel_tipo (id_imovel_tipo),
  FOREIGN KEY (id_endereco) REFERENCES endereco (id_endereco)
);

/*t9 - imobiliaria_sorriso */
CREATE TABLE imobiliaria_sorriso (
  id_imobiliaria INT PRIMARY KEY AUTO_INCREMENT,
  nome_imobiliaria VARCHAR(30) NOT NULL,
  cnpj VARCHAR(14) NOT NULL,
  id_endereco INT NOT NULL,
  id_conta_banco INT NOT NULL,
  FOREIGN KEY (id_endereco) REFERENCES endereco (id_endereco),
  FOREIGN KEY (id_conta_banco) REFERENCES conta_banco(id_conta_banco)
);

/*t10 - contrato_locacao */
  CREATE TABLE contrato_locacao (
  id_contrato_locacao INT PRIMARY KEY AUTO_INCREMENT,
  id_imobiliaria INT NOT NULL,
  id_imovel INT NOT NULL,
  id_cliente_proprietario INT NOT NULL,
  id_cliente_inquilino INT NOT NULL,
  data_inicio_contrato DATE NOT NULL,
  data_fim_contrato DATE NOT NULL,
  dia_vencimento_aluguel INT,
  FOREIGN KEY (id_imobiliaria) REFERENCES imobiliaria_sorriso (id_imobiliaria),
  FOREIGN KEY (id_imovel) REFERENCES imovel (id_imovel),
  FOREIGN KEY (id_cliente_proprietario) REFERENCES cliente (id_cliente),
  FOREIGN KEY (id_cliente_inquilino) REFERENCES cliente (id_cliente)
);

/* t11 - boletos_contrato_locacao */
  CREATE TABLE boletos_contrato_locacao (
  id_boleto INT PRIMARY KEY AUTO_INCREMENT,
  id_contrato_locacao INT NOT NULL,
  id_cliente_inquilino INT NOT NULL,
  data_vencimento DATE NOT NULL,
  valor_boleto INT NOT NULL,
  status_pagamento BOOLEAN NOT NULL DEFAULT false,
  FOREIGN KEY (id_contrato_locacao) REFERENCES contrato_locacao (id_contrato_locacao),
  FOREIGN KEY (id_cliente_inquilino) REFERENCES cliente (id_cliente)
);

/* registros t1 estado */
INSERT INTO estado (nome_estado, sigla_estado) VALUES
('Acre', 'AC'),
('Alagoas', 'AL'),
('Amapá', 'AP'),
('Amazonas', 'AM'),
('Bahia', 'BA'),
('Ceará', 'CE'),
('Distrito Federal', 'DF'),
('Espírito Santo', 'ES'),
('Goiás', 'GO'),
('Maranhão', 'MA'),
('Mato Grosso', 'MT'),
('Mato Grosso do Sul', 'MS'),
('Minas Gerais', 'MG'),
('Pará', 'PA'),
('Paraíba', 'PB'),
('Paraná', 'PR'),
('Pernambuco', 'PE'),
('Piauí', 'PI'),
('Rio de Janeiro', 'RJ'),
('Rio Grande do Norte', 'RN'),
('Rio Grande do Sul', 'RS'),
('Rondônia', 'RO'),
('Roraima', 'RR'),
('Santa Catarina', 'SC'),
('São Paulo', 'SP'),
('Sergipe', 'SE'),
('Tocantins', 'TO');

/* registros t2 cidade */
/* certifique-se que o id dos estados seja igual ao id do estado no cadastro de cidade */
INSERT INTO cidade (nome_cidade, id_estado) VALUES
-- Paraná
('Curitiba', 16),
('Londrina', 16),
('Maringá', 16),
('Ponta Grossa', 16),
('Cascavel', 16),
('São José dos Pinhais', 16),
('Foz do Iguaçu', 16),
('Colombo', 16),
('Guarapuava', 16),
('Paranaguá', 16),
-- Santa Catarina
('Joinville', 24),
('Florianópolis', 24),
('Blumenau', 24),
('São José', 24),
('Criciúma', 24),
('Chapecó', 24),
('Itajaí', 24),
('Jaraguá do Sul', 24),
('Palhoça', 24),
('Lages', 24),
-- Rio Grande do Sul
('Porto Alegre', 21),
('Caxias do Sul', 21),
('Pelotas', 21),
('Canoas', 21),
('Santa Maria', 21),
('Gravataí', 21),
('Novo Hamburgo', 21),
('Viamão', 21),
('São Leopoldo', 21),
('Rio Grande', 21);

/* registros t3 endereco */
INSERT INTO endereco (rua, numero, complemento, bairro, id_cidade, cep) VALUES
('Rua Vidal Ramos', '123', 'Casa fundos', 'guanabara', 1, '89207670'),
('Rua Guanabara', '1500', 'proximo ao bar bero', 'guanabara', 1, '89207670'),
('Avenida atlântica', '355', 'edificio everest', 'breja', 1, '89300000'),
('Rua do gaudencio', '16', 'anexo a loterica', 'birolo', 1, '65208660'),
('Rua Capão Bonito', '123', 'germinado 03', 'Fátima', 1, '89207670'),
('Rua das Flores', '101', 'Casa 1', 'Centro', 1, '12345678'),
('Avenida dos Pássaros', '202', 'Apto 302', 'Jardim', 1, '23456789'),
('Travessa das Árvores', '303', 'Casa 2', 'Bela Vista', 1, '34567890'),
('Rua das Pedras', '404', 'Loja 3', 'Vila Nova', 1, '45678901'),
('Avenida das Estrelas', '505', 'Sala 203', 'Flores', 1, '56789012'),
('Rua do Sol', '606', 'Casa 3', 'Centro', 1, '67890123'),
('Avenida da Lua', '707', 'Apto 403', 'Jardim', 10, '78901234'),
('Travessa do Mar', '808', 'Loja 4', 'Bela Vista', 10, '89012345'),
('Rua do Céu', '909', 'Casa 4', 'Vila Nova', 10, '90123456'),
('Avenida dos Oceanos', '1001', 'Sala 303', 'Flores', 10, '10987654'),
('Rua das Montanhas', '1111', 'Casa 5', 'Centro', 10, '21098765'),
('Avenida dos Rios', '1221', 'Apto 504', 'Jardim', 10, '32109876'),
('Travessa dos Lagos', '1331', 'Loja 5', 'Bela Vista', 11, '43210987'),
('Rua das Dunas', '1441', 'Casa 6', 'Vila Nova', 11, '54321098'),
('Avenida das Cavernas', '1551', 'Sala 403', 'Flores', 11, '65432109'),
('Travessa das Grutas', '1661', 'Casa 7', 'Centro', 11, '76543210'),
('Rua das Praias', '1771', 'Apto 605', 'Jardim', 11, '87654321'),
('Avenida dos Vulcões', '1881', 'Loja 6', 'Bela Vista', 11, '98765432'),
('Travessa dos Desfiladeiros', '1991', 'Casa 8', 'Vila Nova', 11, '87654321'),
('Rua das Geleiras', '2002', 'Sala 503', 'Flores', 11, '76543210'),
('Avenida dos Desertos', '2112', 'Casa 9', 'Centro', 11, '65432109'),
('Travessa dos Cânions', '2222', 'Apto 706', 'Jardim', 11, '54321098'),
('Rua das Selvas', '2332', 'Loja 7', 'Bela Vista', 11, '43210987'),
('Avenida das Planícies', '2442', 'Casa 10', 'Vila Nova', 12, '32109876'),
('Travessa das Ilhas', '2552', 'Sala 603', 'Flores', 12, '21098765'),
('Rua dos Vales', '2662', 'Casa 11', 'Centro', 12, '10987654'),
('Avenida dos Campos', '2772', 'Apto 807', 'Jardim', 12, '98765432'),
('Travessa dos Bosques', '2882', 'Loja 8', 'Bela Vista', 12, '87654321'),
('Rua das Colinas', '2992', 'Casa 12', 'Vila Nova', 21, '76543210'),
('Avenida das Falésias', '3003', 'Sala 703', 'Flores', 21, '65432109'),
('Travessa dos Penhascos', '3113', 'Casa 13', 'Centro', 21, '54321098'),
('Rua dos Abismos', '3223', 'Apto 908', 'Jardim', 21, '43210987'),
('Avenida das Lagoas', '3333', 'Loja 9', 'Bela Vista', 21, '32109876'),
('Travessa das Nascentes', '3443', 'Casa 14', 'Vila Nova', 21, '21098765'),
('Rua das Cascatas', '3553', 'Sala 803', 'Flores', 21, '10987654'),
('Avenida das Correntezas', '3663', 'Casa 15', 'Centro', 21, '87654321'),
('Travessa das Cachoeiras', '3773', 'Apto 1009', 'Jardim', 21, '76543210'),
('Rua das Quedas', '3883', 'Loja 10', 'Bela Vista', 21, '65432109'),
('Avenida das Torrentes', '3993', 'Casa 16', 'Vila Nova', 21, '54321098'),
('Travessa das Enseadas', '4004', 'Sala 903', 'Flores', 23, '43210987'),
('Rua das Marés', '4114', 'Casa 17', 'Centro', 23, '32109876'),
('Avenida das Ondas', '4224', 'Apto 1101', 'Jardim', 23, '21098765'),
('Travessa dos Mares', '4334', 'Loja 11', 'Bela Vista', 23, '10987654');

/* registros t4 conta_banco */
INSERT INTO conta_banco (banco_numero, banco_nome, banco_agencia, numero_conta, cpf_cnpj, chave_pix_conta)
VALUES
(101, 'Banco do Brasil', 4567, 987654, '12345670001331', 'chave_pix_imob_1'),
(101, 'Banco do Brasil', 7890, 543210, '98765430002', 'chave_pix2'),
(107, 'Banco Itau', 1234, 678901, '11122230003332', 'chave_pix_imob_2'),
(266, 'Banco inter', 1, 123456, '44455560004333', 'chave_pix_imob_3'),
(101, 'Banco do Brasil', 4567, 654321, '88899900005', 'chave_pix5'),
(107, 'Banco Itau', 1234, 789012, '22233340006', 'chave_pix6'),
(266, 'Banco inter', 1, 210987, '55566670007', 'chave_pix7'),
(244, 'Banco Nubank', 1, 345678, '99900010008', 'chave_pix8'),
(266, 'Banco inter', 1, 876543, '33344450009', 'chave_pix9'),
(244, 'Banco Nubank', 1, 234567, '66677780010', 'chave_pix10'),
(101, 'Banco do Brasil', 4567, 876543, '11122230011', 'chave_pix11'),
(107, 'Banco Itau', 1234, 987654, '44455560012', 'chave_pix12'),
(266, 'Banco inter', 1, 234567, '55566670013', 'chave_pix13'),
(244, 'Banco Nubank', 1, 765432, '99900010014', 'chave_pix14'),
(101, 'Banco do Brasil', 4567, 123456, '12345670015', 'chave_pix15'),
(107, 'Banco Itau', 1234, 543210, '98765430016', 'chave_pix16'),
(266, 'Banco inter', 1, 456789, '11122230017', 'chave_pix17'),
(244, 'Banco Nubank', 1, 567890, '44455560018', 'chave_pix18'),
(266, 'Banco inter', 1, 678901, '88899900019', 'chave_pix19'),
(244, 'Banco Nubank', 1, 789012, '22233340020', 'chave_pix20'),
(101, 'Banco do Brasil', 7890, 890123, '55566670021', 'chave_pix21'),
(107, 'Banco Itau', 4321, 901234, '99900010022', 'chave_pix22'),
(266, 'Banco inter', 1, 345678, '33344450023', 'chave_pix23'),
(244, 'Banco Nubank', 1, 456789, '66677780024', 'chave_pix24'),
(101, 'Banco do Brasil', 7890, 567890, '12345670025', 'chave_pix25'),
(107, 'Banco Itau', 4321, 678901, '98765430026', 'chave_pix26'),
(266, 'Banco inter', 1, 789012, '11122230027', 'chave_pix27'),
(244, 'Banco Nubank', 1, 890123, '44455560028', 'chave_pix28'),
(266, 'Banco inter', 1, 901234, '88899900029', 'chave_pix29'),
(244, 'Banco Nubank', 1, 345678, '22233340030', 'chave_pix30'),
(101, 'Banco do Brasil', 7890, 678901, '55566670031', 'chave_pix31'),
(107, 'Banco Itau', 4321, 890123, '99900010032', 'chave_pix32'),
(266, 'Banco inter', 1, 987654, '33344450033', 'chave_pix33');


/* registros t5 cliente */
INSERT INTO cliente (cliente_tipo, nome, dt_nasc, cliente_cpf, cadastro_positivo, cliente_renda, id_conta_banco) VALUES
('Proprietário', 'João Guilherme Santos', '1980-01-10', '98765430002', true, 8000, 1),
('Proprietário-Inquilino', 'Maria Pereira Barroca', '1985-05-20', '88899900005', true, 7000, 2),
('Inquilino', 'Carlos Garibaldi', '1990-08-15', '22233340006', true, 6000, 3),
('Proprietário', 'Ana Vasques', '1975-03-25', '55566670007', true, 9000, 4),
('Inquilino', 'Pedro Isidoro', '1988-12-02', '99900010008', true, 5500, 5),
('Proprietário-Inquilino', 'Fernanda Jacomina', '1992-06-18', '33344450009', true, 7500, 6),
('Inquilino', 'Lucas Paquetá', '1987-11-10', '66677780010', true, 6500, 7),
('Proprietário', 'Camila Miranda', '1983-04-08', '11122230011', true, 8500, 8),
('Proprietário-Inquilino', 'Gabriel Genézio', '1995-09-14', '44455560012', true, 6200, 9),
('Inquilino', 'Mariana Salvadora', '1982-02-28', '55566670013', true, 7000, 10),
('Proprietário', 'José Silva', '1978-07-12', '99900010014', true, 8200, 11),
('Proprietário-Inquilino', 'Amanda Stil', '1989-10-05', '12345670015', true, 6800, 12),
('Inquilino', 'Rafael Razende', '1993-03-22', '98765430016', true, 7200, 13),
('Proprietário', 'Larissa Manuela', '1976-08-30', '11122230017', true, 8800, 14),
('Inquilino', 'Gustavo Borges', '1984-01-17', '44455560018', true, 5900, 15),
('Proprietário-Inquilino', 'Isabela Nardone', '1991-04-09', '88899900019', true, 7100, 16),
('Proprietário', 'Daniel Da Mangabeira', '1986-11-28', '22233340020', true, 8300, 17),
('Inquilino', 'Juliana Mastroiane', '1981-06-15', '55566670021', true, 6300, 18),
('Proprietário-Inquilino', 'Thiago Neves', '1994-09-03', '99900010022', true, 6900, 19),
('Inquilino', 'Natália Nozotraz', '1980-02-20', '33344450023', true, 6800, 20),
('Proprietário', 'Eduardo Sampaio', '1979-07-27', '66677780024', true, 9000, 21),
('Proprietário-Inquilino', 'Carolina Rickman', '1997-12-14', '12345670025', true, 6200, 22),
('Inquilino', 'Marcos Moranga', '1988-05-01', '98765430026', true, 7400, 23),
('Proprietário', 'Laura Pauzini', '1977-10-08', '11122230027', true, 8600, 24),
('Inquilino', 'Renato Cariani', '1983-03-25', '44455560028', true, 5900, 25),
('Proprietário-Inquilino', 'Vanessa da Mata', '1992-08-12', '88899900029', true, 7200, 26),
('Inquilino', 'Roberto Jeferson', '1985-01-29', '22233340030', true, 6500, 27),
('Proprietário', 'Beatriz Xavier', '1974-06-18', '55566670031', true, 8800, 28),
('Proprietário-Inquilino', 'Fábio Assunção', '1996-11-05', '99900010032', true, 6700, 29),
('Inquilino', 'Cristina Aguilera', '1984-04-22', '33344450033', true, 7100, 30);

/*t6 - cliente_endereco *2 residencial ou comercial*/
INSERT INTO cliente_endereco (endereco_tipo, id_cliente, id_endereco) VALUES
('Residencial', 1, 1),
('Comercial', 2, 2),
('Residencial', 3, 3),
('Comercial', 4, 4),
('Residencial', 5, 5),
('Comercial', 6, 6),
('Residencial', 7, 7),
('Comercial', 8, 8),
('Residencial', 9, 9),
('Comercial', 10, 10),
('Residencial', 11, 12),
('Comercial', 12, 13),
('Residencial', 13, 14),
('Comercial', 14, 15),
('Residencial', 15, 16),
('Comercial', 16, 17),
('Residencial', 17, 18),
('Comercial', 18, 19),
('Residencial', 19, 20),
('Comercial', 20, 21),
('Residencial', 21, 29),
('Comercial', 22, 30),
('Residencial', 23, 31),
('Comercial', 24, 32),
('Residencial', 25, 33),
('Comercial', 26, 34),
('Residencial', 27, 35),
('Comercial', 28, 36),
('Residencial', 29, 37),
('Comercial', 30, 38);

/* t7 imovel_tipo */
INSERT INTO imovel_tipo (tipo_de_imovel) VALUES
('casa'),
('apartamento'),
('terreno'),
('loja'),
('galpao');

/* t8 imovel */
 INSERT INTO imovel (inscricao_estadual, id_imovel_tipo, id_endereco, imovel_status, metragem, valor_aluguel ) VALUES
 ('12315', 1, 1, 'Ocupado', 360, 1000),
 ('12320', 2, 2, 'Ocupado', 70, 1500),
 ('12450', 3, 4, 'Ocupado', 240, 2000),
 ('12685', 4, 3, 'Ocupado', 100, 2500),
 ('12995', 5, 5, 'Ocupado', 2000, 3000),
 ('12687', 1, 6, 'Ocupado', 360, 1000),
 ('12952', 2, 7, 'Dísponivel', 70, 1500),
 ('12447', 4, 8, 'Dísponivel', 240, 2000),
 ('33111', 4, 29, 'Ocupado', 100, 2500),
 ('33116', 5, 30, 'Ocupado', 2000, 3000),
 ('33559', 1, 31, 'Ocupado', 360, 1000),
 ('33666', 2, 32, 'Ocupado', 70, 1500),
 ('33474', 3, 33, 'Dísponivel', 240, 2000),
 ('33888', 4, 28, 'Dísponivel', 100, 2500),
 ('99658', 5, 36, 'Ocupado', 2000, 3000),
 ('99663', 1, 37, 'Ocupado', 360, 1000),
 ('99335', 2, 34, 'Ocupado', 70, 1500),
 ('99665', 3, 38, 'Ocupado', 240, 2000),
 ('99001', 4, 35, 'Ocupado', 100, 2500),
 ('99633', 5, 40, 'Dísponivel', 2000, 3000);

/* t9 imobiliaria_sorriso */
 INSERT INTO imobiliaria_sorriso (nome_imobiliaria, cnpj, id_endereco, id_conta_banco) VALUES
 ('Imobiliaria Sorriso', '12345670001331', 11, 1),
 ('Imobiliaria Sorriso', '11122230003332', 28, 3),
 ('Imobiliaria Sorriso', '44455560004333', 44, 4);

/* t10 contrato_locacao */
 INSERT INTO contrato_locacao (id_imobiliaria, id_imovel, id_cliente_proprietario, id_cliente_inquilino, data_inicio_contrato, data_fim_contrato, dia_vencimento_aluguel) VALUES
 (1, 7, 1, 10, '2024-07-01', '2025-12-31', 10);
UPDATE imovel SET imovel_status = 'Ocupado' where id_imovel = 7;

/* t11 boletos_contrato_locacao */
 INSERT INTO boletos_contrato_locacao
  (id_contrato_locacao, id_cliente_inquilino, data_vencimento, valor_boleto) VALUES
 (1, 10, '2024-08-10', 1000),
 (1, 10, '2024-09-10', 1000),
 (1, 10, '2024-10-10', 1000),
 (1, 10, '2024-11-10', 1000),
 (1, 10, '2024-12-10', 1000),
 (1, 10, '2025-01-10', 1000),
 (1, 10, '2025-02-10', 1000),
 (1, 10, '2025-03-10', 1000),
 (1, 10, '2025-04-10', 1000),
 (1, 10, '2025-05-10', 1000),
 (1, 10, '2025-06-10', 1000),
 (1, 10, '2025-07-10', 1000),
 (1, 10, '2025-08-10', 1000),
 (1, 10, '2025-09-10', 1000),
 (1, 10, '2025-10-10', 1000),
 (1, 10, '2025-11-10', 1000),
 (1, 10, '2025-12-10', 1000)
 ;

/* Fazer 20 query's */
/* 1 - Listar todos os imóveis */
SELECT * FROM imovel;

/* 2 - Listar todos os imóveis com valor aluguel maior que R$1000 */
SELECT * FROM imovel WHERE valor_aluguel > 1000;

/* 3 - Listar todos os imóveis com valor aluguel entre R$800 e R$1200 */
SELECT * FROM imovel WHERE valor_aluguel BETWEEN 800 AND 1200;

/* 4 - Listar todos os imoveis disponiveis desocupados em Joinville(id=11) */
SELECT id_cidade FROM cidade
WHERE nome_cidade LIKE 'Join%';

SELECT *
FROM imovel
WHERE id_endereco IN (
  SELECT id_endereco
  FROM endereco
  WHERE id_cidade =
    (SELECT id_cidade FROM cidade
    WHERE nome_cidade LIKE 'Join%'));

SELECT imovel.*
FROM imovel
JOIN endereco ON imovel.id_endereco = endereco.id_endereco
JOIN cidade ON endereco.id_cidade = cidade.id_cidade
WHERE cidade.nome_cidade LIKE 'Join%';

SELECT imo.*, en.*, cid.* FROM imovel imo
JOIN endereco en ON imo.id_endereco = en.id_endereco
JOIN cidade cid ON en.id_cidade = cid.id_cidade
WHERE cid.nome_cidade LIKE 'Join%' AND imo.imovel_status = 'Dísponivel';

/* 5 Listar todos os clientes */
SELECT * FROM cliente

/* 6 Listar todos os clientes que moram em Joinville(id=11) */
SELECT * FROM cliente
WHERE id_cliente IN (
  SELECT id_cliente
  FROM cliente_endereco
  WHERE id_endereco IN
    (SELECT id_endereco
     FROM endereco
     WHERE id_cidade IN
     	(SELECT id_cidade
         FROM cidade
         WHERE nome_cidade LIKE 'Join%')));

/* 7 qual a media de renda dos clientes */
 SELECT AVG(cliente_renda) FROM cliente;

/* 8 Listar todos os imóveis com valor aluguel maior que 30% da media de renda dos clientes */
SELECT * FROM imovel
WHERE valor_aluguel > (SELECT AVG(cliente_renda)*0.3 FROM cliente);


/* 9 Listar todos os imóveis com valor aluguel maior que 30% da media de renda dos clientes e que estão disponiveis */
SELECT * FROM imovel
WHERE valor_aluguel > (SELECT AVG(cliente_renda)*0.3 FROM cliente)
AND imovel_status = 'Dísponivel';

/* 10 Listar todas as filiais da imobiliaria Sorriso com seus endereços */
 SELECT imo.id_imobiliaria, imo.nome_imobiliaria, imo.cnpj,
  en.rua, en.numero, en.bairro, en.cep,
  cid.nome_cidade,
  es.nome_estado
  FROM imobiliaria_sorriso imo
  JOIN endereco en ON imo.id_endereco = en.id_endereco
  JOIN cidade cid ON en.id_cidade = cid.id_cidade
  JOIN estado es ON cid.id_estado = es.id_estado;

/* 11 Listar os dados bancarios da imobiliaria para enviar para um cliente */
 SELECT imo.id_imobiliaria, imo.nome_imobiliaria, imo.cnpj,
  cb.banco_nome, cb.banco_agencia, cb.numero_conta, cb.chave_pix_conta
  FROM imobiliaria_sorriso imo
  JOIN conta_banco cb ON imo.cnpj = cb.cpf_cnpj;

/* 12 Listar todos os contratos de locação em vigencia */
SELECT * FROM contrato_locacao
WHERE data_fim_contrato > NOW();

/* 13 Listar todos os boletos vencidos */
 SELECT * FROM boletos_contrato_locacao
 WHERE data_vencimento < NOW();

/* 14 Listar os dados de um boleto bem preenchido */
SELECT bcl.id_boleto 'Codigo Boleto', bcl.id_contrato_locacao Contrato,
  bcl.data_vencimento Vencimento, bcl.valor_boleto Valor,
  cli.nome Cliente, cli.cliente_cpf CPF,
  imo.nome_imobiliaria Imobiliaria, imo.cnpj CNPJ,
  cb.banco_nome Banco, cb.banco_agencia Agencia, cb.numero_conta Conta, cb.chave_pix_conta Pix
  FROM boletos_contrato_locacao bcl
  JOIN contrato_locacao cl ON bcl.id_contrato_locacao = cl.id_contrato_locacao
  JOIN cliente cli ON cl.id_cliente_inquilino = cli.id_cliente
  JOIN imobiliaria_sorriso imo ON cl.id_imobiliaria = imo.id_imobiliaria
  JOIN conta_banco cb ON imo.cnpj = cb.cpf_cnpj
  WHERE bcl.id_boleto = 1;
