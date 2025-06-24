from engine.engine import Engine
import os

connection = Engine('../db_config.json')
connection.connect()

result = connection.connect()

textBox_path = './queries/create/scripts/sqls' 
for insertFile in os.listdir(textBox_path):
  queries_create_file = open(f'{textBox_path}/{insertFile}', 'r', encoding='utf-8')
  queries = queries_create_file.read()

  result = connection.execute(query=queries)
  print(result)

connection.close()