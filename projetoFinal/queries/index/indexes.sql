-- index sobre ano e semestre em matricula: muitas vezes buscamos informações de um ano e semestre em específico:
CREATE INDEX idx_matricula_periodo 
ON MATRICULA (Semestre, Ano_Letivo);
-- SELECT Nome, Sobrenome, Telefone FROM Matricula WHERE Cod_disciplina = 'BIO340' AND Semestre = 2 AND Ano_Letivo = 2024;

-- index sobre nome sobrenome e telefone em matriculanota, pesquisas de média de um aluno são frequentes
CREATE INDEX idx_usuario_estado 
ON USUARIO (Endereco_Estado);
-- SELECT 
--     A.Nome,
--     A.Sobrenome,
--     A.Telefone,
--     U.Endereco_estado
-- FROM 
--     ALUNO A
-- JOIN 
--     USUARIO U ON A.Nome = U.Nome 
--              AND A.Sobrenome = U.Sobrenome 
--              AND A.Telefone = U.Telefone
-- WHERE 
--     U.Endereco_estado <> 'MG';

-- index sobre mensagem com base no nome e sobrenome do autor, tabela com muitas linhas
CREATE INDEX idx_autor_msg 
ON MENSAGEM (NomeAu,SobrenomeAu);
-- SELECT nomea, sobrenomea, nomeau, sobrenomeau, timestampm FROM mensagem  WHERE nomeau = 'caleb' AND sobrenomeau = 'da rocha';