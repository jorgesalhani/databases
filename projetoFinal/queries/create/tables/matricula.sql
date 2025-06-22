CREATE TABLE MATRICULA (
    Nome VARCHAR(50),
    Sobrenome VARCHAR(50),
    Telefone VARCHAR(20),
    Cod_disciplina VARCHAR(10),
    Dia_Matricula NUMERIC(2),
    Mes_Matricula NUMERIC(2),
    Ano_Matricula NUMERIC(4),
    Semestre NUMERIC(1) NOT NULL CHECK (Semestre IN (1, 2)),
    Ano_Letivo NUMERIC(4) NOT NULL,
    Bolsa BIT,
    Desconto DECIMAL(3,2),
    TAXA DECIMAL(7,2),


    PRIMARY KEY (Nome, Sobrenome, Telefone, Cod_disciplina, Dia_Matricula, Mes_Matricula, Ano_Matricula),
    FOREIGN KEY (Nome, Sobrenome, Telefone)
        REFERENCES Usuario (Nome, Sobrenome, Telefone)
        ON DELETE CASCADE,
    FOREIGN KEY(Cod_disciplina)
        REFERENCES Disciplina(Codigo_Disc)
        ON DELETE CASCADE
);