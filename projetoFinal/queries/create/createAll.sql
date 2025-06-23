CREATE TABLE USUARIO (    
    Nome                        VARCHAR(50)    NOT NULL,     
    Sobrenome                   VARCHAR(50)    NOT NULL,      
    Telefone                    NUMERIC(15)    NOT NULL,     
    Dia_Nascimento              NUMERIC(2)     NOT NULL,
    Mes_Nascimento              NUMERIC(2)     NOT NULL,
    Ano_Nascimento              NUMERIC(4)     NOT NULL,
    Endereco_cidade             VARCHAR(60)    NOT NULL,
    Endereco_estado             VARCHAR(2)     NOT NULL,
    Endereco_pais               VARCHAR(60)    NOT NULL,
    Endereco_CEP                NUMERIC(8)     NOT NULL,
    Endereco_bairro             VARCHAR(50)    NOT NULL,
    Endereco_rua                VARCHAR(50)    NOT NULL,
    Sexo                        VARCHAR(10)    NOT NULL CHECK (Sexo IN ('Feminino', 'Masculino', 'Outro')),
    Email                       VARCHAR(100)   NOT NULL UNIQUE,
    Senha                       VARCHAR(255)   NOT NULL,

    CONSTRAINT pk_usuario PRIMARY KEY (Nome, Sobrenome, Telefone)
);

CREATE TABLE ALUNO (
    Nome_Unidade VARCHAR(50) NOT NULL,
    Nome VARCHAR(50),
    Sobrenome VARCHAR(50),
    Telefone VARCHAR(20),
    PRIMARY KEY (Nome, Sobrenome, Telefone),
    FOREIGN KEY (Nome, Sobrenome, Telefone)
        REFERENCES Usuario (Nome, Sobrenome, Telefone)
        ON DELETE CASCADE,
    FOREIGN KEY (Nome_Unidade)
    REFERENCES UNIDADEESCOLA (Nome_Unidade)
);

CREATE TABLE SALA(
    Nome VARCHAR(50),
    Capacidade INT,
    
    CONSTRAINT pk_sala PRIMARY KEY (Nome)
);

CREATE TABLE UNIDADEESCOLA (
    Nome_Unidade VARCHAR(50) NOT NULL,
    Cidade VARCHAR(50) NOT NULL,
    Estado VARCHAR(2) NOT NULL,
    Pais VARCHAR(30) NOT NULL,
    Bloco_Predio VARCHAR(10) NOT NULL,

    CONSTRAINT pk_unidade_escola PRIMARY KEY (Nome_Unidade)
);

CREATE TABLE DISCIPLINA (
    Nome                        VARCHAR(50)    NOT NULL,     
    Codigo_Disc                 VARCHAR(10)    NOT NULL,      
    Qntd_Aulas                  NUMERIC(2)     NOT NULL,
    Nome_Unidade                VARCHAR(50)    NOT NULL,

    CONSTRAINT pk_disciplina PRIMARY KEY (Codigo_Disc),
    CONSTRAINT fk_disc_unid_escola FOREIGN KEY (Nome_Unidade) REFERENCES UNIDADEESCOLA (Nome_Unidade)
);

CREATE TABLE PROFESSOR (
    Nome_Unidade VARCHAR(50) NOT NULL,
    Nome VARCHAR(50),
    Sobrenome VARCHAR(50),
    Telefone VARCHAR(20),
    Titulo VARCHAR(20),
    Especialidade VARCHAR (30), 
    PRIMARY KEY (Nome, Sobrenome, Telefone),
    FOREIGN KEY (Nome, Sobrenome, Telefone)
        REFERENCES Usuario (Nome, Sobrenome, Telefone)
        ON DELETE CASCADE,
    FOREIGN KEY (Nome_Unidade)
    REFERENCES UNIDADEESCOLA (Nome_Unidade)
);



CREATE TABLE RESPONSAVEL (
    Nome VARCHAR(50),
    Sobrenome VARCHAR(50),
    Telefone NUMERIC(15),
    Cod_disciplina VARCHAR(10),

    CONSTRAINT pk_responsavel PRIMARY KEY (Nome, Sobrenome, Telefone, Cod_disciplina),
    CONSTRAINT fk_resp_prof FOREIGN KEY (Nome, Sobrenome, Telefone)
        REFERENCES Professor (Nome, Sobrenome, Telefone)
        ON DELETE CASCADE,
    CONSTRAINT fk_resp_disc FOREIGN KEY(Cod_disciplina)
        REFERENCES Disciplina(Codigo_Disc)
        ON DELETE CASCADE
);

