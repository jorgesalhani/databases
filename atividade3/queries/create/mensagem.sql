CREATE TABLE Mensagem (
  id_mensagem SERIAL NOT NULL,
  data_envio DATE NOT NULL,
  hora_envio TIME NOT NULL,
  conteudo VARCHAR(500) NOT NULL,
  CONSTRAINT pk_Mensagem PRIMARY KEY (id_mensagem)
)