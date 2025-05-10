CREATE TABLE DATA_RESERVA (
    id_data         NUMERIC     PRIMARY KEY,
    id_reserva      NUMERIC     NOT NULL,
    periodo         DATERANGE   NOT NULL,
    
    FOREIGN KEY (id_reserva) REFERENCES RESERVA(id_reserva)
);