CREATE TABLE REGRA  (
    Tipo VARCHAR(50),
    CONSTRAINT pk_regra PRIMARY KEY (Tipo)
);

CREATE TABLE REGRADISCIPLINA (
    Codigo_Disc                 VARCHAR(10),      
    Tipo_Regra                  VARCHAR(50),

    CONSTRAINT pk_regra_disc PRIMARY KEY (Codigo_Disc, Tipo_Regra),
    CONSTRAINT fk_regra_disc_disc FOREIGN KEY (Codigo_Disc) REFERENCES DISCIPLINA (Codigo_Disc) ON DELETE CASCADE,
    CONSTRAINT fk_regra_disc_regra FOREIGN KEY (Tipo_Regra) REFERENCES REGRA (Tipo) ON DELETE CASCADE
);

CREATE TABLE CHEFE (
    Nome VARCHAR(50),
    Sobrenome VARCHAR(50),
    Telefone NUMERIC(15),
    CONSTRAINT pk_chefe PRIMARY KEY (Nome, Sobrenome, Telefone),
    CONSTRAINT fk_chefe_usr FOREIGN KEY (Nome, Sobrenome, Telefone)
        REFERENCES Usuario (Nome, Sobrenome, Telefone)
        ON DELETE CASCADE
);

CREATE TABLE DEPARTAMENTO (
    Codigo VARCHAR(20),
    Nome VARCHAR(50),
    Nome_Chefe VARCHAR(50),
    Sobrenome_Chefe VARCHAR(50),
    Telefone_Chefe NUMERIC(15),

    CONSTRAINT pk_departamento PRIMARY KEY(Codigo),
    CONSTRAINT fk_dpto_chefe FOREIGN KEY(Nome_Chefe, Sobrenome_Chefe, Telefone_Chefe) 
        REFERENCES CHEFE(Nome, Sobrenome, Telefone)
        ON DELETE SET NULL
);

CREATE TABLE CURSO (
    NomeCurso VARCHAR(100),
    Codigo_Curso VARCHAR(20),
    QntdAulas INT,
    Nome_Unidade VARCHAR(100),
    Codigo_Departamento VARCHAR(20),
    Vagas INT,
    Nivel VARCHAR(20),
    Ementa TEXT,
    Carga_H INT,
    CONSTRAINT pk_curso PRIMARY KEY (NomeCurso, Codigo_Curso),
    CONSTRAINT fk_curso_unid_escola FOREIGN KEY (Nome_Unidade) REFERENCES UnidadeEscola(Nome_Unidade),
    CONSTRAINT fk_curso_depto FOREIGN KEY (Codigo_Departamento) REFERENCES Departamento(Codigo)
);

CREATE TABLE ALUNOCURSO (
    NomeCurso VARCHAR(100),
    Codigo_Curso VARCHAR(20),
    Nome VARCHAR(50),
    Sobrenome VARCHAR(50),
    Telefone NUMERIC(15),
    CONSTRAINT pk_aluno_curso PRIMARY KEY (NomeCurso, Codigo_Curso, Nome, Sobrenome, Telefone),
    CONSTRAINT fk_alun_curs_disc FOREIGN KEY(NomeCurso, Codigo_Curso)
        REFERENCES Curso(NomeCurso, Codigo_Curso)
        ON DELETE CASCADE,
    CONSTRAINT fk_alun_curs_aluno FOREIGN KEY(Nome, Sobrenome, Telefone)
        REFERENCES Aluno(Nome, Sobrenome, Telefone)
        ON DELETE CASCADE
);

CREATE TABLE AUTOR(
    Nome VARCHAR(50),
    Sobrenome VARCHAR(50),
    Telefone NUMERIC(15),
    CONSTRAINT pk_autor PRIMARY KEY (Nome, Sobrenome, Telefone),
    CONSTRAINT autor_usr FOREIGN KEY (Nome, Sobrenome, Telefone)
        REFERENCES Usuario (Nome, Sobrenome, Telefone)
        ON DELETE CASCADE
);

CREATE TABLE AVALIACAO (
    Nome VARCHAR(50),
    Sobrenome VARCHAR(50),
    Telefone NUMERIC(15),
    Cod_disciplina VARCHAR(10),
    Comentario VARCHAR(140) NOT NULL,
    Didatica NUMERIC(2) NOT NULL,
    Material NUMERIC(2) NOT NULL,
    Conteudo NUMERIC(2) NOT NULL,
    Infra NUMERIC(2) NOT NULL,

    CONSTRAINT pk_avaliacao PRIMARY KEY (Nome, Sobrenome, Telefone, Cod_disciplina),
    CONSTRAINT fk_avaliacao_usr FOREIGN KEY (Nome, Sobrenome, Telefone)
        REFERENCES Usuario (Nome, Sobrenome, Telefone)
        ON DELETE CASCADE,
    CONSTRAINT fk_avaliacao_disc FOREIGN KEY(Cod_disciplina)
        REFERENCES Disciplina(Codigo_Disc)
        ON DELETE CASCADE
);

