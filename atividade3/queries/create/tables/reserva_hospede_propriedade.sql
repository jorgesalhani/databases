CREATE TABLE RESERVA_HOSPEDE_PROPRIEDADE (
    CPF_hospede     NUMERIC(11)  NOT NULL,
    id_propriedade  NUMERIC      NOT NULL,
    id_reserva      NUMERIC      NOT NULL,

    PRIMARY KEY (CPF_hospede, id_propriedade, id_reserva),
    FOREIGN KEY (CPF_hospede)    REFERENCES HOSPEDE(CPF),
    FOREIGN KEY (id_propriedade) REFERENCES PROPRIEDADE(id_propriedade),
    FOREIGN KEY (id_reserva)     REFERENCES RESERVA(id_reserva)
);