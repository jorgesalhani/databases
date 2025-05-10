INSERT INTO Usuario (
  CPF, Nome, Sobrenome, Telefone, Data_nascimento,
  endereco_cidade, endereco_estado, endereco_pais,
  endereco_CEP, endereco_bairro, endereco_pontoref,
  sexo, email, senha
) VALUES
(10000000001, 'Anitta', 'Machado', 21999990001, '1993-03-30', 'Rio de Janeiro', 'RJ', 'Brasil', 22041001, 'Honório Gurgel', 'Próximo à estação', 'Feminino', 'anitta@example.com', 'senha123'),
(10000000002, 'Ivete', 'Sangalo', 71999990002, '1972-05-27', 'Salvador', 'BA', 'Brasil', 40140110, 'Barra', 'Farol da Barra', 'Feminino', 'ivete@example.com', 'senha123'),
(10000000003, 'Caetano', 'Veloso', 71999990003, '1942-08-07', 'Santo Amaro', 'BA', 'Brasil', 44200000, 'Centro', 'Praça principal', 'Masculino', 'caetano@example.com', 'senha123'),
(10000000004, 'Maria', 'Bethânia', 71999990004, '1946-06-18', 'Santo Amaro', 'BA', 'Brasil', 44200001, 'Centro', 'Rua do Mercado', 'Feminino', 'bethania@example.com', 'senha123'),
(10000000005, 'Sandy', 'Leah', 19999990005, '1983-01-28', 'Campinas', 'SP', 'Brasil', 13083971, 'Barão Geraldo', 'Perto da Unicamp', 'Feminino', 'sandy@example.com', 'senha123'),
(10000000006, 'Junior', 'Lima', 19999990006, '1984-04-11', 'Campinas', 'SP', 'Brasil', 13083972, 'Taquaral', 'Lagoa do Taquaral', 'Masculino', 'junior@example.com', 'senha123'),
(10000000007, 'Daniela', 'Mercury', 71999990007, '1965-07-28', 'Salvador', 'BA', 'Brasil', 40170100, 'Pituba', 'Praça Ana Lúcia Magalhães', 'Feminino', 'daniela@example.com', 'senha123'),
(10000000008, 'Seu', 'Jorge', 21999990008, '1970-06-08', 'Rio de Janeiro', 'RJ', 'Brasil', 23020300, 'Belford Roxo', 'Rua das Palmeiras', 'Masculino', 'seujorge@example.com', 'senha123'),
(10000000009, 'Ludmilla', 'Oliveira', 21999990009, '1995-04-24', 'Duque de Caxias', 'RJ', 'Brasil', 25085130, 'Centro', 'Próx ao Shopping', 'Feminino', 'ludmilla@example.com', 'senha123'),
(10000000010, 'Ney', 'Matogrosso', 21999990010, '1941-08-01', 'Bela Vista', 'MS', 'Brasil', 79670000, 'Centro', 'Avenida Central', 'Masculino', 'ney@example.com', 'senha123'),
(10000000011, 'Fernanda', 'Montenegro', 21999990011, '1929-10-16', 'Rio de Janeiro', 'RJ', 'Brasil', 20240060, 'Flamengo', 'Aterro do Flamengo', 'Feminino', 'fernanda@example.com', 'senha123'),
(10000000012, 'Gal', 'Costa', 71999990012, '1945-09-26', 'Salvador', 'BA', 'Brasil', 40000000, 'Graça', 'Ladeira da Graça', 'Feminino', 'gal@example.com', 'senha123'),
(10000000013, 'Marisa', 'Monte', 21999990013, '1967-07-01', 'Rio de Janeiro', 'RJ', 'Brasil', 20031050, 'Botafogo', 'Rua Voluntários da Pátria', 'Feminino', 'marisa@example.com', 'senha123'),
(10000000014, 'Gilberto', 'Gil', 71999990014, '1942-06-26', 'Salvador', 'BA', 'Brasil', 40000001, 'Ondina', 'Orla marítima', 'Masculino', 'gil@example.com', 'senha123'),
(10000000015, 'Paula', 'Fernandes', 31999990015, '1984-08-28', 'Sete Lagoas', 'MG', 'Brasil', 35700000, 'Centro', 'Praça Tiradentes', 'Feminino', 'paula@example.com', 'senha123'),
(10000000016, 'Luiz', 'Melodia', 21999990016, '1951-01-07', 'Rio de Janeiro', 'RJ', 'Brasil', 20260130, 'São Cristóvão', 'Museu Nacional', 'Masculino', 'melodia@example.com', 'senha123'),
(10000000017, 'Elis', 'Regina', 51999990017, '1945-03-17', 'Porto Alegre', 'RS', 'Brasil', 90000000, 'Menino Deus', 'Rua da Cultura', 'Feminino', 'elis@example.com', 'senha123'),
(10000000018, 'Chico', 'Buarque', 21999990018, '1944-06-19', 'Rio de Janeiro', 'RJ', 'Brasil', 22290090, 'Laranjeiras', 'Próximo ao Largo do Machado', 'Masculino', 'chico@example.com', 'senha123'),
(10000000019, 'Clarice', 'Falcão', 81999990019, '1989-10-23', 'Recife', 'PE', 'Brasil', 50030000, 'Boa Vista', 'Rua do Lima', 'Feminino', 'clarice@example.com', 'senha123'),
(10000000020, 'Liniker', 'Barros', 16999990020, '1995-07-03', 'Araraquara', 'SP', 'Brasil', 14801000, 'Centro', 'Teatro Municipal', 'Outro', 'liniker@example.com', 'senha123');


