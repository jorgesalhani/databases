CREATE TABLE USUARIO (
    CPF                         NUMERIC(11)    NOT NULL,     
    Nome                        VARCHAR(50)    NOT NULL,     
    Sobrenome                   VARCHAR(50)    NOT NULL,      
    Telefone                    NUMERIC(15)    NOT NULL,     
    Dia_Nascimento              NUMERIC(2)     NOT NULL,
    Mes_Nascimento              NUMERIC(2)     NOT NULL,
    Ano_Nascimento              NUMERIC(4)     NOT NULL,
    Endereco_cidade             VARCHAR(60)    NOT NULL,
    Endereco_estado             VARCHAR(2)     NOT NULL,
    Endereco_pais               VARCHAR(60)    NOT NULL,
    Endereco_CEP                NUMERIC(8)     NOT NULL,
    Endereco_bairro             VARCHAR(50)    NOT NULL,
    Endereco_rua                VARCHAR(50)    NOT NULL,
    Sexo                        VARCHAR(10)    NOT NULL CHECK (Sexo IN ('Feminino', 'Masculino', 'Outro')),
    Email                       VARCHAR(100)   NOT NULL UNIQUE,
    Senha                       VARCHAR(255)   NOT NULL,

    PRIMARY KEY (Nome, Sobrenome, Telefone)
);