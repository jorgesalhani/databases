CREATE TABLE CURSODISCIPLINA (
    NomeCurso VARCHAR(100),
    CodigoCurso VARCHAR(20),
    CodigoDisc VARCHAR(20),
    PRIMARY KEY (NomeCurso, CodigoCurso, Codigo_Disc),
    FOREIGN KEY(CodigoDisc)
        REFERENCES Disciplina(Codigo_Disc)
        ON DELETE CASCADE,
    FOREIGN KEY(NomeCurso, CodigoCurso)
        REFERENCES Curso(NomeCurso, CodigoCurso)
        ON DELETE CASCADE
);