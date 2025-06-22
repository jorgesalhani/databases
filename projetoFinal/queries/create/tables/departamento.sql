CREATE TABLE DEPARTAMENTO (
    Codigo VARCHAR(20),
    Nome VARCHAR(50),
    Nome_Chefe VARCHAR(50),
    Sobrenome_Chefe VARCHAR(50),
    Telefone_Chefe VARCHAR(20)

    PRIMARY KEY(Codigo),
    FOREIGN KEY(Nome_Chefe, Sobrenome_Chefe, Telefone_Chefe) 
        REFERENCES CHEFE(Nome, Sobrenome, Telefone)
        ON DELETE SET NULL
);