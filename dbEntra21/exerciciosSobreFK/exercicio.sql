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