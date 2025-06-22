CREATE TABLE REGRADISCIPLINA (
    Codigo_Disc                 VARCHAR(10),      
    Tipo_Regra                  VARCHAR(50),

    PRIMARY KEY (Codigo_Disc, Tipo_Regra),
    FOREIGN KEY (Codigo_Disc) REFERENCES DISCIPLINA (Codigo_Disc) ON DELETE CASCADE,
    FOREIGN KEY (Tipo_Regra) REFERENCES REGRA (Tipo) ON DELETE CASCADE

);