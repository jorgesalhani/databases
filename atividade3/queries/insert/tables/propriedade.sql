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
