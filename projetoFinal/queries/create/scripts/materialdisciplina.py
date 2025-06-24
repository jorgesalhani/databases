import re
import random

N = 50

# File paths
disciplina_sql_path = "sqls/0_insert_disciplina.sql"
material_sql_path = "sqls/0_insert_material.sql"

# Regex patterns to extract Codigo_Disc and Tipo_Material
pattern_disciplina = re.compile(
    r"\(\s*'[^']*'\s*,\s*'([^']*)'\s*,\s*\d+\s*,\s*'[^']*'\s*\)"
)
pattern_material = re.compile(
    r"\(\s*'([^']*)'\s*\)"
)

def extract_disc_codigos(file_path):
    codigos = []
    with open(file_path, "r", encoding="utf-8") as f:
        for line in f:
            matches = pattern_disciplina.findall(line)
            codigos.extend(matches)
    return codigos

def extract_material_tipos(file_path):
    tipos = []
    with open(file_path, "r", encoding="utf-8") as f:
        for line in f:
            matches = pattern_material.findall(line)
            tipos.extend(matches)
    return tipos

# Extract data
disciplinas = extract_disc_codigos(disciplina_sql_path)
materiais = extract_material_tipos(material_sql_path)

if not disciplinas or not materiais:
    raise ValueError("Missing DISCIPLINA or MATERIAL entries.")

values = []
used_pairs = set()

def esc(s): return s.replace("'", "''")

for cod_disc in disciplinas:
    # Pick N random materials for each discipline
    selected_materiais = random.sample(materiais, min(N, len(materiais)))
    for tipo_mat in selected_materiais:
        pk = (cod_disc, tipo_mat)
        if pk in used_pairs:
            continue
        used_pairs.add(pk)
        values.append(f"('{esc(cod_disc)}', '{esc(tipo_mat)}')")

# Build SQL insert
sql_insert = """INSERT INTO MATERIALDISCIPLINA (
    Codigo_Disc, Tipo_Material
) VALUES
"""
sql_insert += ",\n".join(values) + ";"

# Save to file
output_path = "sqls/j_insert_materialdisciplina.sql"
with open(output_path, "w", encoding="utf-8") as f:
    f.write(sql_insert)

print(f"Generated {len(values)} MATERIALDISCIPLINA rows in {output_path}")
