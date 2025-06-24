import random

N = 500

# Sample list of school units (Nome_Unidade) - replace or extend as needed
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

# Sample course names (can be expanded or replaced)
course_names = [
    'Matemática Básica', 'Português I', 'História Geral', 'Geografia I', 'Física Básica',
    'Química I', 'Biologia Celular', 'Inglês Básico', 'Educação Física', 'Artes Visuais',
    'Matemática Avançada', 'Português II', 'História do Brasil', 'Geografia II', 'Física II',
    'Química Orgânica', 'Biologia Molecular', 'Inglês Intermediário', 'Educação Artística', 'Teatro',
    'Programação I', 'Banco de Dados', 'Redes de Computadores', 'Sistemas Operacionais',
    'Algoritmos', 'Lógica de Programação', 'Desenvolvimento Web', 'Matemática Financeira',
    'Física Moderna', 'Gestão de Projetos', 'Química Analítica', 'Física Experimental',
    'Literatura Brasileira', 'Ciência Política', 'Direito Constitucional', 'Sociologia',
    'Psicologia', 'Antropologia', 'Filosofia', 'Ecologia'
]

def esc(s):
    return s.replace("'", "''")

# Generate unique Codigo_Disc
def generate_code(index):
    prefix = random.choice(['MAT', 'POR', 'HIS', 'GEO', 'FIS', 'QUI', 'BIO', 'ING', 'EDF', 'ART', 'INF'])
    return f"{prefix}{100 + index}"

values = []
used_codes = set()

for i in range(N):
    nome = course_names[i % len(course_names)]
    codigo = generate_code(i)
    while codigo in used_codes:
        i += 1
        codigo = generate_code(i)
    used_codes.add(codigo)
    qntd_aulas = random.randint(20, 40)  # number of classes between 20 and 40
    unidade = random.choice(unidades)
    
    values.append(f"('{esc(nome)}', '{codigo}', {qntd_aulas}, '{esc(unidade)}')")

sql_insert = "INSERT INTO DISCIPLINA (Nome, Codigo_Disc, Qntd_Aulas, Nome_Unidade) VALUES\n"
sql_insert += ",\n".join(values) + ";"

# Save to file
output_path = "./sqls/insert_disciplina.sql"
with open(output_path, "w", encoding="utf-8") as f:
    f.write(sql_insert)

print(f"Generated {N} rows for DISCIPLINA table in {output_path}")
