import re
import random
from faker import Faker
from datetime import datetime, timedelta

fake = Faker('pt_BR')

# File paths
aluno_sql_path = "sqls/b_insert_aluno.sql"
autor_sql_path = "sqls/m_insert_autor.sql"

# Regex for ALUNO: ('Nome_Unidade', 'Nome', 'Sobrenome', Telefone)
pattern_aluno = re.compile(
    r"\(\s*'[^']*'\s*,\s*'([^']*)'\s*,\s*'([^']*)'\s*,\s*(\d+)\s*\)"
)

# Regex for AUTOR: ('Nome', 'Sobrenome', Telefone)
pattern_autor = re.compile(
    r"\(\s*'([^']*)'\s*,\s*'([^']*)'\s*,\s*(\d+)\s*\)"
)

def esc(s): return s.replace("'", "''")

def extract_aluno(file_path):
    alunos = []
    with open(file_path, "r", encoding="utf-8") as f:
        content = f.read()
        matches = pattern_aluno.findall(content)
        for nome, sobrenome, telefone in matches:
            alunos.append((nome, sobrenome, telefone))
    return alunos

def extract_autor(file_path):
    autors = []
    with open(file_path, "r", encoding="utf-8") as f:
        content = f.read()
        matches = pattern_autor.findall(content)
        for nome, sobrenome, telefone in matches:
            autors.append((nome, sobrenome, telefone))
    return autors

alunos = extract_aluno(aluno_sql_path)
autors = extract_autor(autor_sql_path)

if not alunos or not autors:
    raise ValueError("Aluno or Autor data not found or empty.")

values = []
num_messages = 50000

for _ in range(num_messages):
    nome_a, sobrenome_a, telefone_a = random.choice(alunos)
    nome_au, sobrenome_au, telefone_au = random.choice(autors)
    
    # Random timestamp in last 2 years
    start_date = datetime.now() - timedelta(days=730)
    random_seconds = random.randint(0, 730*24*3600)
    timestamp = start_date + timedelta(seconds=random_seconds)
    timestamp_str = timestamp.strftime('%Y-%m-%d %H:%M:%S')
    
    # Random content ~500 chars
    content = fake.text(max_nb_chars=250)
    content = esc(content)
    
    values.append(
        f"('{esc(nome_a)}', '{esc(sobrenome_a)}', {telefone_a}, "
        f"'{esc(nome_au)}', '{esc(sobrenome_au)}', {telefone_au}, "
        f"'{timestamp_str}', '{content}')"
    )

sql_insert = """INSERT INTO MENSAGEM (
    NomeA, SobrenomeA, TelefoneA,
    NomeAu, SobrenomeAu, TelefoneAu,
    TimestampM, Conteudo
) VALUES
"""
sql_insert += ",\n".join(values) + ";"

output_path = "sqls/n_insert_mensagem.sql"
with open(output_path, "w", encoding="utf-8") as f:
    f.write(sql_insert)

print(f"Generated {num_messages} MENSAGEM rows in {output_path}")
