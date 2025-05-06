CREATE TABLE USUARIO (
    CPF                         NUMERIC(11)    PRIMARY KEY,     
    Nome                       VARCHAR(50)    NOT NULL,     
    Sobrenome              VARCHAR(50)    NOT NULL,      
    Telefone                   NUMERIC(15)    NOT NULL,     
    Data_nascimento     DATE                  NOT NULL,
    endereco_cidade     VARCHAR(60)    NOT NULL,
    endereco_estado     VARCHAR(2)      NOT NULL,
    endereco_pais         VARCHAR(60)    NOT NULL,
    endereco_CEP        NUMERIC(8)       NOT NULL,
    endereco_bairro       VARCHAR(50)    NOT NULL,
    endereco_pontoref   VARCHAR(100),         
    sexo                          VARCHAR(10)    NOT NULL CHECK (sexo IN ('Feminino', 'Masculino', 'Outro')),
    email                         VARCHAR(100)   NOT NULL UNIQUE,
    senha                        VARCHAR(255)   NOT NULL,

    UNIQUE (Nome, Sobrenome, Telefone)
);