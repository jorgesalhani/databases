CREATE TABLE PROFESSOR (
    Nome VARCHAR(50),
    Sobrenome VARCHAR(50),
    Telefone VARCHAR(20),
    Titulo VARCHAR(100),
    Especialidade VARCHAR(100),
    PRIMARY KEY (Nome, Sobrenome, Telefone),
    FOREIGN KEY (Nome, Sobrenome, Telefone)
        REFERENCES Usuario (Nome, Sobrenome, Telefone)
        ON DELETE CASCADE
);
