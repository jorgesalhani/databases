from engine.engine import Engine

connection = Engine('../db_config.json')
connection.connect()
queries_folder = './queries'
query_action = 'select'
query = 'usuarios.sql'

sql_folder_queries = f'{queries_folder}/{query_action}/{query}'
queries_create_file = open(sql_folder_queries, 'r')
queries = queries_create_file.read()

result = connection.execute(query=queries)

connection.close()