INSERT INTO Proprietario (CPF, n_conta, agencia, tipo) VALUES
(10000000001, 1234567890, 1111, 'Corrente'),
(10000000002, 1234567891, 1112, 'Poupança'),
(10000000003, 1234567892, 1113, 'Corrente'),
(10000000004, 1234567893, 1114, 'Poupança'),
(10000000005, 1234567894, 1115, 'Corrente'),
(10000000006, 1234567895, 1116, 'Poupança'),
(10000000007, 1234567896, 1117, 'Corrente'),
(10000000008, 1234567897, 1118, 'Poupança'),
(10000000009, 1234567898, 1119, 'Corrente'),
(10000000010, 1234567899, 1120, 'Poupança');


INSERT INTO Propriedade (
  id_propriedade, CPF_proprietario, Nome, endereco_cidade, endereco_estado,
  endereco_pais, endereco_numero, endereco_CEP, endereco_bairro, endereco_pontoref,
  tipo, n_quartos, n_banheiros, preco_noite, max_hospedes,
  min_noites, max_noites, taxa_limpeza, datas_disp, hor_checkin, hor_checkout,
  regra1, regra2, regra3, regra4,
  comodidade1, comodidade2, comodidade3, comodidade4
) VALUES
(1, 10000000001, 'Casa do Samba', 'Salvador', 'BA', 'Brasil', 101, 40170100, 'Pelourinho', 'Próx. ao Elevador Lacerda',
 'Casa', 3, 2, 350.00, 6, 2, 15, 50.00, '2025-06-01', '14:00', '11:00',
 'Não fumar', 'Sem festas', 'Animais sob consulta', 'Silêncio após 22h',
 'Wi-Fi', 'Ar-condicionado', 'Cozinha equipada', 'TV a cabo'),

(2, 10000000002, 'Refúgio Tropical', 'Manaus', 'AM', 'Brasil', 88, 69020030, 'Centro', 'Perto do Teatro Amazonas',
 'Cabana', 2, 1, 250.00, 4, 1, 10, 40.00, '2025-06-10', '13:00', '10:00',
 'Não fumar', 'Sem visitantes', 'Pets permitidos', 'Check-out pontual',
 'Piscina', 'Wi-Fi', 'Café da manhã', 'Estacionamento'),

(3, 10000000003, 'Loft Ipanema', 'Rio de Janeiro', 'RJ', 'Brasil', 204, 22410020, 'Ipanema', 'Vista para o mar',
 'Apartamento', 1, 1, 500.00, 2, 1, 7, 60.00, '2025-07-01', '15:00', '11:00',
 'Sem festas', 'Não fumar', 'Sem crianças', 'Check-in automático',
 'Wi-Fi', 'Smart TV', 'Varanda', 'Elevador'),

(4, 10000000004, 'Chalé da Serra', 'Gramado', 'RS', 'Brasil', 17, 95670000, 'Centro', 'Perto do Lago Negro',
 'Chalé', 2, 2, 320.00, 5, 2, 10, 45.00, '2025-06-15', '14:00', '12:00',
 'Sem barulho', 'Sem festas', 'Proibido fumar', 'Pets sob consulta',
 'Lareira', 'Cozinha equipada', 'Estacionamento', 'Aquecimento'),

