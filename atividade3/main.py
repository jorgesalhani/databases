from engine.engine import Engine

connection = Engine('../db_config.json')
connection.connect()

result = connection.connect()
print(result)

textBox_path = '/home/catarinamoreiralima/Área de trabalho/Facul/bd/databases/atividade3/queries/select/Q4.sql' 
queries_create_file = open(textBox_path, 'r', encoding='utf-8')
queries = queries_create_file.read()

result = connection.execute(query=queries)
print(result)

connection.close()