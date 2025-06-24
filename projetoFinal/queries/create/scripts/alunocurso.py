import re
import random

# Paths to your existing SQL files
aluno_sql_path = "sqls/a_insert_aluno.sql"
curso_sql_path = "sqls/insert_curso.sql"

# Regex to extract Nome, Sobrenome, Telefone from ALUNO inserts
pattern_aluno = re.compile(
    r"\(\s*'[^']*'\s*,\s*'([^']*)'\s*,\s*'([^']*)'\s*,\s*([0-9]+)\s*\)"
)

# Regex to extract NomeCurso, Codigo_Curso from CURSO inserts
pattern_curso = re.compile(
    r"\(\s*'([^']*)'\s*,\s*'([^']*)'\s*,\s*[0-9]+\s*,\s*'[^']*'\s*,\s*'[^']*'\s*,\s*[0-9]+\s*,\s*'[^']*'\s*,\s*'[^']*'\s*,\s*[0-9]+\s*\)"
)

def extract_aluno_pks(file_path):
    alunos = []
    with open(file_path, "r", encoding="utf-8") as f:
        for line in f:
            matches = pattern_aluno.findall(line)
            for nome, sobrenome, telefone_str in matches:
                telefone = int(telefone_str)
                alunos.append((nome, sobrenome, telefone))
    return alunos

def extract_curso_pks(file_path):
    cursos = []
    with open(file_path, "r", encoding="utf-8") as f:
        for line in f:
            matches = pattern_curso.findall(line)
            for nome_curso, codigo_curso in matches:
                cursos.append((nome_curso, codigo_curso))
    return cursos

# Extract data
alunos = extract_aluno_pks(aluno_sql_path)
cursos = extract_curso_pks(curso_sql_path)

if not alunos or not cursos:
    raise ValueError("Missing ALUNO or CURSO entries in the provided files.")

rows = []

def esc(s): return s.replace("'", "''")

for nome, sobrenome, telefone in alunos:
    nome_curso, codigo_curso = random.choice(cursos)
    rows.append(
        f"('{esc(nome_curso)}', '{esc(codigo_curso)}', '{esc(nome)}', '{esc(sobrenome)}', {telefone})"
    )

# Build final SQL
sql_insert = """INSERT INTO ALUNOCURSO (
    NomeCurso, Codigo_Curso, Nome, Sobrenome, Telefone
) VALUES
"""
sql_insert += ",\n".join(rows) + ";"

output_path = "sqls/insert_aluno_curso.sql"
with open(output_path, "w", encoding="utf-8") as f:
    f.write(sql_insert)

print(f"Generated {len(rows)} ALUNOCURSO rows in {output_path}")
