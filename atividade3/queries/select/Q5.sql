-- 3.5. Mostre:

-- a. Quais os usuários que são tanto anfitriões quanto locatários
-- ===============================================================
SELECT 
  usr.nome,
  usr.sobrenome,
  prop.id_propriedade,
  prop.nome AS nome_propriedade,
  res.id_reserva
FROM
  RESERVA_HOSPEDE_PROPRIEDADE as rhp
INNER JOIN
  RESERVA as res
ON
  rhp.id_reserva = res.id_reserva
INNER JOIN
  PROPRIEDADE as prop
ON
  rhp.id_propriedade = prop.id_propriedade
INNER JOIN
  USUARIO as usr
ON
  usr.CPF = res.CPF_hospede
WHERE 
  res.CPF_hospede = prop.CPF_proprietario

-- b. Quais anfitriões tiveram pelo menos 5 locações, mostrando seu nome, sua cidade e
-- quantidade de imóveis dos quais ele é dono, e o total de locações
-- ===============================================================

-- c. O valor médio das diárias de todas as locações que foram feitas e das que foram
-- confirmadas em cada mês para o qual exista alguma locação na base
-- ===============================================================

-- d. Os locatários que são mais jovens do que algum anfitrião
-- ===============================================================

-- e. Os locatários que são mais jovens do que todos os anfitriões
-- ===============================================================

