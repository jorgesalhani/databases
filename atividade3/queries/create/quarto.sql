CREATE TABLE Quarto (
  id_quarto SERIAL NOT NULL,
  tipo VARCHAR(20) NOT NULL,
  qntd_cama INT NOT NULL,
  tipo_cama VARCHAR(20) NOT NULL,
  banheiro BOOLEAN NOT NULL,
  CONSTRAINT pk_quarto PRIMARY KEY (id_quarto)
)