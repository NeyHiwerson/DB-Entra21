CREATE TABLE
    vendedor (
        mat_Vend int NOT NULL PRIMARY KEY AUTO_INCREMENT,
        nome VARCHAR(100) NOT NULL,
        salario DECIMAL NOT NULL
    );

create table
    produto (
        cod_Produto int NOT NULL PRIMARY KEY AUTO_INCREMENT,
        nome VARCHAR(100) NOT NULL,
        preco_custo DECIMAL NOT NULL,
        qtde_estoque int NOT NULL
    );

CREATE TABLE
    venda (
        nr_Venda int NOT NULL PRIMARY KEY AUTO_INCREMENT,
        dt_venda DATE NOT NULL,
        valor_venda DECIMAL NOT NULL,
        qtde_estoque int NOT NULL,
        mat_Vend INT
    );

CREATE TABLE
    itensVenda (
        id_ItensVenda int NOT NULL PRIMARY KEY AUTO_INCREMENT,
        preco_vendido DECIMAL,
        quant_vendido INT,
        nr_venda int,
        cod_Produto INT
    );

alter table venda add constraint mat_Vend foreign key (mat_Vend) references vendedor (mat_Vend);

alter table itensVenda add constraint nr_Venda foreign key (nr_Venda) references venda (nr_Venda);

alter table itensVenda add constraint cod_Produto foreign key (cod_Produto) references produto (cod_Produto);

INSERT into
    `vendedor` (`nome`, `salario`)
VALUES
    ('Alexandre Mathias', '3720'),
    ('José Pedro dos Anjos', '5720'),
    ('Manuella Antuérpica', '4720');

INSERT INTO
    `produto` (`nome`, `preco_custo`, `qtde_estoque`)
VALUES
    ('Chocolate Maravilhoso', '4,50', '15'),
    ('Chocolate Perfeito', '2,50', '10'),
    ('Chocolate Consistente', '14,50', '150');

INSERT INTO
    `venda` (`dt_venda`, `valor_venda`, `mat_Vend`)
VALUES
    ('2023/04/25', '2000', '2'),
    ('2023/05/08', '6000', '2'),
    ('2023/08/22', '5500', '2'),
    ('2023/06/12', '1000', '2'),
    ('2023/06/12', '2000', '2'),
    ('2023/06/12', '500', '2');

INSERT INTO
    `itensvenda` (
        `cod_Produto`,
        `nr_Venda`,
        `preco_vendido`,
        `quant_vendido`
    )
VALUES
    ('1', '4', '3', '10'),
    ('1', '4', '4', '50'),
    ('1', '4', '5', '20'),
    ('2', '5', '40', '14'),
    ('2', '5', '5', '50'),
    ('2', '5', '6', '50'),
    ('3', '6', '10', '50'),
    ('3', '6', '80', '50'),
    ('3', '6', '60', '50');

/* selecione todas as vendas realizadas em 12 de junho de 2023 */

SELECT
    produto.nome
FROM
    venda,
    itensvenda,
    produto
WHERE
    venda.dt_venda = '2023-06-12'
    AND venda.nr_Venda = itensvenda.nr_venda
    AND produto.cod_produto = itensvenda.cod_Produto;

/* selecione todas as vendas do 'José Pedro dos Anjos' */
select 


/* selecione os nomes dos produtos com vendas de quantidade maior que 10 unidades vendidas */


/* mostrar os nomes dos vendedores que venderam produtos com o preço de custo maior que R$10,00 */