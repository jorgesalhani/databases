import re
import random

N = 50

# File paths
disciplina_sql_path = "sqls/0_insert_disciplina.sql"
curso_sql_path = "sqls/f_insert_curso.sql"

# Regex for DISCIPLINA: ('Nome', 'Codigo_Disc', qntd, 'Nome_Unidade')
pattern_disciplina = re.compile(
    r"\(\s*'[^']*'\s*,\s*'([^']*)'\s*,\s*\d+\s*,\s*'[^']*'\s*\)"
)

# Regex for CURSO: ('NomeCurso', 'Codigo_Curso', ...)
pattern_curso = re.compile(
    r"\(\s*'([^']*)'\s*,\s*'([^']*)'\s*,"
)

def esc(s): return s.replace("'", "''")

def extract_disciplinas(file_path):
    with open(file_path, "r", encoding="utf-8") as f:
        content = f.read()
        return pattern_disciplina.findall(content)

def extract_cursos(file_path):
    with open(file_path, "r", encoding="utf-8") as f:
        content = f.read()
        return pattern_curso.findall(content)

disciplinas = extract_disciplinas(disciplina_sql_path)
cursos = extract_cursos(curso_sql_path)

if not disciplinas or not cursos:
    raise ValueError("Missing data from disciplina or curso inserts.")

values = set()

for cod_disc in disciplinas:
    num_courses = random.randint(0, N)
    selected_cursos = random.sample(cursos, min(num_courses, len(cursos)))
    for nome_curso, cod_curso in selected_cursos:
        key = (nome_curso, cod_curso, cod_disc)
        if key not in values:
            values.add(key)

values_list = []
for nome_curso, cod_curso, cod_disc in values:
    values_list.append(
        f"('{esc(nome_curso)}', '{esc(cod_curso)}', '{esc(cod_disc)}')"
    )

sql_insert = """INSERT INTO PREREQDISCIPLINA (
    NomeCurso, CodigoCurso, CodigoDiscPre
) VALUES
"""
sql_insert += ",\n".join(values_list) + ";"

output_path = "sqls/q_insert_prereqdisciplina.sql"
with open(output_path, "w", encoding="utf-8") as f:
    f.write(sql_insert)

print(f"Generated {len(values_list)} PREREQDISCIPLINA rows in {output_path}")
