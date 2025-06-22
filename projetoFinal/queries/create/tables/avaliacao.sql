CREATE TABLE AVALIACAO (
    Nome VARCHAR(50),
    Sobrenome VARCHAR(50),
    Telefone VARCHAR(20),
    Cod_disciplina VARCHAR(10),
    Comentario VARCHAR(140) NOT NULL,
    Didatica NUMERIC(2) NOT NULL,
    Material NUMERIC(2) NOT NULL,
    Conteudo NUMERIC(2) NOT NULL,
    Infra NUMERIC(2) NOT NULL,




    PRIMARY KEY (Nome, Sobrenome, Telefone, Cod_disciplina),
    FOREIGN KEY (Nome, Sobrenome, Telefone)
        REFERENCES Usuario (Nome, Sobrenome, Telefone)
        ON DELETE CASCADE,
    FOREIGN KEY(Cod_disciplina)
        REFERENCES Disciplina(Codigo_Disc)
        ON DELETE CASCADE
);