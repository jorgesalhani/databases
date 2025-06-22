CREATE TABLE RESPONSAVEL (
    Nome VARCHAR(50),
    Sobrenome VARCHAR(50),
    Telefone VARCHAR(20),
    Cod_disciplina VARCHAR(10),

    PRIMARY KEY (Nome, Sobrenome, Telefone, Cod_disciplina),
    FOREIGN KEY (Nome, Sobrenome, Telefone)
        REFERENCES Professor (Nome, Sobrenome, Telefone)
        ON DELETE CASCADE,
    FOREIGN KEY(Cod_disciplina)
        REFERENCES Disciplina(Codigo_Disc)
        ON DELETE CASCADE
);