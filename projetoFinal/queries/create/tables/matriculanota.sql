CREATE TABLE MATRICULANOTA (
    Nome VARCHAR(50),
    Sobrenome VARCHAR(50),
    Telefone VARCHAR(20),
    Cod_disciplina VARCHAR(10),
    Dia_Matricula NUMERIC(2),
    Mes_Matricula NUMERIC(2),
    Ano_Matricula NUMERIC(4),
    Tipo_Nota VARCHAR(20),
    Nota DECIMAL(4,2) NOT NULL CHECK(Nota <= 10.0),


    PRIMARY KEY (Nome, Sobrenome, Telefone, Cod_disciplina, Dia_Matricula, Mes_Matricula, Ano_Matricula, Tipo_Nota),
    FOREIGN KEY (Nome, Sobrenome, Telefone, Cod_disciplina, Dia_Matricula, Mes_Matricula, Ano_Matricula)
        REFERENCES Matricula (Nome, Sobrenome, Telefone, Cod_disciplina, Dia_Matricula, Mes_Matricula, Ano_Matricula)
        ON DELETE CASCADE
);