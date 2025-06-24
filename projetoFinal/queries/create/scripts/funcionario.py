import re
import random

N = 45000

# File paths
usuario_sql_path = "sqls/a_insert_usuario.sql"
aluno_sql_path = "sqls/b_insert_aluno.sql"
professor_sql_path = "sqls/c_insert_professor.sql"

# Regex to extract Nome, Sobrenome, Telefone from USUARIO, ALUNO, PROFESSOR
pattern_usuario = re.compile(
    r"\(\s*'([^']*)'\s*,\s*'([^']*)'\s*,\s*([0-9]+)\s*,"
)
pattern_aluno = re.compile(
    r"\(\s*'[^']*'\s*,\s*'([^']*)'\s*,\s*'([^']*)'\s*,\s*([0-9]+)\s*\)"
)
pattern_professor = re.compile(
    r"\(\s*'[^']*'\s*,\s*'([^']*)'\s*,\s*'([^']*)'\s*,\s*([0-9]+)\s*,"
)

def extract_pks(file_path, pattern):
    pks = set()
    with open(file_path, "r", encoding="utf-8") as f:
        for line in f:
            matches = pattern.findall(line)
            for nome, sobrenome, telefone_str in matches:
                telefone = int(telefone_str)
                pks.add((nome, sobrenome, telefone))
    return pks

# Load all (Nome, Sobrenome, Telefone) from USUARIO
usuario_pks = extract_pks(usuario_sql_path, pattern_usuario)

# Load ALUNO and PROFESSOR PKs to exclude
aluno_pks = extract_pks(aluno_sql_path, pattern_aluno)
professor_pks = extract_pks(professor_sql_path, pattern_professor)

# Exclude those already in ALUNO or PROFESSOR
excluded_pks = aluno_pks.union(professor_pks)
available_funcionarios = list(usuario_pks - excluded_pks)

if len(available_funcionarios) < N:
    raise ValueError(f"Not enough unique USUARIOs left for N FUNCIONARIO rows. Available: {len(available_funcionarios)}")

# Randomly select N unique FUNCIONARIOs
selected_funcionarios = random.sample(available_funcionarios, N)

def esc(s): return s.replace("'", "''")

values = []
for nome, sobrenome, telefone in selected_funcionarios:
    values.append(f"('{esc(nome)}', '{esc(sobrenome)}', {telefone})")

# Build SQL insert statement
sql_insert = "INSERT INTO FUNCIONARIO (Nome, Sobrenome, Telefone) VALUES\n"
sql_insert += ",\n".join(values) + ";"

# Save to output file
output_path = "sqls/h_insert_funcionario.sql"
with open(output_path, "w", encoding="utf-8") as f:
    f.write(sql_insert)

print(f"Generated {N} FUNCIONARIO rows in {output_path}")