(5, 10000000005, 'Flat Paulista', 'São Paulo', 'SP', 'Brasil', 890, 01310000, 'Bela Vista', 'Av. Paulista - metrô próximo',
 'Apartamento', 1, 1, 400.00, 2, 1, 5, 50.00, '2025-06-20', '16:00', '11:00',
 'Sem festas', 'Check-in com documento', 'Não fumar', 'Sem visitantes',
 'Wi-Fi', 'Academia', 'Piscina', 'Ar-condicionado'),

(6, 10000000006, 'Casa Colonial', 'Ouro Preto', 'MG', 'Brasil', 56, 35400000, 'Centro Histórico', 'Ao lado do Museu da Inconfidência',
 'Casa', 4, 3, 450.00, 8, 2, 12, 55.00, '2025-06-25', '15:00', '12:00',
 'Respeitar patrimônio', 'Silêncio após 22h', 'Pets permitidos', 'Sem festas',
 'Wi-Fi', 'Cozinha equipada', 'Garagem', 'Jardim'),

(7, 10000000007, 'Eco Pousada', 'Bonito', 'MS', 'Brasil', 12, 79290000, 'Centro', 'Perto do aquário natural',
 'Pousada', 5, 5, 600.00, 10, 2, 7, 70.00, '2025-07-01', '13:00', '11:00',
 'Check-in pontual', 'Sem barulho', 'Animais permitidos', 'Sem visitas extras',
 'Piscina', 'Restaurante', 'Passeios incluídos', 'Wi-Fi'),

(8, 10000000008, 'Casa da Praia', 'Florianópolis', 'SC', 'Brasil', 333, 88058000, 'Jurerê', 'Frente para o mar',
 'Casa', 3, 3, 550.00, 7, 2, 14, 65.00, '2025-07-10', '14:00', '10:00',
 'Sem festas', 'Animais permitidos', 'Sem barulho', 'Check-in com documento',
 'Wi-Fi', 'Piscina', 'Churrasqueira', 'Jacuzzi'),

(9, 10000000009, 'Apartamento Centro SP', 'São Paulo', 'SP', 'Brasil', 155, 01001000, 'Sé', 'Próximo ao metrô Sé',
 'Apartamento', 2, 2, 300.00, 4, 1, 10, 50.00, '2025-06-18', '15:00', '11:00',
 'Sem barulho', 'Não fumar', 'Sem crianças', 'Check-in automático',
 'Wi-Fi', 'Smart TV', 'Cozinha', 'Lavadora'),

(10, 10000000010, 'Casa do Cerrado', 'Brasília', 'DF', 'Brasil', 45, 70040901, 'Asa Norte', 'Perto do Parque Nacional',
 'Casa', 3, 2, 380.00, 6, 2, 9, 48.00, '2025-06-22', '14:00', '11:00',
 'Sem festas', 'Animais sob consulta', 'Silêncio após 22h', 'Check-out até 11h',
 'Wi-Fi', 'Jardim', 'Garagem', 'Ar-condicionado');


INSERT INTO QUARTO (id_quarto, id_propriedade, tipo, qntd_cama, tipo_cama1, tipo_cama2, banheiro_priv) VALUES
(1, 1, 'Suíte Master', 2, 'Queen', 'Solteiro', TRUE),
(2, 1, 'Quarto Simples', 1, 'Solteiro', NULL, TRUE),
(3, 2, 'Cabana Familiar', 3, 'Casal', 'Solteiro', FALSE),
(4, 2, 'Cabana Individual', 1, 'Solteiro', NULL, TRUE),
(5, 3, 'Estúdio Luxo', 1, 'Queen', NULL, TRUE),
(6, 3, 'Quarto Compacto', 1, 'Solteiro', NULL, TRUE),
(7, 4, 'Chalé Romântico', 1, 'Casal', NULL, TRUE),
(8, 4, 'Chalé Família', 2, 'Casal', 'Beliche', FALSE),
(9, 5, 'Suíte Urbana', 1, 'Casal', NULL, TRUE),
(10, 5, 'Loft Executivo', 1, 'Solteiro', NULL, TRUE),
(11, 6, 'Colonial Duplo', 2, 'Solteiro', 'Solteiro', FALSE),
(12, 6, 'Colonial Casal', 1, 'Casal', NULL, TRUE),
(13, 7, 'Quarto Pousada 1', 2, 'Solteiro', 'Solteiro', FALSE),
(14, 7, 'Quarto Pousada 2', 1, 'Casal', NULL, TRUE),
(15, 8, 'Vista Mar Luxo', 1, 'Queen', NULL, TRUE),
(16, 8, 'Vista Mar Família', 3, 'Casal', 'Solteiro', FALSE),
(17, 9, 'Apartamento Compacto', 1, 'Solteiro', NULL, TRUE),
(18, 9, 'Apartamento Duplo', 2, 'Solteiro', 'Solteiro', TRUE),
(19, 10, 'Quarto Cerrado A', 2, 'Casal', 'Solteiro', FALSE),
(20, 10, 'Quarto Cerrado B', 1, 'Casal', NULL, TRUE);

