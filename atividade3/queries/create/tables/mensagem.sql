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