
-- 3.4. Mostre as locações que possuem confirmação com data de entrada a partir de 24/04/2025. Indique, para cada uma:

-- a. Todos os atributos-chave das relações envolvidas
-- ===================================================
SELECT
  *
FROM 
  Propriedade as prop
FULL OUTER JOIN 
  Reserva as res
ON
  prop.id_propriedade = res.id_propriedade
INNER JOIN
  Data_reserva as dres
ON 
  dres.id_reserva = res.id_reserva
WHERE
  dres.data_checkin > DATE ('2025-04-24');


-- b. O total de dias locado
-- ===================================================
SELECT
  *,
  dres.data_checkout - dres.data_checkin as total_dias_locados
FROM 
  Propriedade as prop
FULL OUTER JOIN 
  Reserva as res
ON
  prop.id_propriedade = res.id_propriedade
INNER JOIN
  Data_reserva as dres
ON 
  dres.id_reserva = res.id_reserva
WHERE
  dres.data_checkin > DATE ('2025-04-24');

-- c. O nome do proprietário e do hóspede
-- d. O valor da diária
-- ===================================================
SELECT
  usrHosp.nome as hospede_nome,
  usrHosp.sobrenome as hospede_sobrenome,
  usrProp.nome as proprietario_nome,
  usrProp.sobrenome as proprietario_sobrenome,
  dres.data_checkout - dres.data_checkin as total_dias_locados,
  (prop.preco_noite * (dres.data_checkout - dres.data_checkin )) + prop.taxa_limpeza as valor_diaria
FROM
  RESERVA_HOSPEDE_PROPRIEDADE as rhp
INNER JOIN
  Reserva as res
ON 
  res.id_reserva = rhp.id_reserva
INNER JOIN
  Usuario as usrHosp
ON 
  usrHosp.cpf = rhp.CPF_hospede
INNER JOIN
  Propriedade as prop
ON 
  prop.id_propriedade = rhp.id_propriedade
INNER JOIN
  Usuario as usrProp
ON 
  usrProp.cpf = prop.CPF_proprietario
INNER JOIN
  Data_reserva as dres
ON
 dres.id_reserva = res.id_reserva
where
  dres.data_checkin > DATE ('2025-04-24');

