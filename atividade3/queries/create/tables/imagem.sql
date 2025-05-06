CREATE TABLE IMAGEM (
    id_imagem     NUMERIC        PRIMARY KEY,
    id_avaliacao  NUMERIC        NOT NULL,
    conteudo      BYTEA,         

    FOREIGN KEY (id_avaliacao) REFERENCES AVALIACAO(id_avaliacao)
);
