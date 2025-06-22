CREATE TABLE PREREQCURSO (
    NomeCurso VARCHAR(100),
    CodigoCurso VARCHAR(20),
    NomeCursoPre VARCHAR(100),
    CodigoCursoPre VARCHAR(20),
    PRIMARY KEY (NomeCurso, CodigoCurso, NomeCursoPre, CodigoCursoPre),
     FOREIGN KEY(NomeCursoPre, CodigoCursoPre)
        REFERENCES Curso (NomeCurso, CodigoCurso)
        ON DELETE CASCADE,
    FOREIGN KEY(NomeCurso, CodigoCurso)
        REFERENCES Curso(NomeCurso, CodigoCurso)
        ON DELETE CASCADE
);