import re
import random

N = 80

# Paths to your input .sql files
regra_sql_path = "sqls/0_insert_regra.sql"
disciplina_sql_path = "sqls/0_insert_disciplina.sql"

# Regex to extract Tipo from REGRA insert lines
pattern_regra = re.compile(r"\(\s*'([^']+)'\s*\)")

# Regex to extract Codigo_Disc from DISCIPLINA insert lines
pattern_disciplina = re.compile(r"\(\s*'[^']*'\s*,\s*'([^']+)'\s*,\s*[0-9]+\s*,\s*'[^']*'\s*\)")

def extract_regra_tipos(file_path):
    tipos = []
    with open(file_path, "r", encoding="utf-8") as f:
        for line in f:
            matches = pattern_regra.findall(line)
            tipos.extend(matches)
    return tipos

def extract_disciplinas(file_path):
    codigos = []
    with open(file_path, "r", encoding="utf-8") as f:
        for line in f:
            matches = pattern_disciplina.findall(line)
            codigos.extend(matches)
    return codigos

# Extract available Tipo_Regra and Codigo_Disc
tipos_regra = extract_regra_tipos(regra_sql_path)
disciplinas = extract_disciplinas(disciplina_sql_path)

if not tipos_regra or not disciplinas:
    raise ValueError("Could not find REGRA or DISCIPLINA entries in the provided files.")

rows = set()

# Generate 4 unique (Codigo_Disc, Tipo_Regra) pairs
while len(rows) < N:
    cod_disc = random.choice(disciplinas)
    tipo_regra = random.choice(tipos_regra)
    rows.add((cod_disc, tipo_regra))

def esc(s): return s.replace("'", "''")

values = []
for cod_disc, tipo_regra in rows:
    values.append(f"('{esc(cod_disc)}', '{esc(tipo_regra)}')")

sql_insert = "INSERT INTO REGRADISCIPLINA (Codigo_Disc, Tipo_Regra) VALUES\n"
sql_insert += ",\n".join(values) + ";"

# Save to file
output_path = "sqls/r_insert_regradisciplina.sql"
with open(output_path, "w", encoding="utf-8") as f:
    f.write(sql_insert)

print(f"Generated {N} REGRADISCIPLINA rows in {output_path}")
