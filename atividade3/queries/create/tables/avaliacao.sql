CREATE TABLE AVALIACAO (
    id_avaliacao         NUMERIC          PRIMARY KEY,
    CPF_hospede          NUMERIC(11)      NOT NULL,
    id_reserva           NUMERIC         NOT NULL,
    clas_limpeza         NUMERIC(2,1),  
    clas_prop            NUMERIC(2,1),
    clas_comunicacao     NUMERIC(2,1),
    clas_localizacao     NUMERIC(2,1),
    clas_valor           NUMERIC(2,1),

    FOREIGN KEY (CPF_hospede) REFERENCES HOSPEDE(CPF),
    FOREIGN KEY (id_reserva) REFERENCES RESERVA(id_reserva)
);