CREATE TABLE CURSO (
    NomeCurso VARCHAR(100),
    CodigoCurso VARCHAR(20),
    QntdAulas INT,
    Nome_Unidade VARCHAR(100),
    Codigo_Departamento VARCHAR(20),
    Vagas INT,
    Nivel VARCHAR(20),
    Ementa TEXT,
    Carga_H INT,
    PRIMARY KEY (NomeCurso, CodigoCurso),
    FOREIGN KEY (Nome_Unidade) REFERENCES UnidadeEscola(Nome_Unidade),
    FOREIGN KEY (Codigo_Departamento) REFERENCES Departamento(Codigo)
);