CREATE TABLE Hospede (
  cpf VARCHAR (11) NOT NULL,
  CONSTRAINT fk_hospede_usuario FOREIGN KEY (cpf) references Usuario(cpf)
)