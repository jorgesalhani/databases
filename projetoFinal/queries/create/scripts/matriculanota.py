import re
import random

N = 5

matricula_sql_path = "sqls/k_insert_matricula.sql"

# Regex to parse matricula values
# Matches tuples like:
# ('Nome', 'Sobrenome', Telefone, 'Cod_disciplina', Dia_Matricula, Mes_Matricula, Ano_Matricula, ...)
pattern_matricula = re.compile(
    r"\(\s*'([^']*)'\s*,\s*'([^']*)'\s*,\s*(\d+)\s*,\s*'([^']*)'\s*,\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)"
)

tipos_nota = ["Prova", "Trabalho", "Seminário", "Projeto", "Recuperação"]

def esc(s): return s.replace("'", "''")

matricula_entries = []

with open(matricula_sql_path, "r", encoding="utf-8") as f:
    content = f.read()
    matches = pattern_matricula.findall(content)
    for m in matches:
        # m = (Nome, Sobrenome, Telefone, Cod_disciplina, Dia_Matricula, Mes_Matricula, Ano_Matricula)
        matricula_entries.append(m)

values = []

for (nome, sobrenome, telefone, cod_disc, dia, mes, ano) in matricula_entries:
    n_grades = random.randint(1, N)  # 1 to N grades per matricula
    sampled_tipos = random.sample(tipos_nota, n_grades)
    for tipo in sampled_tipos:
        nota = round(random.uniform(0, 10), 2)
        values.append(
            f"('{esc(nome)}', '{esc(sobrenome)}', {telefone}, '{esc(cod_disc)}', {dia}, {mes}, {ano}, '{esc(tipo)}', {nota:.2f})"
        )

sql_insert = """INSERT INTO MATRICULANOTA (
    Nome, Sobrenome, Telefone, Cod_disciplina, Dia_Matricula, Mes_Matricula, Ano_Matricula, Tipo_Nota, Nota
) VALUES
"""
sql_insert += ",\n".join(values) + ";"

output_path = "sqls/l_insert_matriculanota.sql"
with open(output_path, "w", encoding="utf-8") as f:
    f.write(sql_insert)

print(f"Generated {len(values)} MATRICULANOTA rows in {output_path}")
