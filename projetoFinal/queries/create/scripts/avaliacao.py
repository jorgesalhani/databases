import re
import random
from faker import Faker

N = 5000

fake = Faker('pt_BR')

# File paths
aluno_sql_path = "sqls/insert_aluno.sql"
disciplina_sql_path = "sqls/insert_disciplina.sql"

# Regex patterns
pattern_aluno = re.compile(
    r"\(\s*'[^']*'\s*,\s*'([^']*)'\s*,\s*'([^']*)'\s*,\s*([0-9]+)\s*\)"
)
pattern_disciplina = re.compile(
    r"\(\s*'[^']*'\s*,\s*'([^']*)'\s*,\s*[0-9]+\s*,\s*'[^']*'\s*\)"
)

def extract_aluno_pks(file_path):
    alunos = []
    with open(file_path, "r", encoding="utf-8") as f:
        for line in f:
            matches = pattern_aluno.findall(line)
            for nome, sobrenome, telefone_str in matches:
                telefone = int(telefone_str)
                alunos.append((nome, sobrenome, telefone))
    return alunos

def extract_disc_codigos(file_path):
    codigos = []
    with open(file_path, "r", encoding="utf-8") as f:
        for line in f:
            matches = pattern_disciplina.findall(line)
            codigos.extend(matches)
    return codigos

# Load data
alunos = extract_aluno_pks(aluno_sql_path)
disciplinas = extract_disc_codigos(disciplina_sql_path)

if not alunos or not disciplinas:
    raise ValueError("Missing ALUNO or DISCIPLINA entries.")

# Generate N rows (allowing duplicates of alunos across different disciplines)
avaliacoes = set()
values = []

def esc(s): return s.replace("'", "''")

while len(values) < N:
    nome, sobrenome, telefone = random.choice(alunos)
    cod_disc = random.choice(disciplinas)

    pk = (nome, sobrenome, telefone, cod_disc)
    if pk in avaliacoes:
        continue  # Ensure PK uniqueness
    avaliacoes.add(pk)

    comentario = fake.sentence(nb_words=10)[:140]
    didatica = random.randint(1, 10)
    material = random.randint(1, 10)
    conteudo = random.randint(1, 10)
    infra = random.randint(1, 10)

    values.append(
        f"('{esc(nome)}', '{esc(sobrenome)}', {telefone}, '{esc(cod_disc)}', "
        f"'{esc(comentario)}', {didatica}, {material}, {conteudo}, {infra})"
    )

# Build SQL
sql_insert = """INSERT INTO AVALIACAO (
    Nome, Sobrenome, Telefone, Cod_disciplina, Comentario, Didatica, Material, Conteudo, Infra
) VALUES
"""
sql_insert += ",\n".join(values) + ";"

# Save to file
output_path = "sqls/insert_avaliacao.sql"
with open(output_path, "w", encoding="utf-8") as f:
    f.write(sql_insert)

print(f"Generated {len(values)} AVALIACAO rows in {output_path}")
