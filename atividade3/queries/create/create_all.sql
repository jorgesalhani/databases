CREATE TABLE USUARIO (
    CPF                 NUMERIC(11)  PRIMARY KEY,     
    Nome                VARCHAR(50)  NOT NULL,     
    Sobrenome           VARCHAR(50)  NOT NULL,      
    Telefone            NUMERIC(15)  NOT NULL,     
    Data_nascimento     DATE         NOT NULL,
    endereco_cidade     VARCHAR(60)  NOT NULL,
    endereco_estado     VARCHAR(2)   NOT NULL,
    endereco_pais       VARCHAR(60)  NOT NULL,
    endereco_CEP        NUMERIC(8)   NOT NULL,
    endereco_bairro     VARCHAR(50)  NOT NULL,
    endereco_pontoref   VARCHAR(100),
    sexo                VARCHAR(10)  NOT NULL CHECK (sexo IN ('Feminino', 'Masculino', 'Outro')),
    email               VARCHAR(100) NOT NULL UNIQUE,
    senha               VARCHAR(255) NOT NULL,
    UNIQUE (Nome, Sobrenome, Telefone)
);

CREATE TABLE HOSPEDE (
    CPF NUMERIC(11) PRIMARY KEY,
    FOREIGN KEY (CPF) REFERENCES USUARIO(CPF)
);


CREATE TABLE PROPRIETARIO (
    CPF      NUMERIC(11) PRIMARY KEY,
    n_conta  NUMERIC     NOT NULL UNIQUE,
    agencia  NUMERIC     NOT NULL,
    tipo     VARCHAR(20) NOT NULL,
    FOREIGN KEY (CPF) REFERENCES USUARIO(CPF)
);


CREATE TABLE PROPRIEDADE (
    id_propriedade     NUMERIC        PRIMARY KEY,
    CPF_proprietario   NUMERIC(11)    NOT NULL,
    Nome               VARCHAR(100)   NOT NULL,
    endereco_cidade    VARCHAR(60)    NOT NULL,
    endereco_estado    VARCHAR(2)     NOT NULL,
    endereco_pais      VARCHAR(60)    NOT NULL,
    endereco_numero    NUMERIC        NOT NULL,
    endereco_CEP       NUMERIC(8)     NOT NULL,
    endereco_bairro    VARCHAR(50)    NOT NULL,
    endereco_pontoref  VARCHAR(100),
    tipo               VARCHAR(30)    NOT NULL,
    n_quartos          NUMERIC        NOT NULL,
    n_banheiros        NUMERIC        NOT NULL,
    preco_noite        NUMERIC(10,2)  NOT NULL,
    max_hospedes       NUMERIC        NOT NULL,
    min_noites         NUMERIC        NOT NULL,
    max_noites         NUMERIC        NOT NULL,
    taxa_limpeza       NUMERIC(10,2),
    datas_disp         DATE,
    hor_checkin        TIME,
    hor_checkout       TIME,
    regra1             VARCHAR(100),
    regra2             VARCHAR(100),
    regra3             VARCHAR(100),
    regra4             VARCHAR(100),
    comodidade1        VARCHAR(100),
    comodidade2        VARCHAR(100),
    comodidade3        VARCHAR(100),
    comodidade4        VARCHAR(100),

    FOREIGN KEY (CPF_proprietario) REFERENCES PROPRIETARIO(CPF)
);

CREATE TABLE QUARTO (
    id_quarto       NUMERIC     PRIMARY KEY,
    id_propriedade  NUMERIC     NOT NULL,
    tipo            VARCHAR(50) NOT NULL,
    qntd_cama       NUMERIC     NOT NULL,
    tipo_cama1      VARCHAR(50),
    tipo_cama2      VARCHAR(50),
    banheiro_priv   BOOLEAN     NOT NULL,

    FOREIGN KEY (id_propriedade) REFERENCES PROPRIEDADE(id_propriedade)
);



CREATE TABLE RESERVA (
    id_reserva        NUMERIC       PRIMARY KEY,
    CPF_hospede       NUMERIC(11)   NOT NULL,
    id_propriedade    NUMERIC       NOT NULL,
    n_hospedes        NUMERIC       NOT NULL,
    imposto           NUMERIC(10,2),
    preco_total       NUMERIC(10,2),
    preco_c_imposto   NUMERIC(10,2),
    taxa_limpeza      NUMERIC(10,2),

    FOREIGN KEY (CPF_hospede) REFERENCES HOSPEDE(CPF),
    FOREIGN KEY (id_propriedade) REFERENCES PROPRIEDADE(id_propriedade)
);

CREATE TABLE AVALIACAO (
    id_avaliacao         NUMERIC        PRIMARY KEY,
    CPF_hospede          NUMERIC(11)    NOT NULL,
    id_reserva           NUMERIC        NOT NULL,
    clas_limpeza         NUMERIC(2,1),  
    clas_prop            NUMERIC(2,1),
    clas_comunicacao     NUMERIC(2,1),
    clas_localizacao     NUMERIC(2,1),
    clas_valor           NUMERIC(2,1),

    FOREIGN KEY (CPF_hospede) REFERENCES HOSPEDE(CPF),
    FOREIGN KEY (id_reserva) REFERENCES RESERVA(id_reserva)
);


CREATE TABLE IMAGEM (
    id_imagem     NUMERIC  PRIMARY KEY,
    id_avaliacao  NUMERIC  NOT NULL,
    conteudo      BYTEA,         

    FOREIGN KEY (id_avaliacao) REFERENCES AVALIACAO(id_avaliacao)
);


CREATE TABLE RESERVA_HOSPEDE_PROPRIEDADE (
    CPF_hospede     NUMERIC(11)  NOT NULL,
    id_propriedade  NUMERIC      NOT NULL,
    id_reserva      NUMERIC      NOT NULL,

    PRIMARY KEY (CPF_hospede, id_propriedade, id_reserva),
    FOREIGN KEY (CPF_hospede)    REFERENCES HOSPEDE(CPF),
    FOREIGN KEY (id_propriedade) REFERENCES PROPRIEDADE(id_propriedade),
    FOREIGN KEY (id_reserva)     REFERENCES RESERVA(id_reserva)
);


CREATE TABLE DATA_RESERVA (
    id_data        NUMERIC  PRIMARY KEY,
    id_reserva     NUMERIC   NOT NULL,
    data_checkin   DATE  NOT NULL,
    data_checkout  DATE  NOT NULL,

    FOREIGN KEY (id_reserva) REFERENCES RESERVA(id_reserva),

    CHECK (data_checkout > data_checkin)
);


CREATE TABLE MENSAGEM (
    id_mensagem       NUMERIC         PRIMARY KEY,
    CPF_remetente     NUMERIC(11)     NOT NULL,
    CPF_destinatario  NUMERIC(11)     NOT NULL,
    data_envio        DATE            NOT NULL,
    hora_envio        TIME            NOT NULL,
    conteudo          TEXT,

    FOREIGN KEY (CPF_remetente)     REFERENCES USUARIO(CPF),
    FOREIGN KEY (CPF_destinatario)  REFERENCES USUARIO(CPF)
);