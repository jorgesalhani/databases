import random
import re

N = 50000

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

def esc(s): 
    return s.replace("'", "''")

usuarios_pk = set()

# Path to your USUARIO .sql file
usuario_sql_path = "sqls/a_insert_usuario.sql"

# Regex pattern to extract Nome, Sobrenome, Telefone from the VALUES tuples
pattern = re.compile(
    r"\(\s*'([^']*)'\s*,\s*'([^']*)'\s*,\s*([0-9]+)\s*,"
)

with open(usuario_sql_path, "r", encoding="utf-8") as f:
    for line in f:
        # Match only lines containing insert tuples (start with '(')
        if line.strip().startswith('('):
            matches = pattern.findall(line)
            for match in matches:
                nome, sobrenome, telefone_str = match
                telefone = int(telefone_str)
                usuarios_pk.add((nome, sobrenome, telefone))

# If you want only a subset of 80 unique entries (or less if file smaller)
usuarios_pk = list(usuarios_pk)[:N]

sql_insert_aluno = """INSERT INTO ALUNO (
    Nome_Unidade, Nome, Sobrenome, Telefone
) VALUES\n"""

values_list_aluno = []
for (nome, sobrenome, telefone) in usuarios_pk:
    unidade = random.choice(unidades)
    values_list_aluno.append(f"('{esc(unidade)}', '{esc(nome)}', '{esc(sobrenome)}', {telefone})")

sql_insert_aluno += ",\n".join(values_list_aluno) + ";"

# Save to a .sql file
output_path_aluno = "./sqls/b_insert_aluno.sql"
with open(output_path_aluno, "w", encoding="utf-8") as f:
    f.write(sql_insert_aluno)

print(f"Generated {len(usuarios_pk)} ALUNO rows from USUARIO data.")
