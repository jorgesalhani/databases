import re
import random

N = 5
curso_sql_path = "sqls/f_insert_curso.sql"

# Regex for extracting Curso: ('NomeCurso', 'Codigo_Curso', ...)
pattern_curso = re.compile(
    r"\(\s*'([^']*)'\s*,\s*'([^']*)'\s*,"
)

def esc(s): return s.replace("'", "''")

def extract_cursos(file_path):
    cursos = []
    with open(file_path, "r", encoding="utf-8") as f:
        content = f.read()
        matches = pattern_curso.findall(content)
        for nome_curso, cod_curso in matches:
            cursos.append((nome_curso, cod_curso))
    return cursos

cursos = extract_cursos(curso_sql_path)

if not cursos:
    raise ValueError("No CURSO entries found in insert_curso.sql")

values = set()

for nome_curso, cod_curso in cursos:
    num_prereq = random.randint(0, N)
    # Avoid course being its own prerequisite
    possible_prereqs = [c for c in cursos if c != (nome_curso, cod_curso)]
    if not possible_prereqs:
        continue
    prereqs = random.sample(possible_prereqs, min(num_prereq, len(possible_prereqs)))
    for nome_pre, cod_pre in prereqs:
        key = (nome_curso, cod_curso, nome_pre, cod_pre)
        if key not in values:
            values.add(key)

values_list = []
for nome_curso, cod_curso, nome_pre, cod_pre in values:
    values_list.append(
        f"('{esc(nome_curso)}', '{esc(cod_curso)}', '{esc(nome_pre)}', '{esc(cod_pre)}')"
    )

sql_insert = """INSERT INTO PREREQCURSO (
    NomeCurso, CodigoCurso, NomeCursoPre, CodigoCursoPre
) VALUES
"""
sql_insert += ",\n".join(values_list) + ";"

output_path = "sqls/p_insert_prereqcurso.sql"
with open(output_path, "w", encoding="utf-8") as f:
    f.write(sql_insert)

print(f"Generated {len(values_list)} PREREQCURSO rows in {output_path}")
