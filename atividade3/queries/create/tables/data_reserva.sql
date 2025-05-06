CREATE TABLE DATA_RESERVA (
    id_data     NUMERIC     PRIMARY KEY,
    id_reserva NUMERIC     NOT NULL,
    data_checkin   DATE        NOT NULL,
    data_checkout  DATE        NOT NULL,

    FOREIGN KEY (id_reserva) REFERENCES RESERVA(id_reserva),

    CHECK (data_checkout > data_checkin)
);