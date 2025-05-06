CREATE TABLE QUARTO (
    id_quarto            NUMERIC       PRIMARY KEY,
    id_propriedade   NUMERIC  NOT NULL,
    tipo                     VARCHAR(50)   NOT NULL,
    qntd_cama         NUMERIC       NOT NULL,
    tipo_cama1        VARCHAR(50),
    tipo_cama2        VARCHAR(50),
    banheiro_priv     BOOLEAN       NOT NULL,

    FOREIGN KEY (id_propriedade) REFERENCES PROPRIEDADE(id_propriedade)
);