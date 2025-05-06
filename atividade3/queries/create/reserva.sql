CREATE TABLE Reserva (
  id_reserva SERIAL NOT NULL,
  data_reserva DATE NOT NULL,
  n_hospedes INT NOT NULL, 
  imposto DECIMAL(50,2),
  preco_total DECIMAL(50,2),
  preco_c_imposto DECIMAL(50,2),
  taxa_limpeza DECIMAL(50,2),
  CONSTRAINT pk_reserva PRIMARY KEY (id_reserva)
)