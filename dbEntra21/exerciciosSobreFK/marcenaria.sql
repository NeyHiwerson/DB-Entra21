-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: Out 10, 2012 as 01:37 PM
-- Versão do Servidor: 5.5.10
-- Versão do PHP: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `marcenaria`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidade`
--

CREATE TABLE IF NOT EXISTS `cidade` (
  `Cod_Cid` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `Estado_Cid` varchar(50) NOT NULL,
  `Nome_Cid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Cod_Cid`),
  KEY `Cidade_FKIndex1` (`Estado_Cid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Extraindo dados da tabela `cidade`
--

INSERT INTO `cidade` (`Cod_Cid`, `Estado_Cid`, `Nome_Cid`) VALUES
(1, 'SC', 'JOINVILLE'),
(2, 'SP', 'SAO PAULO'),
(3, 'AM', 'MANAUS'),
(4, 'PR', 'CURITIBA'),
(5, 'SC', 'FLORIPA'),
(7, 'MG', 'UBERABA'),
(8, 'SP', 'CAMPINAS');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `Cod_Cli` int(5) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Cod_Cli`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `cliente`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `compra`
--

CREATE TABLE IF NOT EXISTS `compra` (
  `Produtos_Cod_Prod` int(5) NOT NULL,
  `Fornecedor_Cod_Fornecedor` int(5) NOT NULL,
  `Cod_Compra` int(5) NOT NULL AUTO_INCREMENT,
  `Qntde_Mat` varchar(50) DEFAULT NULL,
  `Valor_Comp` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Cod_Compra`),
  KEY `Produtos_has_Fornecedor_FKIndex1` (`Produtos_Cod_Prod`),
  KEY `Produtos_has_Fornecedor_FKIndex2` (`Fornecedor_Cod_Fornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `compra`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `controle_material`
--

CREATE TABLE IF NOT EXISTS `controle_material` (
  `Tipo_Material_Codigo_Mat` int(5) NOT NULL,
  `Produtos_Cod_Prod` int(5) NOT NULL,
  `Cod_Contr` int(5) NOT NULL AUTO_INCREMENT,
  `Qntde_Estoque` varchar(30) DEFAULT NULL,
  `Qntde_Minima` int(3) DEFAULT NULL,
  PRIMARY KEY (`Cod_Contr`),
  KEY `Tipo_Material_has_Produtos_FKIndex1` (`Tipo_Material_Codigo_Mat`),
  KEY `Tipo_Material_has_Produtos_FKIndex2` (`Produtos_Cod_Prod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `controle_material`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `fisica`
--

CREATE TABLE IF NOT EXISTS `fisica` (
  `Cod_Fisica` int(5) NOT NULL,
  `CPF` int(11) unsigned NOT NULL,
  `Sexo_Fis` varchar(10) NOT NULL DEFAULT '',
  `DtNasc_Fis` date DEFAULT NULL,
  PRIMARY KEY (`Cod_Fisica`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `fisica`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
--

CREATE TABLE IF NOT EXISTS `fornecedor` (
  `Cod_Forn` int(5) NOT NULL AUTO_INCREMENT,
  `Nome_Forn` varchar(50) NOT NULL,
  `Endereco_Forn` varchar(50) DEFAULT NULL,
  `Telefone_Forn` varchar(20) DEFAULT NULL,
  `CNPJ_Jur` int(25) NOT NULL,
  `Razao_Jur` varchar(100) NOT NULL,
  `DtFund_Jur` date NOT NULL,
  PRIMARY KEY (`Cod_Forn`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `fornecedor`
--

INSERT INTO `fornecedor` (`Cod_Forn`, `Nome_Forn`, `Endereco_Forn`, `Telefone_Forn`, `CNPJ_Jur`, `Razao_Jur`, `DtFund_Jur`) VALUES
(1, 'antonio', 'jose', '34340015', 2147483647, 'Distribuidora', '2012-10-26');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionarios`
--

CREATE TABLE IF NOT EXISTS `funcionarios` (
  `Cod_Fun` int(5) NOT NULL AUTO_INCREMENT,
  `Salario_Fun` varchar(10) DEFAULT NULL,
  `Funcao_Fun` varchar(50) DEFAULT NULL,
  `Especialidade_Fun` varchar(50) DEFAULT NULL,
  `Escolaridade_Fun` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Cod_Fun`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `funcionarios`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa`
--

CREATE TABLE IF NOT EXISTS `pessoa` (
  `Cidade_Cod_Cid` int(5) unsigned NOT NULL,
  `Nome_Pes` varchar(50) NOT NULL,
  `Endereco_Pes` varchar(50) DEFAULT NULL,
  `Complemento_Pes` varchar(25) DEFAULT NULL,
  `Telefone_Pes` varchar(25) DEFAULT NULL,
  KEY `Pessoa_FKIndex1` (`Cidade_Cod_Cid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pessoa`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE IF NOT EXISTS `produtos` (
  `Cod_Prod` int(5) NOT NULL AUTO_INCREMENT,
  `Nome_Prod` varchar(100) NOT NULL,
  `Altura_Prod` float DEFAULT NULL,
  `Valor_Prod` float DEFAULT NULL,
  `Sobras_Prod` varchar(200) DEFAULT NULL,
  `Observacoes_Prod` varchar(255) DEFAULT NULL,
  `Largura_Prod` float NOT NULL,
  `Comprimento_Prod` float NOT NULL,
  PRIMARY KEY (`Cod_Prod`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`Cod_Prod`, `Nome_Prod`, `Altura_Prod`, `Valor_Prod`, `Sobras_Prod`, `Observacoes_Prod`, `Largura_Prod`, `Comprimento_Prod`) VALUES
(1, 'Mesa', 3, 1000, 'Nenhuma', 'Feita pelo Moisés.', 2, 1),
(2, 'Mesa 001', 4, 1200, 'Muitas madeiras.', 'Feita pelo Tonhão.', 3, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `projetos`
--

CREATE TABLE IF NOT EXISTS `projetos` (
  `Cliente_Codigo_Cli` int(5) NOT NULL,
  `Cod_Proj` int(5) NOT NULL AUTO_INCREMENT,
  `Produtos_Cod_Prod` int(5) NOT NULL,
  `Funcionarios_Cod_Fun` int(5) NOT NULL,
  `Cliente_Fisica_CPF` int(11) unsigned NOT NULL,
  `Funcionarios_Fisica_CPF` int(11) unsigned NOT NULL,
  `Dt_Inicio_Proj` date DEFAULT NULL,
  `Dt_Termino_Proj` date DEFAULT NULL,
  PRIMARY KEY (`Cod_Proj`),
  KEY `Funcionarios_has_Cliente_FKIndex1` (`Funcionarios_Cod_Fun`,`Funcionarios_Fisica_CPF`),
  KEY `Funcionarios_has_Cliente_FKIndex2` (`Cliente_Codigo_Cli`,`Cliente_Fisica_CPF`),
  KEY `Projetos_FKIndex3` (`Produtos_Cod_Prod`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `projetos`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_material`
--

CREATE TABLE IF NOT EXISTS `tipo_material` (
  `Cod_Mat` int(5) NOT NULL AUTO_INCREMENT,
  `Nome_Mat` varchar(50) DEFAULT NULL,
  `Peso_Mat` float DEFAULT NULL,
  `Valor_Mat` float DEFAULT NULL,
  `Cor_Mat` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Cod_Mat`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `tipo_material`
--

INSERT INTO `tipo_material` (`Cod_Mat`, `Nome_Mat`, `Peso_Mat`, `Valor_Mat`, `Cor_Mat`) VALUES
(1, 'TESTE', 12, 12, 'AM'),
(2, 'SEILA', 12, 123, 'GO'),
(3, 'Canela-Merda', 30, 120, 'Mesclado'),
(4, 'teste4', 23, 67, 'Tabaco');

-- --------------------------------------------------------

--
-- Estrutura da tabela `uf`
--

CREATE TABLE IF NOT EXISTS `uf` (
  `Cod_UF` int(5) NOT NULL AUTO_INCREMENT,
  `Sigla_UF` varchar(2) NOT NULL,
  `Estado_UF` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Cod_UF`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `uf`
--

INSERT INTO `uf` (`Cod_UF`, `Sigla_UF`, `Estado_UF`) VALUES
(1, 'SC', 'Santa Catarina'),
(2, 'SP', 'São Paulo');
