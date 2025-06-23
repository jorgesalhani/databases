CREATE TABLE ALUNO (
    Nome_Unidade VARCHAR(50) NOT NULL,
    Nome VARCHAR(50),
    Sobrenome VARCHAR(50),
    Telefone VARCHAR(20),
    Nome_Unidade 
    PRIMARY KEY (Nome, Sobrenome, Telefone),
    FOREIGN KEY (Nome, Sobrenome, Telefone)
        REFERENCES Usuario (Nome, Sobrenome, Telefone)
        ON DELETE CASCADE,
    FOREIGN KEY (Nome_Unidade)
    REFERENCES UNIDADEESCOLA (Nome_Unidade)
);
