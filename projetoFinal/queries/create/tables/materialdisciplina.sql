CREATE TABLE INFRADISCIPLINA (
    Codigo_Disc                 VARCHAR(10),      
    Tipo_Material               VARCHAR(50),

    PRIMARY KEY (Codigo_Disc, Tipo_Material),
    FOREIGN KEY (Codigo_Disc) REFERENCES DISCIPLINA (Codigo_Disc) ON DELETE CASCADE,
    FOREIGN KEY (Tipo_Material) REFERENCES MATERIAL (Tipo) ON DELETE CASCADE

);