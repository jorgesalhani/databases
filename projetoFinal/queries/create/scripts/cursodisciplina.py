import re
import random

N = 50

# File paths
disciplina_sql_path = "sqls/insert_disciplina.sql"
curso_sql_path = "sqls/f_insert_curso.sql"

# Regex patterns
pattern_disciplina = re.compile(
    r"\(\s*'[^']*'\s*,\s*'([^']*)'\s*,\s*\d+\s*,\s*'[^']*'\s*\)"
)
pattern_curso = re.compile(
    r"\(\s*'([^']*)'\s*,\s*'([^']*)'\s*,\s*\d+\s*,\s*'[^']*'\s*,\s*'[^']*'\s*,"
)

def extract_disc_codigos(file_path):
    codigos = []
    with open(file_path, "r", encoding="utf-8") as f:
        for line in f:
            matches = pattern_disciplina.findall(line)
            codigos.extend(matches)
    return codigos

def extract_curso_pks(file_path):
    cursos = []
    with open(file_path, "r", encoding="utf-8") as f:
        for line in f:
            matches = pattern_curso.findall(line)
            for nome_curso, codigo_curso in matches:
                cursos.append((nome_curso, codigo_curso))
    return cursos

# Load data
disciplinas = extract_disc_codigos(disciplina_sql_path)
cursos = extract_curso_pks(curso_sql_path)

if not disciplinas or not cursos:
    raise ValueError("Missing DISCIPLINA or CURSO entries.")

values = []
used_pairs = set()

def esc(s): return s.replace("'", "''")

for cod_disc in disciplinas:
    selected_cursos = random.sample(cursos, min(N, len(cursos)))  # Up to N different Cursos
    for nome_curso, codigo_curso in selected_cursos:
        pk = (nome_curso, codigo_curso, cod_disc)
        if pk in used_pairs:
            continue
        used_pairs.add(pk)
        values.append(f"('{esc(nome_curso)}', '{esc(codigo_curso)}', '{esc(cod_disc)}')")

# Build SQL
sql_insert = """INSERT INTO CURSODISCIPLINA (
    NomeCurso, Codigo_Curso, Codigo_Disc
) VALUES
"""
sql_insert += ",\n".join(values) + ";"

# Save to output file
output_path = "sqls/g_insert_curso_disciplina.sql"
with open(output_path, "w", encoding="utf-8") as f:
    f.write(sql_insert)

print(f"Generated {len(values)} CURSODISCIPLINA rows in {output_path}")
