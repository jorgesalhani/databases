import re
import random

# File paths
aluno_sql_path = "sqls/b_insert_aluno.sql"
disciplina_sql_path = "sqls/0_insert_disciplina.sql"

# Regex to extract (Nome, Sobrenome, Telefone) from insert_aluno.sql
# Pattern to match lines like: ('Escola Técnica SSA', 'Caleb', 'da Rocha', 55619901613),
pattern_aluno = re.compile(
    r"\(\s*'[^']*'\s*,\s*'([^']*)'\s*,\s*'([^']*)'\s*,\s*(\d+)\s*\)"
)

# Regex to extract Codigo_Disc from insert_disciplina.sql
pattern_disciplina = re.compile(
    r"\(\s*'[^']*'\s*,\s*'([^']*)'\s*,\s*\d+\s*,\s*'[^']*'\s*\)"
)

def extract_aluno_pks(file_path):
    alunos = []
    with open(file_path, "r", encoding="utf-8") as f:
        content = f.read()
        matches = pattern_aluno.findall(content)
        for nome, sobrenome, telefone in matches:
            alunos.append((nome, sobrenome, telefone))
    return alunos

def extract_disc_codigos(file_path):
    codigos = []
    with open(file_path, "r", encoding="utf-8") as f:
        content = f.read()
        matches = pattern_disciplina.findall(content)
        codigos.extend(matches)
    return codigos

# Extract data
alunos = extract_aluno_pks(aluno_sql_path)
disciplinas = extract_disc_codigos(disciplina_sql_path)

if not alunos or not disciplinas:
    raise ValueError("No ALUNO or DISCIPLINA entries found.")

def esc(s): return s.replace("'", "''")

values = []

for nome, sobrenome, telefone in alunos:
    cod_disc = random.choice(disciplinas)

    # Random date between 2018 and 2024
    ano = random.randint(2018, 2024)
    mes = random.randint(1, 12)
    dia = random.randint(1, 28)

    semestre = random.choice([1, 2])
    ano_letivo = ano
    bolsa = random.choice([0, 1])
    desconto = round(random.uniform(0, 0.5), 2) if bolsa else 0.00
    taxa = round(random.uniform(100.00, 1500.00), 2)

    values.append(
        f"('{esc(nome)}', '{esc(sobrenome)}', {telefone}, '{esc(cod_disc)}', {dia}, {mes}, {ano}, {semestre}, {ano_letivo}, '{bolsa}', {desconto:.2f}, {taxa:.2f})"
    )

sql_insert = """INSERT INTO MATRICULA (
    Nome, Sobrenome, Telefone, Cod_disciplina,
    Dia_Matricula, Mes_Matricula, Ano_Matricula,
    Semestre, Ano_Letivo, Bolsa, Desconto, TAXA
) VALUES
"""
sql_insert += ",\n".join(values) + ";"

# Save to file
output_path = "sqls/k_insert_matricula.sql"
with open(output_path, "w", encoding="utf-8") as f:
    f.write(sql_insert)

print(f"Generated {len(values)} MATRICULA rows in {output_path}")
