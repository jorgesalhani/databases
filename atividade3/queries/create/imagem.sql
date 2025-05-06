CREATE TABLE Imagem (
  id_imagem SERIAL NOT NULL,
  conteudo BYTEA,
  CONSTRAINT pk_imagem PRIMARY KEY (id_imagem)
)