CREATE TABLE CURSODISCIPLINA (
    NomeCurso VARCHAR(100),
    Codigo_Curso VARCHAR(20),
    Codigo_Disc VARCHAR(20),
    CONSTRAINT pk_curso_disc PRIMARY KEY (NomeCurso, Codigo_Curso, Codigo_Disc),
    CONSTRAINT fk_curso_disc_disc FOREIGN KEY(Codigo_Disc)
        REFERENCES Disciplina(Codigo_Disc)
        ON DELETE CASCADE,
    CONSTRAINT fk_curso_disc_curso FOREIGN KEY(NomeCurso, Codigo_Curso)
        REFERENCES Curso(NomeCurso, Codigo_Curso)
        ON DELETE CASCADE
);

CREATE TABLE FUNCIONARIO (
    Nome VARCHAR(50),
    Sobrenome VARCHAR(50),
    Telefone NUMERIC(15),
    CONSTRAINT pk_funcionario PRIMARY KEY (Nome, Sobrenome, Telefone),
    CONSTRAINT fk_func_usr FOREIGN KEY (Nome, Sobrenome, Telefone)
        REFERENCES Usuario (Nome, Sobrenome, Telefone)
        ON DELETE CASCADE
);

CREATE TABLE INFRAESTRUTURA(
    Tipo VARCHAR(50),
    CONSTRAINT pk_infraestrutura PRIMARY KEY (Tipo)
);

CREATE TABLE INFRADISCIPLINA (
    Codigo_Disc                 VARCHAR(10),      
    Tipo_Infra                  VARCHAR(50),

    CONSTRAINT pk_infra_disc PRIMARY KEY (Codigo_Disc, Tipo_Infra),
    CONSTRAINT fk_infra_disc_disc FOREIGN KEY (Codigo_Disc) REFERENCES DISCIPLINA (Codigo_Disc) ON DELETE CASCADE,
    CONSTRAINT fk_infra_disc_infra FOREIGN KEY (Tipo_Infra) REFERENCES INFRAESTRUTURA (Tipo) ON DELETE CASCADE
);

CREATE TABLE MATERIAL (
    Tipo VARCHAR(50),
    CONSTRAINT pk_materias PRIMARY KEY (Tipo)
);


CREATE TABLE MATERIALDISCIPLINA (
    Codigo_Disc                 VARCHAR(10),      
    Tipo_Material               VARCHAR(50),

    CONSTRAINT pk_material_disc PRIMARY KEY (Codigo_Disc, Tipo_Material),
    CONSTRAINT fk_material_disc_disc FOREIGN KEY (Codigo_Disc) REFERENCES DISCIPLINA (Codigo_Disc) ON DELETE CASCADE,
    CONSTRAINT fk_material_disc_mat FOREIGN KEY (Tipo_Material) REFERENCES MATERIAL (Tipo) ON DELETE CASCADE
);

CREATE TABLE MATRICULA (
    Nome VARCHAR(50),
    Sobrenome VARCHAR(50),
    Telefone NUMERIC(15),
    Cod_disciplina VARCHAR(10),
    Dia_Matricula NUMERIC(2),
    Mes_Matricula NUMERIC(2),
    Ano_Matricula NUMERIC(4),
    Semestre NUMERIC(1) NOT NULL CHECK (Semestre IN (1, 2)),
    Ano_Letivo NUMERIC(4) NOT NULL,
    Bolsa BIT,
    Desconto DECIMAL(3,2),
    TAXA DECIMAL(7,2),

    CONSTRAINT pk_matricula PRIMARY KEY (Nome, Sobrenome, Telefone, Cod_disciplina, Dia_Matricula, Mes_Matricula, Ano_Matricula),
    CONSTRAINT fk_matricula_usr FOREIGN KEY (Nome, Sobrenome, Telefone)
        REFERENCES Usuario (Nome, Sobrenome, Telefone)
        ON DELETE CASCADE,
    CONSTRAINT fk_matricula_disc FOREIGN KEY(Cod_disciplina)
        REFERENCES Disciplina(Codigo_Disc)
        ON DELETE CASCADE
);

