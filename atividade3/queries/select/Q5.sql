-- 3.5. Mostre:

-- a. Quais os usuários que são tanto anfitriões quanto locatários
-- ===============================================================
SELECT u.*
FROM USUARIO u
JOIN HOSPEDE h ON u.CPF = h.CPF
JOIN PROPRIETARIO p ON u.CPF = p.CPF;

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

