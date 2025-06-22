CREATE TABLE PREREQDISCIPLINA (
    NomeCurso VARCHAR(100),
    CodigoCurso VARCHAR(20),
    CodigoDiscPre VARCHAR(20),
    PRIMARY KEY (NomeCurso, CodigoCurso, Codigo_DiscPre),
    FOREIGN KEY(CodigoDiscPre)
        REFERENCES Disciplina(Codigo_Disc)
        ON DELETE CASCADE,
    FOREIGN KEY(NomeCurso, CodigoCurso)
        REFERENCES Curso(NomeCurso, CodigoCurso)
        ON DELETE CASCADE
);