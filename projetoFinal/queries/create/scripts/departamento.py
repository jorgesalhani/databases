import re
import random

# Path to your CHEFE insert file
chefe_sql_path = "sqls/d_insert_chefe.sql"

# Regex pattern to extract Nome, Sobrenome, Telefone from CHEFE inserts
pattern_chefe = re.compile(
    r"\(\s*'([^']*)'\s*,\s*'([^']*)'\s*,\s*([0-9]+)\s*\)"
)

def extract_chefe_keys(file_path):
    chefes = []
    with open(file_path, "r", encoding="utf-8") as f:
        for line in f:
            matches = pattern_chefe.findall(line)
            for nome, sobrenome, telefone_str in matches:
                telefone = int(telefone_str)
                chefes.append((nome, sobrenome, telefone))
    return chefes

# Extract chefes from file
chefes = extract_chefe_keys(chefe_sql_path)

if not chefes:
    raise ValueError("No CHEFE entries found in insert_chefe.sql.")

# Generate Departamento rows - One per chefe (or define how many you want)
departamento_rows = []
used_codes = set()

for idx, (nome, sobrenome, telefone) in enumerate(chefes):
    # Generate unique department code
    codigo = f"DEP{1000 + idx}"
    while codigo in used_codes:
        idx += 1
        codigo = f"DEP{1000 + idx}"
    used_codes.add(codigo)

    # Example department name generation (can adjust for your needs)
    nome_departamento = f"Departamento {idx + 1}"

    def esc(s): return s.replace("'", "''")

    departamento_rows.append(
        f"('{esc(codigo)}', '{esc(nome_departamento)}', '{esc(nome)}', '{esc(sobrenome)}', {telefone})"
    )

# Build SQL insert
sql_insert = "INSERT INTO DEPARTAMENTO (Codigo, Nome, Nome_Chefe, Sobrenome_Chefe, Telefone_Chefe) VALUES\n"
sql_insert += ",\n".join(departamento_rows) + ";"

# Save output
output_path = "sqls/e_insert_departamento.sql"
with open(output_path, "w", encoding="utf-8") as f:
    f.write(sql_insert)

print(f"Generated {len(departamento_rows)} DEPARTAMENTO rows in {output_path}")
