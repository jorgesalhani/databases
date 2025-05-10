-- 3.4. Mostre as locações que possuem confirmação com data de entrada a partir de 24/04/2025. Indique, para cada uma:

-- a. Todos os atributos-chave das relações envolvidas
-- ===================================================
SELECT 
    r.id_reserva, 
    r.CPF_hospede, 
    r.id_propriedade, 
    p.CPF_proprietario AS proprietario_CPF,
    h.CPF AS hospede_CPF
FROM RESERVA r
JOIN DATA_RESERVA dr ON r.id_reserva = dr.id_reserva
JOIN PROPRIEDADE p ON r.id_propriedade = p.id_propriedade
JOIN HOSPEDE h ON r.CPF_hospede = h.CPF
WHERE lower(dr.periodo) >= '2025-04-24';


-- b. O total de dias locado
-- ===================================================
SELECT 
    r.id_reserva, 
    r.CPF_hospede, 
    r.id_propriedade, 
    dr.periodo,
    (upper(dr.periodo) - lower(dr.periodo)) AS total_dias_locado
FROM RESERVA r
JOIN DATA_RESERVA dr ON r.id_reserva = dr.id_reserva
WHERE lower(dr.periodo) >= '2025-04-24';


-- c. O nome do proprietário e do hóspede
-- ===================================================
SELECT 
    r.id_reserva, 
    u_hospede.nome AS nome_hospede, 
    u_proprietario.nome AS nome_proprietario, 
    dr.periodo
FROM RESERVA r
JOIN DATA_RESERVA dr ON r.id_reserva = dr.id_reserva
JOIN PROPRIEDADE p ON r.id_propriedade = p.id_propriedade
JOIN HOSPEDE h ON r.CPF_hospede = h.CPF
JOIN USUARIO u_hospede ON h.CPF = u_hospede.CPF
JOIN USUARIO u_proprietario ON p.CPF_proprietario = u_proprietario.CPF
WHERE lower(dr.periodo) >= '2025-04-24';

-- d. O valor da diária
SELECT 
    r.id_reserva, 
    u_hospede.nome AS nome_hospede, 
    u_proprietario.nome AS nome_proprietario, 
    dr.periodo,
    p.preco_noite AS valor_diaria
FROM RESERVA r
JOIN DATA_RESERVA dr ON r.id_reserva = dr.id_reserva
JOIN PROPRIEDADE p ON r.id_propriedade = p.id_propriedade
JOIN HOSPEDE h ON r.CPF_hospede = h.CPF
JOIN USUARIO u_hospede ON h.CPF = u_hospede.CPF
JOIN USUARIO u_proprietario ON p.CPF_proprietario = u_proprietario.CPF
WHERE lower(dr.periodo) >= '2025-04-24';
