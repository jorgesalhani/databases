CREATE TABLE DISCIPLINA (
    Nome                        VARCHAR(50)    NOT NULL,     
    Codigo_Disc                 VARCHAR(10)    NOT NULL,      
    Qntd_Aulas                  NUMERIC(2)     NOT NULL,
    Nome_Unidade                VARCHAR(50)    NOT NULL,

    PRIMARY KEY (Codigo_Disc),
    FOREIGN KEY (Nome_Unidade) REFERENCES UNIDADE_ESCOLA (Nome_Unidade)

);