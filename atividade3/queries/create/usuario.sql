CREATE TABLE Usuario (
  cpf VARCHAR (11) NOT NULL,
  nome VARCHAR(100) NOT NULL,
  sobrenome VARCHAR(100) NOT NULL,
  telefone VARCHAR (20) NOT NULL,
  data_nascimento DATE NOT NULL,
  cidade VARCHAR(100) NOT NULL,
  estado VARCHAR(50) NOT NULL,
  pais VARCHAR(50) NOT NULL,
  cep VARCHAR (10) NOT NULL,
  bairro VARCHAR(150) NOT NULL,
  ponto_de_referencia VARCHAR(500),
  sexo VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  senha VARCHAR(100) NOT NULL,
  CONSTRAINT pk_usuario PRIMARY KEY (cpf),
  CONSTRAINT ck1_usuario UNIQUE(nome, sobrenome, telefone)
)