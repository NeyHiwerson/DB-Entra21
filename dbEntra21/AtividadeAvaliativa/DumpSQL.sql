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
  