INSERT INTO HOSPEDE (CPF) VALUES
(10000000001),
(10000000002),
(10000000003),
(10000000004),
(10000000005),
(10000000006),
(10000000007),
(10000000008),
(10000000009),
(10000000010),
(10000000011),
(10000000012),
(10000000013),
(10000000014),
(10000000015),
(10000000016),
(10000000017),
(10000000018),
(10000000019),
(10000000020);

INSERT INTO RESERVA (
    id_reserva, CPF_hospede, id_propriedade, n_hospedes,
    imposto, preco_total, preco_c_imposto, taxa_limpeza
) VALUES
(1, 10000000011, 1, 2, 30.00, 300.00, 330.00, 50.00),
(2, 10000000012, 2, 4, 45.00, 450.00, 495.00, 60.00),
(3, 10000000013, 3, 1, 15.00, 150.00, 165.00, 40.00),
(4, 10000000014, 4, 3, 35.00, 280.00, 315.00, 45.00),
(5, 10000000007, 5, 2, 20.00, 200.00, 220.00, 30.00),
(6, 10000000002, 6, 5, 50.00, 500.00, 550.00, 70.00),
(7, 10000000007, 7, 2, 25.00, 250.00, 275.00, 35.00),
(8, 10000000005, 8, 1, 10.00, 100.00, 110.00, 20.00),
(9, 10000000009, 6, 3, 40.00, 320.00, 360.00, 55.00),
(10, 10000000010, 10, 2, 30.00, 220.00, 250.00, 45.00),
(11, 10000000001, 5, 2, 30.00, 300.00, 330.00, 50.00),
(12, 10000000011, 4, 4, 45.00, 450.00, 495.00, 60.00),
(13, 10000000015, 9, 1, 15.00, 150.00, 165.00, 40.00),
(14, 10000000013, 8, 3, 35.00, 280.00, 315.00, 45.00),
(15, 10000000003, 3, 5, 20.00, 200.00, 220.00, 30.00),
(16, 10000000001, 3, 5, 50.00, 500.00, 550.00, 70.00);


INSERT INTO DATA_RESERVA (id_data, id_reserva, periodo) VALUES
(1, 1, daterange('2025-06-01', '2025-06-05', '[]')),
(2, 2, daterange('2025-06-10', '2025-06-15', '[]')),
(3, 3, daterange('2025-07-01', '2025-07-03', '[]')),
(4, 4, daterange('2025-07-10', '2025-07-14', '[]')),
(5, 5, daterange('2025-08-05', '2025-08-10', '[]')),
(6, 6, daterange('2025-08-15', '2025-08-20', '[]')),
(7, 7, daterange('2025-09-01', '2025-09-04', '[]')),
(8, 8, daterange('2025-09-10', '2025-09-12', '[]')),
(9, 9, daterange('2025-10-01', '2025-10-06', '[]')),
(10, 10, daterange('2025-10-15', '2025-10-20', '[]')),
(11, 11, daterange('2024-10-05', '2024-10-10', '[]')),
(12, 12, daterange('2024-10-15', '2024-11-20', '[]')),
(13, 13, daterange('2024-03-01', '2024-04-01', '[]')),
(14, 14, daterange('2025-06-15', '2025-06-21', '[]')),
(15, 15, daterange('2025-02-01', '2025-02-06', '[]')),
(16, 16, daterange('2025-01-01', '2025-01-20', '[]'));


INSERT INTO AVALIACAO (
    id_avaliacao, CPF_hospede, id_reserva,
    clas_limpeza, clas_prop, clas_comunicacao,
    clas_localizacao, clas_valor
) VALUES
(1, 10000000001, 1, 4.5, 4.7, 5.0, 4.8, 4.6),
(2, 10000000002, 2, 4.0, 4.2, 4.5, 4.3, 4.0),
(3, 10000000003, 3, 3.8, 4.0, 4.1, 4.2, 3.9),
(4, 10000000004, 4, 5.0, 5.0, 5.0, 4.9, 5.0),
(5, 10000000005, 5, 4.2, 4.3, 4.0, 4.4, 4.1);


