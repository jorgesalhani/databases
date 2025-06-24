import re
import random

N = 50

# File paths
disciplina_sql_path = "sqls/0_insert_disciplina.sql"
professor_sql_path = "sqls/c_insert_professor.sql"

# Regex to extract Codigo_Disc from DISCIPLINA inserts: ('Nome', 'Codigo_Disc', qntd, 'Nome_Unidade')
pattern_disciplina = re.compile(
    r"\(\s*'[^']*'\s*,\s*'([^']*)'\s*,\s*\d+\s*,\s*'[^']*'\s*\)"
)

# Regex to extract professors: ('Nome_Unidade', 'Nome', 'Sobrenome', Telefone, ...)
pattern_professor = re.compile(
    r"\(\s*'[^']*'\s*,\s*'([^']*)'\s*,\s*'([^']*)'\s*,\s*(\d+)"
)

def esc(s): return s.replace("'", "''")

def extract_disciplinas(file_path):
    codigos = []
    with open(file_path, "r", encoding="utf-8") as f:
        content = f.read()
        codigos = pattern_disciplina.findall(content)
    return codigos

def extract_professores(file_path):
    profs = []
    with open(file_path, "r", encoding="utf-8") as f:
        content = f.read()
        matches = pattern_professor.findall(content)
        for nome, sobrenome, telefone in matches:
            profs.append((nome, sobrenome, telefone))
    return profs

disciplinas = extract_disciplinas(disciplina_sql_path)
professores = extract_professores(professor_sql_path)

if not disciplinas or not professores:
    raise ValueError("No DISCIPLINA or PROFESSOR data found.")

values = []

for codigo in disciplinas:
    n_profs = random.randint(2, N)
    sampled_profs = random.sample(professores, n_profs)
    for nome, sobrenome, telefone in sampled_profs:
        values.append(
            f"('{esc(nome)}', '{esc(sobrenome)}', {telefone}, '{esc(codigo)}')"
        )

sql_insert = """INSERT INTO MINISTRA (
    Nome, Sobrenome, Telefone, Cod_disciplina
) VALUES
"""
sql_insert += ",\n".join(values) + ";"

output_path = "sqls/o_insert_ministra.sql"
with open(output_path, "w", encoding="utf-8") as f:
    f.write(sql_insert)

print(f"Generated {len(values)} MINISTRA rows in {output_path}")