CREATE TABLE MATRICULANOTA (
    Nome VARCHAR(50),
    Sobrenome VARCHAR(50),
    Telefone NUMERIC(15),
    Cod_disciplina VARCHAR(10),
    Dia_Matricula NUMERIC(2),
    Mes_Matricula NUMERIC(2),
    Ano_Matricula NUMERIC(4),
    Tipo_Nota VARCHAR(20),
    Nota DECIMAL(4,2) NOT NULL CHECK(Nota <= 10.0),

    CONSTRAINT pk_matricula_nota PRIMARY KEY (Nome, Sobrenome, Telefone, Cod_disciplina, Dia_Matricula, Mes_Matricula, Ano_Matricula, Tipo_Nota),
    CONSTRAINT fk_matricula_nota_matricula FOREIGN KEY (Nome, Sobrenome, Telefone, Cod_disciplina, Dia_Matricula, Mes_Matricula, Ano_Matricula)
        REFERENCES Matricula (Nome, Sobrenome, Telefone, Cod_disciplina, Dia_Matricula, Mes_Matricula, Ano_Matricula)
        ON DELETE CASCADE
);


CREATE TABLE MENSAGEM(
    NomeA VARCHAR(50),
    SobrenomeA VARCHAR(50),
    TelefoneA NUMERIC(15),
    NomeAu VARCHAR(50),
    SobrenomeAu VARCHAR(50),
    TelefoneAu NUMERIC(15),
    TimestampM Timestamp,
    Conteudo VARCHAR(300) NOT NULL,
    CONSTRAINT pk_mensagem PRIMARY KEY (NomeA, SobrenomeA, TelefoneA, NomeAu, SobrenomeAu, TelefoneAu, TimestampM),
    CONSTRAINT fk_msg_aluno FOREIGN KEY (NomeA, SobrenomeA, TelefoneA)
        REFERENCES Aluno (Nome, Sobrenome, Telefone)
        ON DELETE CASCADE,
    CONSTRAINT fk_msg_autor FOREIGN KEY (NomeAu, SobrenomeAu, TelefoneAu)
        REFERENCES Autor (Nome, Sobrenome, Telefone)
        ON DELETE CASCADE
);

CREATE TABLE MINISTRA (
    Nome VARCHAR(50),
    Sobrenome VARCHAR(50),
    Telefone NUMERIC(15),
    Cod_disciplina VARCHAR(10),

    CONSTRAINT pk_ministra PRIMARY KEY (Nome, Sobrenome, Telefone, Cod_disciplina),
    CONSTRAINT fk_ministra_prof FOREIGN KEY (Nome, Sobrenome, Telefone)
        REFERENCES Professor (Nome, Sobrenome, Telefone)
        ON DELETE CASCADE,
    CONSTRAINT fk_ministra_disc FOREIGN KEY(Cod_disciplina)
        REFERENCES Disciplina(Codigo_Disc)
        ON DELETE CASCADE
);

CREATE TABLE PREREQCURSO (
    NomeCurso VARCHAR(100),
    CodigoCurso VARCHAR(20),
    NomeCursoPre VARCHAR(100),
    CodigoCursoPre VARCHAR(20),
    CONSTRAINT pk_pre_req_curso PRIMARY KEY (NomeCurso, CodigoCurso, NomeCursoPre, CodigoCursoPre),
    CONSTRAINT fk_pre_req_curso_curso_pre FOREIGN KEY(NomeCursoPre, CodigoCursoPre)
        REFERENCES Curso (NomeCurso, Codigo_Curso)
        ON DELETE CASCADE,
    CONSTRAINT fk_pre_req_curso_curso FOREIGN KEY(NomeCurso, CodigoCurso)
        REFERENCES Curso(NomeCurso, Codigo_Curso)
        ON DELETE CASCADE
);

CREATE TABLE PREREQDISCIPLINA (
    NomeCurso VARCHAR(100),
    CodigoCurso VARCHAR(20),
    CodigoDiscPre VARCHAR(20),
    CONSTRAINT pk_pre_req_disc PRIMARY KEY (NomeCurso, CodigoCurso, CodigoDiscPre),
    CONSTRAINT fk_pre_req_disc_disc FOREIGN KEY(CodigoDiscPre)
        REFERENCES Disciplina(Codigo_Disc)
        ON DELETE CASCADE,
    CONSTRAINT fk_pre_req_disc_curso FOREIGN KEY(NomeCurso, CodigoCurso)
        REFERENCES Curso(NomeCurso, Codigo_Curso)
        ON DELETE CASCADE
);

