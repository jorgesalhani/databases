CREATE TABLE Proprietario (
  cpf varchar(11) NOT NULL,
  n_conta INT NOT NULL,
  agencia INT NOT NULL,
  tipo VARCHAR(20) NOT NULL,
  CONSTRAINT fk_proprietario_usuario FOREIGN KEY (cpf) REFERENCES Usuario(cpf)
)