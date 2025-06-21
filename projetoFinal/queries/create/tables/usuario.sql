CREATE TABLE USUARIO (
    CPF                         NUMERIC(11)    NOT NULL,     
    Nome                        VARCHAR(50)    NOT NULL,     
    Sobrenome                   VARCHAR(50)    NOT NULL,      
    Telefone                    NUMERIC(15)    NOT NULL,     
    Dia_Nascimento              NUMERIC(2)     NOT NULL,
    Mes_Nascimento              NUMERIC(2)     NOT NULL,
    Ano_Nascimento              NUMERIC(4)     NOT NULL,
    endereco_cidade             VARCHAR(60)    NOT NULL,
    endereco_estado             VARCHAR(2)     NOT NULL,
    endereco_pais               VARCHAR(60)    NOT NULL,
    endereco_CEP                NUMERIC(8)     NOT NULL,
    endereco_bairro             VARCHAR(50)    NOT NULL,
    endereco_rua                VARCHAR(50)    NOT NULL,
    sexo                        VARCHAR(10)    NOT NULL CHECK (sexo IN ('Feminino', 'Masculino', 'Outro')),
    email                       VARCHAR(100)   NOT NULL UNIQUE,
    senha                       VARCHAR(255)   NOT NULL,

    PRIMARY KEY (Nome, Sobrenome, Telefone)
);