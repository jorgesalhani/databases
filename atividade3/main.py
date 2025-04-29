from engine.engine import Engine

connection = Engine('../db_config.json')
connection.connect()

queries_create_file = open('./queries/create/usuario.sql', 'r')
queries = queries_create_file.read()

result = connection.execute(query=queries)
print(result)



connection.close()