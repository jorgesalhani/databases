-- index sobre ano e semestre em matricula: muitas vezes buscamos informações de um ano e semestre em específico:

CREATE INDEX idx_matricula_periodo 
ON MATRICULA (Semestre, Ano_Letivo);

-- index sobre nome sobrenome e telefone em matriculanota, pesquisas de média de um aluno são frequentes

CREATE INDEX idx_matriculanota_aluno 
ON MATRICULANOTA (Nome, Sobrenome, Telefone);

CREATE INDEX idx_usuario_estado 
ON USUARIO (Endereco_Estado);

CREATE INDEX idx_autor_msg 
ON MENSAGEM (Nome_Au,SobrenomeAu);
