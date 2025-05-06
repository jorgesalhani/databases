CREATE TABLE RESERVA (
    id_reserva        NUMERIC         PRIMARY KEY,
    CPF_hospede       NUMERIC(11)   NOT NULL,
    id_propriedade    NUMERIC         NOT NULL,
    n_hospedes        NUMERIC         NOT NULL,
    imposto           NUMERIC(10,2),
    preco_total       NUMERIC(10,2),
    preco_c_imposto   NUMERIC(10,2),
    taxa_limpeza      NUMERIC(10,2),

    FOREIGN KEY (CPF_hospede) REFERENCES HOSPEDE(CPF),
    FOREIGN KEY (id_propriedade) REFERENCES PROPRIEDADE(id_propriedade)
);