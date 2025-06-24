import re
import random

N = 300

# Paths to your SQL insert files
professor_sql_path = "sqls/c_insert_professor.sql"
disciplina_sql_path = "sqls/0_insert_disciplina.sql"

# Regex to extract Nome, Sobrenome, Telefone from PROFESSOR insert lines
pattern_professor = re.compile(
    r"\(\s*'[^']*'\s*,\s*'([^']*)'\s*,\s*'([^']*)'\s*,\s*([0-9]+)\s*,"
)

# Regex to extract Codigo_Disc from DISCIPLINA insert lines
pattern_disciplina = re.compile(
    r"\(\s*'[^']*'\s*,\s*'([^']*)'\s*,\s*[0-9]+\s*,\s*'[^']*'\s*\)"
)

def extract_professors(file_path):
    professors = []
    with open(file_path, "r", encoding="utf-8") as f:
        for line in f:
            matches = pattern_professor.findall(line)
            for nome, sobrenome, telefone_str in matches:
                telefone = int(telefone_str)
                professors.append((nome, sobrenome, telefone))
    return professors

def extract_disciplinas(file_path):
    codigos = []
    with open(file_path, "r", encoding="utf-8") as f:
        for line in f:
            matches = pattern_disciplina.findall(line)
            for codigo in matches:
                codigos.append(codigo)
    return codigos

# Extract data
professors = extract_professors(professor_sql_path)
disciplinas = extract_disciplinas(disciplina_sql_path)

if len(professors) == 0 or len(disciplinas) == 0:
    raise ValueError("Could not extract data from one or both files.")

# Generate N unique RESPONSAVEL rows
rows = set()
while len(rows) < N:
    prof = random.choice(professors)
    disc = random.choice(disciplinas)
    row = (*prof, disc)
    rows.add(row)

def esc(s): return s.replace("'", "''")

values = []
for nome, sobrenome, telefone, codigo_disc in rows:
    values.append(f"('{esc(nome)}', '{esc(sobrenome)}', {telefone}, '{esc(codigo_disc)}')")

sql_insert = "INSERT INTO RESPONSAVEL (Nome, Sobrenome, Telefone, Cod_disciplina) VALUES\n"
sql_insert += ",\n".join(values) + ";"

output_path = "sqls/s_insert_responsavel.sql"
with open(output_path, "w", encoding="utf-8") as f:
    f.write(sql_insert)

print(f"Generated {N} RESPONSAVEL rows in {output_path}")
