-- 3.3. Mostre o conteúdo feito para a relação que implementa o conceito de Propriedades do sistema:

-- ● Mostre a relação inteira.
-- SELECT 
--  * 
-- FROM 
--  Propriedade

-- ● Mostre quantas Propriedades existem de cada categoria 
-- (casa inteira, quarto individual, etc.)
-- SELECT 
--   tipo, COUNT(DISTINCT tipo) as qtd_tipo
-- FROM 
--   Propriedade
-- GROUP BY tipo

-- ● Mostre quantas Propriedades existem de cada Cidade.
-- SELECT
--   endereco_cidade, COUNT(DISTINCT endereco_cidade) as qtd_cidade
-- FROM  
--   Propriedade
-- GROUP BY endereco_cidade