import re
import random

# File paths
disciplina_sql_path = "sqls/insert_disciplina.sql"
infra_sql_path = "sqls/insert_infraestrutura.sql"

# Regex patterns
pattern_disciplina = re.compile(
    r"\(\s*'[^']*'\s*,\s*'([^']*)'\s*,\s*\d+\s*,\s*'[^']*'\s*\)"
)
pattern_infra = re.compile(
    r"\(\s*'([^']*)'\s*\)"
)

def extract_disc_codigos(file_path):
    codigos = []
    with open(file_path, "r", encoding="utf-8") as f:
        for line in f:
            matches = pattern_disciplina.findall(line)
            codigos.extend(matches)
    return codigos

def extract_infra_tipos(file_path):
    tipos = []
    with open(file_path, "r", encoding="utf-8") as f:
        for line in f:
            matches = pattern_infra.findall(line)
            tipos.extend(matches)
    return tipos

# Extract data
disciplinas = extract_disc_codigos(disciplina_sql_path)
infra_tipos = extract_infra_tipos(infra_sql_path)

if not disciplinas or not infra_tipos:
    raise ValueError("Missing DISCIPLINA or INFRAESTRUTURA entries.")

values = []
used_pairs = set()

def esc(s): return s.replace("'", "''")

for cod_disc in disciplinas:
    selected_infra = random.sample(infra_tipos, min(3, len(infra_tipos)))
    for tipo_infra in selected_infra:
        pk = (cod_disc, tipo_infra)
        if pk in used_pairs:
            continue
        used_pairs.add(pk)
        values.append(f"('{esc(cod_disc)}', '{esc(tipo_infra)}')")

# Build SQL insert
sql_insert = """INSERT INTO INFRADISCIPLINA (
    Codigo_Disc, Tipo_Infra
) VALUES
"""
sql_insert += ",\n".join(values) + ";"

# Save to file
output_path = "sqls/i_insert_infradisciplina.sql"
with open(output_path, "w", encoding="utf-8") as f:
    f.write(sql_insert)

print(f"Generated {len(values)} INFRADISCIPLINA rows in {output_path}")
