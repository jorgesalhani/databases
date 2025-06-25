-- Visao dos alunos matriculados no primeiro semestre de 2024 e os professores das disciplinas com sua especialidade
CREATE VIEW alunos_disciplinas_professores_20241 AS
SELECT 
    M.Nome AS Nome_Aluno,
    M.Sobrenome AS Sobrenome_Aluno,
    M.Telefone AS Telefone_Aluno,
    D.Codigo_Disc AS Cod_disciplina,
    D.Nome AS Nome_Disciplina,
    D.Nome_Unidade AS Unidade_Escola,
    P.Nome AS Nome_Professor,
    P.Sobrenome AS Sobrenome_Professor,
    P.Especialidade AS Especialidade_Professor
FROM 
    MATRICULA M
JOIN 
    DISCIPLINA D ON M.Cod_disciplina = D.Codigo_Disc
JOIN 
    MINISTRA MI ON D.Codigo_Disc = MI.Cod_disciplina
JOIN 
    PROFESSOR P ON MI.Nome = P.Nome AND MI.Sobrenome = P.Sobrenome AND MI.Telefone = P.Telefone
WHERE 
    M.Semestre = 1 AND M.Ano_Letivo = 2024;



-- visao completa do curso: disciplinas que o compõe, os professores que lecionam e outros cursos que são pre-req dele
CREATE VIEW visao_curricular_simplificada AS
SELECT
    -- Nome do curso e disciplinas que o compoe
    C.NomeCurso,
    C.Codigo_Curso,
    D.Nome AS Nome_Disciplina,
    D.Codigo_Disc AS Codigo_Disciplina,
    

    -- Pré-requisito de curso
    PRC.NomeCursoPre AS Nome_PreReq_Curso,
    PRC.CodigoCursoPre AS Codigo_PreReq_Curso,

    -- Professor que ministra
    P.Nome AS Nome_Professor,
    P.Sobrenome AS Sobrenome_Professor,
    P.Nome_Unidade AS Unidade_Professor

FROM
    CURSO C
JOIN -- junta com a tabela de curso e suas disciplinas
    CURSODISCIPLINA CD ON C.NomeCurso = CD.NomeCurso AND C.Codigo_Curso = CD.Codigo_Curso
JOIN -- junta com as tabela de disciplina
    DISCIPLINA D ON CD.Codigo_Disc = D.Codigo_Disc
JOIN --junta com a de ministra
    MINISTRA M ON D.Codigo_Disc = M.Cod_disciplina
JOIN -- pega os professores
    PROFESSOR P ON M.Nome = P.Nome AND M.Sobrenome = P.Sobrenome AND M.Telefone = P.Telefone
    -- LEFT JOIN com pré-requisitos de curso (pode nao)
LEFT JOIN
    PREREQCURSO PRC ON C.NomeCurso = PRC.NomeCurso AND C.Codigo_Curso = PRC.CodigoCurso;


-- Visão das disciplinas, suas regras, infras e materiais. Tudo com left join pq não é obrigatório ter

CREATE VIEW visao_disciplinas_complementos AS
SELECT
    D.Codigo_Disc,
    D.Nome AS Nome_Disciplina,
    D.Nome_Unidade,

    R.Tipo_Regra,
    I.Tipo_Infra,
    M.Tipo_Material

FROM
    DISCIPLINA D

-- LEFT JOIN com regras da disciplina
LEFT JOIN REGRADISCIPLINA R
    ON D.Codigo_Disc = R.Codigo_Disc

-- LEFT JOIN com infraestrutura associada
LEFT JOIN INFRADISCIPLINA I
    ON D.Codigo_Disc = I.Codigo_Disc

-- LEFT JOIN com materiais associados
LEFT JOIN MATERIALDISCIPLINA M
    ON D.Codigo_Disc = M.Codigo_Disc;