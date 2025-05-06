CREATE TABLE Avaliacao (
  id_avaliacao SERIAL NOT NULL,
  clas_limpeza INT NOT NULL,
  clas_prop INT,
  clas_comunicacao INT,
  clas_localizacao INT,
  clas_valor INT,
  CONSTRAINT pk_avaliacao PRIMARY KEY (id_avaliacao)
)