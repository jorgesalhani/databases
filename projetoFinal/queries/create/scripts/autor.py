import re
import random

N = 1000

# Paths to existing .sql files
funcionario_sql_path = "sqls/h_insert_funcionario.sql"
professor_sql_path = "sqls/c_insert_professor.sql"

# Regex pattern to extract (Nome, Sobrenome, Telefone)
pattern_funcionario = re.compile(
    r"\(\s*'([^']*)'\s*,\s*'([^']*)'\s*,\s*([0-9]+)\s*\)"
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

# Extract from both files
funcionario_pks = extract_pks(funcionario_sql_path, pattern_funcionario)
professor_pks = extract_pks(professor_sql_path, pattern_professor)

# Combine both sets
available_autor_pks = list(funcionario_pks.union(professor_pks))

if len(available_autor_pks) < N:
    raise ValueError(f"Not enough unique FUNCIONARIO + PROFESSOR rows for {N} AUTOR entries. Available: {len(available_autor_pks)}")

# Randomly select N unique authors
selected_autors = random.sample(available_autor_pks, N)

def esc(s): return s.replace("'", "''")

# Build values
values = []
for nome, sobrenome, telefone in selected_autors:
    values.append(f"('{esc(nome)}', '{esc(sobrenome)}', {telefone})")

# Build SQL insert
sql_insert = "INSERT INTO AUTOR (Nome, Sobrenome, Telefone) VALUES\n"
sql_insert += ",\n".join(values) + ";"

# Save to file
output_path = "sqls/m_insert_autor.sql"
with open(output_path, "w", encoding="utf-8") as f:
    f.write(sql_insert)

print(f"Generated N AUTOR rows in {output_path}")
