import re
import random

N = 100

# Paths to your existing .sql files
departamento_sql_path = "sqls/e_insert_departamento.sql"
unidade_sql_path = "sqls/insert_unidadeescola.sql"

# Regex to extract Departamento Codigo
pattern_departamento = re.compile(
    r"\(\s*'([^']*)'\s*,\s*'[^']*'\s*,\s*'[^']*'\s*,\s*'[^']*'\s*,\s*[0-9]+\s*\)"
)

# Regex to extract UnidadeEscolar Nome_Unidade
pattern_unidade = re.compile(
    r"\(\s*'([^']*)'\s*,\s*'[^']*'\s*,\s*'[^']*'\s*,\s*'[^']*'\s*,\s*'[^']*'\s*\)"
)

def extract_departamento_codigos(file_path):
    codigos = []
    with open(file_path, "r", encoding="utf-8") as f:
        for line in f:
            matches = pattern_departamento.findall(line)
            codigos.extend(matches)
    return codigos

def extract_unidades(file_path):
    unidades = []
    with open(file_path, "r", encoding="utf-8") as f:
        for line in f:
            matches = pattern_unidade.findall(line)
            unidades.extend(matches)
    return unidades

# Load existing Departamento codes and UnidadeEscolar names
departamento_codigos = extract_departamento_codigos(departamento_sql_path)
unidades = extract_unidades(unidade_sql_path)

if not departamento_codigos or not unidades:
    raise ValueError("Missing departamento codes or unidade names in provided files.")

# Predefined course levels and sample course areas
niveis = ['Graduação', 'Pós-graduação', 'Tecnólogo', 'Técnico', 'Mestrado']
areas_curso = ['Administração', 'Engenharia', 'Matemática', 'História', 'Biologia', 
               'Informática', 'Letras', 'Educação Física', 'Física', 'Química']

curso_rows = []
used_codes = set()

def esc(s): return s.replace("'", "''")

for i in range(N):
    nome_unidade = random.choice(unidades)
    codigo_departamento = random.choice(departamento_codigos)
    area = random.choice(areas_curso)
    nivel = random.choice(niveis)

    nome_curso = f"Curso de {area} {nivel} {i+1}"
    
    # Unique course code generation
    codigo_curso = f"CUR{i+1000}"
    while codigo_curso in used_codes:
        i += 1
        codigo_curso = f"CUR{i+1000}"
    used_codes.add(codigo_curso)

    qntd_aulas = random.randint(20, 100)
    vagas = random.randint(30, 100)
    carga_h = random.randint(100, 400)
    ementa = f"Ementa do curso de {area} {nivel}"

    curso_rows.append(
        f"('{esc(nome_curso)}', '{esc(codigo_curso)}', {qntd_aulas}, '{esc(nome_unidade)}', "
        f"'{esc(codigo_departamento)}', {vagas}, '{esc(nivel)}', '{esc(ementa)}', {carga_h})"
    )

sql_insert = """INSERT INTO CURSO (
    NomeCurso, Codigo_Curso, QntdAulas, Nome_Unidade, Codigo_Departamento, Vagas, Nivel, Ementa, Carga_H
) VALUES
"""
sql_insert += ",\n".join(curso_rows) + ";"

output_path = "sqls/f_insert_curso.sql"
with open(output_path, "w", encoding="utf-8") as f:
    f.write(sql_insert)

print(f"Generated {N} CURSO rows in {output_path}")
