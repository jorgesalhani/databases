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

SELECT 
    u.Nome,
    u.endereco_cidade,
    COUNT(DISTINCT p.id_propriedade) AS total_propriedades,
    COUNT(r.id_reserva) AS total_locacoes
FROM 
    PROPRIETARIO pr
JOIN 
    USUARIO u ON pr.CPF = u.CPF
JOIN 
    PROPRIEDADE p ON pr.CPF = p.CPF_proprietario
JOIN 
    RESERVA r ON p.id_propriedade = r.id_propriedade
GROUP BY 
    u.CPF, u.Nome, u.endereco_cidade
HAVING 
    COUNT(r.id_reserva) >= 5;


-- c. O valor médio das diárias de todas as locações que foram feitas e das que foram
-- confirmadas em cada mês para o qual exista alguma locação na base
-- ===============================================================

SELECT
    TO_CHAR(lower(dr.periodo), 'YYYY-MM') AS mes_ano,
    ROUND(AVG(r.preco_total / (upper(dr.periodo) - lower(dr.periodo))), 2) AS media_diaria
FROM
    RESERVA r
JOIN
    DATA_RESERVA dr ON r.id_reserva = dr.id_reserva
GROUP BY
    TO_CHAR(lower(dr.periodo), 'YYYY-MM')
ORDER BY
    mes_ano;


-- d. Os locatários que são mais jovens do que algum anfitrião
-- ===============================================================

SELECT DISTINCT u_hospede.nome, u_hospede.sobrenome, u_hospede.data_nascimento
FROM USUARIO u_hospede
JOIN HOSPEDE h ON u_hospede.CPF = h.CPF
WHERE u_hospede.data_nascimento > ANY (
    SELECT u_prop.data_nascimento
    FROM USUARIO u_prop
    JOIN PROPRIETARIO p ON u_prop.CPF = p.CPF
);


-- e. Os locatários que são mais jovens do que todos os anfitriões
-- ===============================================================

SELECT DISTINCT u_hospede.nome, u_hospede.sobrenome, u_hospede.data_nascimento
FROM USUARIO u_hospede
JOIN HOSPEDE h ON u_hospede.CPF = h.CPF
WHERE u_hospede.data_nascimento > ALL (
    SELECT u_prop.data_nascimento
    FROM USUARIO u_prop
    JOIN PROPRIETARIO p ON u_prop.CPF = p.CPF
);

