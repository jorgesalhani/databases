CREATE TABLE ALUNOCURSO (
    NomeCurso VARCHAR(100),
    CodigoCurso VARCHAR(20),
    Nome VARCHAR(50),
    Sobrenome VARCHAR(50),
    Telefone VARCHAR(20),
    PRIMARY KEY (NomeCurso, CodigoCurso, Nome, Sobrenome, Telefone),
    FOREIGN KEY(CodigoDisc)
        REFERENCES Disciplina(Codigo_Disc)
        ON DELETE CASCADE,
    FOREIGN KEY(Nome, Sobrenome, Telefone)
        REFERENCES Aluno(Nome, Sobrenome, Telefone)
        ON DELETE CASCADE
);