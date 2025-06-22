CREATE TABLE INFRADISCIPLINA (
    Codigo_Disc                 VARCHAR(10),      
    Tipo_Infra                  VARCHAR(50),

    PRIMARY KEY (Codigo_Disc, Tipo_Infra),
    FOREIGN KEY (Codigo_Disc) REFERENCES DISCIPLINA (Codigo_Disc) ON DELETE CASCADE,
    FOREIGN KEY (Tipo_Infra) REFERENCES INFRAESTRUTURA (Tipo) ON DELETE CASCADE

);