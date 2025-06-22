CREATE TABLE MENSAGEM(
    NomeA VARCHAR(50),
    SobrenomeA VARCHAR(50),
    TelefoneA VARCHAR(20),
    NomeAu VARCHAR(50),
    SobrenomeAu VARCHAR(50),
    TelefoneAu VARCHAR(20),
    TimestampM Timestamp,
    Conteudo VARCHAR(300) NOT NULL,
    PRIMARY KEY (NomeA, SobrenomeA, TelefoneA, NomeAu, SobrenomeAu, TelefoneAu, TimestampM),
    FOREIGN KEY (NomeA, SobrenomeA, TelefoneA)
        REFERENCES Aluno (Nome, Sobrenome, Telefone)
        ON DELETE CASCADE,
    FOREIGN KEY (NomeAu, SobrenomeAu, TelefoneAu)
        REFERENCES Autor (Nome, Sobrenome, Telefone)
        ON DELETE CASCADE
);
