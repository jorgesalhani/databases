import random

N = 500

# Example base rule types to generate variants
base_rules = [
    "Regra de Matrícula",
    "Regra de Frequência",
    "Regra de Avaliação",
    "Regra de Comportamento",
    "Regra de Disciplina",
    "Regra de Reprovação",
    "Regra de Aprovação",
    "Regra de Transferência",
    "Regra de Cancelamento",
    "Regra de Frequência Mínima",
    "Regra de Nota Mínima",
    "Regra de Prova Final",
    "Regra de Trabalho de Conclusão",
    "Regra de Estágio",
    "Regra de Atividades Complementares"
]

# To reach N unique rows, we'll add suffixes like 'I', 'II', ... or numbers
suffixes = ["I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X", "XI", "XII", "XIII", "XIV", "XV"]

tipos = []

for base_rule in base_rules:
    for suffix in suffixes:
        tipos.append(f"{base_rule} {suffix}")
        if len(tipos) >= N:
            break
    if len(tipos) >= N:
        break

# Build SQL insert statement
sql_insert = "INSERT INTO REGRA (Tipo) VALUES\n"
sql_insert += ",\n".join([f"('{tipo}')" for tipo in tipos])
sql_insert += ";"

# Save to file
output_path = "sqls/0_insert_regra.sql"
with open(output_path, "w", encoding="utf-8") as f:
    f.write(sql_insert)

print(f"Generated {N} REGRA rows in {output_path}")
