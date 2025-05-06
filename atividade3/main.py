from engine.engine import Engine

connection = Engine('../db_config.json')
connection.connect()

textBox_path = 'textBox.sql' 
queries_create_file = open(textBox_path, 'r', encoding='utf-8')
queries = queries_create_file.read()

result = connection.execute(query=queries)
# print(result)

connection.close()