INSERT INTO MENSAGEM (
    id_mensagem, CPF_remetente, CPF_destinatario,
    data_envio, hora_envio, conteudo
) VALUES
(1, 10000000001, 10000000002, '2025-04-01', '08:15:00', 'Olá! Tudo bem?'),
(2, 10000000002, 10000000001, '2025-04-01', '08:17:00', 'Oi! Tudo ótimo e você?'),
(3, 10000000003, 10000000004, '2025-04-02', '09:00:00', 'A propriedade ainda está disponível?'),
(4, 10000000004, 10000000003, '2025-04-02', '09:05:00', 'Sim, disponível para as datas desejadas.'),
(5, 10000000005, 10000000006, '2025-04-03', '10:20:00', 'Qual o horário de check-in?'),
(6, 10000000006, 10000000005, '2025-04-03', '10:22:00', 'A partir das 14h.'),
(7, 10000000007, 10000000008, '2025-04-04', '11:30:00', 'Tem estacionamento disponível?'),
(8, 10000000008, 10000000007, '2025-04-04', '11:32:00', 'Sim, tem garagem coberta.'),
(9, 10000000009, 10000000010, '2025-04-05', '12:00:00', 'O imóvel é pet-friendly?'),
(10, 10000000010, 10000000009, '2025-04-05', '12:05:00', 'Aceitamos pets pequenos.'),
(11, 10000000011, 10000000012, '2025-04-06', '13:00:00', 'Posso cancelar com reembolso?'),
(12, 10000000012, 10000000011, '2025-04-06', '13:05:00', 'Sim, com 48h de antecedência.'),
(13, 10000000013, 10000000014, '2025-04-07', '14:15:00', 'Qual o endereço completo?'),
(14, 10000000014, 10000000013, '2025-04-07', '14:17:00', 'Avenida das Palmeiras, 123.'),
(15, 10000000015, 10000000016, '2025-04-08', '15:30:00', 'Tem ar-condicionado nos quartos?'),
(16, 10000000016, 10000000015, '2025-04-08', '15:35:00', 'Sim, todos os quartos têm.'),
(17, 10000000017, 10000000018, '2025-04-09', '16:00:00', 'O Wi-Fi é rápido?'),
(18, 10000000018, 10000000017, '2025-04-09', '16:02:00', 'Sim, fibra óptica 300mb.'),
(19, 10000000019, 10000000020, '2025-04-10', '17:00:00', 'O local é silencioso à noite?'),
(20, 10000000020, 10000000019, '2025-04-10', '17:05:00', 'Sim, bairro tranquilo.'),
(21, 10000000001, 10000000003, '2025-04-11', '18:10:00', 'Posso levar mais um hóspede?'),
(22, 10000000003, 10000000001, '2025-04-11', '18:15:00', 'Sim, até o limite permitido.'),
(23, 10000000005, 10000000007, '2025-04-12', '19:00:00', 'Vocês oferecem toalhas?'),
(24, 10000000007, 10000000005, '2025-04-12', '19:03:00', 'Sim, inclusas na estadia.'),
(25, 10000000009, 10000000011, '2025-04-13', '20:00:00', 'Tem padaria próxima?'),
(26, 10000000011, 10000000009, '2025-04-13', '20:05:00', 'Sim, a duas quadras.'),
(27, 10000000013, 10000000015, '2025-04-14', '21:00:00', 'Tem churrasqueira?'),
(28, 10000000015, 10000000013, '2025-04-14', '21:04:00', 'Tem sim, no quintal.'),
(29, 10000000017, 10000000019, '2025-04-15', '22:00:00', 'Qual a voltagem da casa?'),
(30, 10000000019, 10000000017, '2025-04-15', '22:05:00', 'É 220v padrão.');

INSERT INTO IMAGEM (id_imagem, id_avaliacao, conteudo) VALUES
(1, 1, NULL),
(2, 2, NULL),
(3, 3, NULL),
(4, 4, NULL),
(5, 5, NULL);

INSERT INTO RESERVA_HOSPEDE_PROPRIEDADE (CPF_hospede, id_propriedade, id_reserva) VALUES
(10000000001, 1, 1),
(10000000002, 2, 2),
(10000000003, 3, 3),
(10000000004, 4, 4),
(10000000005, 5, 5),
(10000000006, 6, 6),
(10000000007, 7, 7),
(10000000008, 8, 8),
(10000000009, 9, 9),
(10000000010, 10, 10),
(10000000001, 5, 11),
(10000000011, 4, 12),
(10000000015, 9, 13),
(10000000013, 8, 14),
(10000000003, 3, 15),
(10000000001, 3, 16);

