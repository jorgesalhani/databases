-- Todos os alunos matriculados na ma

SELECT Nome, Sobrenome, Telefone FROM Matricula 
WHERE Cod_disciplina = 'C001' AND Semestre = 2 AND Ano_Letivo = 2024;


-- Media de um semestre da aluna Ana Silva (2024/1)

SELECT AVG(Nota) AS Media_Notas
FROM MATRICULANOTA MN
JOIN MATRICULA M
  ON MN.Nome = M.Nome
  AND MN.Sobrenome = M.Sobrenome
  AND MN.Telefone = M.Telefone
  AND MN.Cod_disciplina = M.Cod_disciplina
  AND MN.Dia_Matricula = M.Dia_Matricula
  AND MN.Mes_Matricula = M.Mes_Matricula
  AND MN.Ano_Matricula = M.Ano_Matricula
WHERE MN.Nome = 'Ana'
  AND MN.Sobrenome = 'Silva'
  AND MN.Telefone = 11987654321
  AND M.Semestre = 1
  AND M.Ano_Letivo = 2024

-- 5 melhores alunos conforme media semestral de todos os anos

SELECT 
  M.Nome,
  M.Sobrenome,
  M.Telefone,
  M.Semestre,
  M.Ano_Letivo,
  AVG(MN.Nota) AS Media_Semestral
FROM MATRICULANOTA MN
JOIN MATRICULA M
  ON MN.Nome = M.Nome
  AND MN.Sobrenome = M.Sobrenome
  AND MN.Telefone = M.Telefone
  AND MN.Cod_disciplina = M.Cod_disciplina
  AND MN.Dia_Matricula = M.Dia_Matricula
  AND MN.Mes_Matricula = M.Mes_Matricula
  AND MN.Ano_Matricula = M.Ano_Matricula
GROUP BY 
  M.Nome,
  M.Sobrenome,
  M.Telefone,
  M.Semestre,
  M.Ano_Letivo
ORDER BY Media_Semestral DESC
LIMIT 5;

-- professores que lecionam matérias sobre as quais são responáveis e as disciplinas em questão:

SELECT DISTINCT
  P.Nome,
  P.Sobrenome,
  P.Telefone,
  D.Nome AS Nome_Disciplina
FROM RESPONSAVEL R
JOIN MINISTRA M
  ON R.Nome = M.Nome
  AND R.Sobrenome = M.Sobrenome
  AND R.Telefone = M.Telefone
  AND R.Cod_disciplina = M.Cod_disciplina
JOIN PROFESSOR P
  ON P.Nome = R.Nome
  AND P.Sobrenome = R.Sobrenome
  AND P.Telefone = R.Telefone
JOIN DISCIPLINA D
  ON D.Codigo_Disc = R.Cod_disciplina;

-- alunos que já cursaram uma disciplina mais de uma vez:

SELECT 
  Nome,
  Sobrenome,
  Telefone,
  Cod_disciplina,
  COUNT(*) AS Total_Matriculas
FROM MATRICULA
GROUP BY 
  Nome, 
  Sobrenome, 
  Telefone, 
  Cod_disciplina
HAVING COUNT(*) > 1;


-- alunos que completaram o curso (que não possuem disciplina no curso que nao está em matricula) FORMADOS!

SELECT 
  AC.Nome,
  AC.Sobrenome,
  AC.Telefone,
  AC.NomeCurso,
  AC.Codigo_Curso
FROM ALUNOCURSO AC
WHERE NOT EXISTS ( -- verifica se tem 1 que esta em curso e nao na selecao de matricula
  SELECT 1
  FROM CURSODISCIPLINA CD
  WHERE CD.NomeCurso = AC.NomeCurso
    AND CD.Codigo_Curso = AC.Codigo_Curso
    AND NOT EXISTS (
      SELECT 1
      FROM MATRICULA M
      WHERE M.Nome = AC.Nome
        AND M.Sobrenome = AC.Sobrenome
        AND M.Telefone = AC.Telefone
        AND M.Cod_disciplina = CD.Codigo_Disc
    )
);


-- comparacao desempenho alunos com bolsa e sem bolsa para a materia d003

SELECT 
  CASE 
    WHEN M.Bolsa = 1 THEN 'Com Bolsa'
    ELSE 'Sem Bolsa'
  END AS Situacao_Bolsa,
  AVG(N.Nota) AS Media_Notas
FROM MATRICULA M
JOIN MATRICULANOTA N
  ON M.Nome = N.Nome
  AND M.Sobrenome = N.Sobrenome
  AND M.Telefone = N.Telefone
  AND M.Cod_disciplina = N.Cod_disciplina
  AND M.Dia_Matricula = N.Dia_Matricula
  AND M.Mes_Matricula = N.Mes_Matricula
  AND M.Ano_Matricula = N.Ano_Matricula
WHERE M.Cod_disciplina = 'D003'
GROUP BY 
  CASE 
    WHEN M.Bolsa = 1 THEN 'Com Bolsa'
    ELSE 'Sem Bolsa'
  END;
