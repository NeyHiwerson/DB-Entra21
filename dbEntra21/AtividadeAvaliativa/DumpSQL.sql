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
  cpf/cnpj int NOT NULL,
  chave_pix_conta VARCHAR(320)
);

/*t5 - cliente */
CREATE TABLE cliente (
  id_cliente INT PRIMARY KEY AUTO_INCREMENT,
  cliente_tipo VARCHAR(30) NOT NULL,
  nome VARCHAR(50) NOT NULL,
  dt_nasc DATE NOT NULL,
  cliente_cpf VARCHAR(11) NOT NULL,
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
  dia_vencimento_aluguel DATE NOT NULL,
  FOREIGN KEY (id_imobiliaria) REFERENCES imobiliaria_sorriso (id_imobiliaria),
  FOREIGN KEY (id_imovel) REFERENCES imovel (id_imovel),
  FOREIGN KEY (id_cliente_proprietario) REFERENCES cliente (id_cliente),
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
('Porto Alegre', 23),
('Caxias do Sul', 23),
('Pelotas', 23),
('Canoas', 23),
('Santa Maria', 23),
('Gravataí', 23),
('Novo Hamburgo', 23),
('Viamão', 23),
('São Leopoldo', 23),
('Rio Grande', 23);


/* registros t3 endereco */
INSERT INTO endereco (rua, numero, complemento, bairro, id_cidade, cep) VALUES
('Rua Vidal Ramos', '123', 'Casa fundos', 'guanabara', 11, '89207670'),
('Rua Guanabara', '1500', 'proximo ao bar bero', 'guanabara', 11, '89207670'),
('Avenida atlântica', '355', 'edificio everest', 'breja', 10, '89300000'),
('Rua do gaudencio', '16', 'anexo a loterica', 'birolo', 22, '65208660'),
('Rua Capão Bonito', '123', 'germinado 03', 'Fátima', 11, '89207670');


/* registro t4 conta_banco */
INSERT INTO conta_banco (banco_numero, banco_nome, banco_agencia, numero_conta, cpf_cnpj, chave_pix_conta)
VALUES
  (101, 'Banco do Brasil', 4567, 987654, 12345678901, 'chave_pix1'),
  (101, 'Banco do Brasil', 7890, 543210, 98765432109, 'chave_pix2'),
  (107, 'Banco Itau', 1234, 678901, 11122233344, 'chave_pix3'),
  (266, 'Banco inter', 1, 123456, 44455566677, 'chave_pix4'),
  (101, 'Banco do Brasil', 9012, 654321, 88899900011, 'chave_pix5'),
  (107, 'Banco Itau', 3456, 789012, 22233344455, 'chave_pix6'),
  (266, 'Banco inter', 1, 210987, 55566677788, 'chave_pix7'),
  (244, 'Banco Nubank', 1, 345678, 99900011122, 'chave_pix8'),
  (266, 'Banco inter', 1, 876543, 33344455566, 'chave_pix9'),
  (244, 'Banco Nubank', 1, 234567, 66677788899, 'chave_pix10');

/* registros t5 cliente */
INSERT INTO cliente (cliente_tipo, nome, dt_nasc, cliente_cpf, cadastro_positivo, cliente_renda, id_conta_banco) VALUES
