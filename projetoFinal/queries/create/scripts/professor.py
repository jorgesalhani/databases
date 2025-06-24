import re
import random

N = 5000

# List of UnidadeEscolar names
unidades = [
    'Escola Central SP',
    'Unidade Zona Sul RJ',
    'Centro Educacional BH',
    'Escola Técnica SSA',
    'Instituto Norte',
    'Unidade Leste SP',
    'Centro Educacional RS',
    'Unidade Centro PE',
    'Escola Oeste PR',
    'Instituto Sul RJ'
]

titles = ['Mestre', 'Doutor', 'Especialista', 'Pós-Doutor']
especialidades = ['Matemática', 'Português', 'História', 'Geografia', 'Física',
                  'Química', 'Biologia', 'Inglês', 'Educação Física', 'Artes', 'Informática', 'Administração']

def esc(s): 
    return s.replace("'", "''")

def extract_keys_from_sql(file_path, pattern):
    keys = set()
    with open(file_path, "r", encoding="utf-8") as f:
        for line in f:
            matches = pattern.findall(line)
            for match in matches:
                # match expected as a tuple, e.g. (nome, sobrenome, telefone)
                nome = match[0]
                sobrenome = match[1]
                telefone_str = match[2]
                telefone = int(telefone_str)
                keys.add((nome, sobrenome, telefone))
    return keys

# Regex to extract Nome, Sobrenome, Telefone from tuples
pattern_usuario = re.compile(
    r"\(\s*'([^']*)'\s*,\s*'([^']*)'\s*,\s*([0-9]+)\s*,"
)

pattern_aluno = re.compile(
    r"\(\s*'[^']*'\s*,\s*'([^']*)'\s*,\s*'([^']*)'\s*,\s*([0-9]+)\s*\)"
)

# Paths to your SQL files
path_usuario = "sqls/a_insert_usuario.sql"
path_aluno = "sqls/b_insert_aluno.sql"

# Extract keys from usuario and aluno SQL files
usuario_keys = extract_keys_from_sql(path_usuario, pattern_usuario)
aluno_keys = extract_keys_from_sql(path_aluno, pattern_aluno)

# Filter USUARIO keys to exclude those already in ALUNO
professor_candidates = list(usuario_keys - aluno_keys)

if len(professor_candidates) < N:
    raise ValueError(f"Not enough unique USUARIO entries outside ALUNO to generate N PROFESSOR rows. Only found {len(professor_candidates)}")

# Randomly select N unique professors
selected_professors = random.sample(professor_candidates, N)

values_list_prof = []
for nome, sobrenome, telefone in selected_professors:
    unidade = random.choice(unidades)
    titulo = random.choice(titles)
    especialidade = random.choice(especialidades)

    values_list_prof.append(
        f"('{esc(unidade)}', '{esc(nome)}', '{esc(sobrenome)}', {telefone}, "
        f"'{titulo}', '{especialidade}')"
    )

sql_insert_prof = """INSERT INTO PROFESSOR (
    Nome_Unidade, Nome, Sobrenome, Telefone, Titulo, Especialidade
) VALUES
"""
sql_insert_prof += ",\n".join(values_list_prof) + ";"

# Save to file
output_path_prof = "sqls/c_insert_professor.sql"
with open(output_path_prof, "w", encoding="utf-8") as f:
    f.write(sql_insert_prof)

print(f"Generated {N} PROFESSOR rows in {output_path_prof}")
