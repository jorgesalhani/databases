from faker import Faker
import random

N = 100000

fake = Faker('pt_BR')

emails = set()
primary_keys = set()

genders = ['Masculino', 'Feminino', 'Outro']

sql_insert = """INSERT INTO USUARIO (
    Nome, Sobrenome, Telefone, Dia_Nascimento, Mes_Nascimento, Ano_Nascimento,
    Endereco_cidade, Endereco_estado, Endereco_pais, Endereco_CEP,
    Endereco_bairro, Endereco_rua, Sexo, Email, Senha
) VALUES\n"""

values_list = []

while len(values_list) < N:
    nome = fake.first_name()
    sobrenome = fake.last_name()
    telefone = int(fake.msisdn()[0:11])
    dia_nasc = random.randint(1, 28)
    mes_nasc = random.randint(1, 12)
    ano_nasc = random.randint(1970, 2005)

    cidade = fake.city()
    estado = fake.estado_sigla()
    pais = 'Brasil'
    cep = int(fake.postcode().replace('-', '')[:8])
    bairro = fake.bairro()
    rua = fake.street_name()
    sexo = random.choice(genders)

    email_base = f"{nome.lower()}.{sobrenome.lower()}{random.randint(1, 9999)}@email.com"
    while email_base in emails:
        email_base = f"{nome.lower()}.{sobrenome.lower()}{random.randint(1, 99999)}@email.com"
    emails.add(email_base)

    pk = (nome, sobrenome, telefone)
    if pk in primary_keys:
        continue
    primary_keys.add(pk)

    # Escape single quotes in strings
    def esc(s): return s.replace("'", "''")

    values_list.append(f"('{esc(nome)}', '{esc(sobrenome)}', {telefone}, {dia_nasc}, {mes_nasc}, {ano_nasc}, "
                       f"'{esc(cidade)}', '{estado}', '{pais}', {cep}, "
                       f"'{esc(bairro)}', '{esc(rua)}', '{sexo}', '{email_base}', 'senha123')")

sql_insert += ",\n".join(values_list) + ";"

# Save to a .sql file
output_path = "./sqls/a_insert_usuario.sql"
with open(output_path, "w", encoding="utf-8") as f:
    f.write(sql_insert)

