CREATE TABLE AUTOR(
    Nome VARCHAR(50),
    Sobrenome VARCHAR(50),
    Telefone VARCHAR(20),
    PRIMARY KEY (Nome, Sobrenome, Telefone),
    FOREIGN KEY (Nome, Sobrenome, Telefone)
        REFERENCES Usuario (Nome, Sobrenome, Telefone)
        ON DELETE CASCADE
);
