import re
import random

N = 500

# Path to your insert_professor.sql file
professor_sql_path = "sqls/c_insert_professor.sql"

# Regex pattern to extract Nome, Sobrenome, Telefone from PROFESSOR inserts
pattern_professor = re.compile(
    r"\(\s*'[^']*'\s*,\s*'([^']*)'\s*,\s*'([^']*)'\s*,\s*([0-9]+)\s*,"
)

def extract_professor_keys(file_path):
    keys = []
    with open(file_path, "r", encoding="utf-8") as f:
        for line in f:
            matches = pattern_professor.findall(line)
            for nome, sobrenome, telefone_str in matches:
                telefone = int(telefone_str)
                keys.append((nome, sobrenome, telefone))
    return keys

# Extract all professor primary keys
professor_keys = extract_professor_keys(professor_sql_path)

if not professor_keys:
    raise ValueError("No professor entries found in insert_professor.sql.")

# Randomly select, for example, 20 unique CHEFE rows (or as many as available)
num_chefe_rows = min(N, len(professor_keys))
selected_chefe = random.sample(professor_keys, num_chefe_rows)

def esc(s): return s.replace("'", "''")

values = []
for nome, sobrenome, telefone in selected_chefe:
    values.append(f"('{esc(nome)}', '{esc(sobrenome)}', {telefone})")

sql_insert = "INSERT INTO CHEFE (Nome, Sobrenome, Telefone) VALUES\n"
sql_insert += ",\n".join(values) + ";"

# Save to output file
output_path = "sqls/d_insert_chefe.sql"
with open(output_path, "w", encoding="utf-8") as f:
    f.write(sql_insert)

print(f"Generated {num_chefe_rows} CHEFE rows in {output_path}")
