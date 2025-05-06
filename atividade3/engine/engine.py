from psycopg2.extras import LoggingConnection
import json
import os
import re

class Engine:
  def __init__(self, config_path: str, log_root_path: str = '.logs', log_filename: str = 'db.log', result_filename: str = 'results.json'):
    """
    @params
      config_path: caminho para arquivo de configurações de DB
      log_path: [db.log] caminho para arquivo de logs de DB
    """
    if not os.path.exists(log_root_path):
      os.makedirs(log_root_path)

    self.config_path = config_path
    self.log_path = f'{log_root_path}/{log_filename}'
    self.result_path = f'{log_root_path}/{result_filename}'
    self.connection : LoggingConnection = None


  def connect(self):
    if not os.path.exists(self.config_path):
      raise FileNotFoundError(f'Arquivo {self.config_path} não encontrado')
    
    config_file = open(self.config_path, 'r')

    db_config = json.load(config_file)

    DSN = f'postgresql://{db_config["user"]}:{db_config["password"]}@{db_config["host"]}/{db_config["dbname"]}'
    self.connection = LoggingConnection(DSN)

    log_file = open(self.log_path, 'a', encoding='utf-8')
    self.connection.initialize(log_file)
    self.connection.autocommit = True

  def execute(self, query):
    self.cursor = self.connection.cursor()
    self.cursor.execute(query)

    pattern = r'^(?!\s*--).*?\bselect\b'
    selectQuery = re.findall(pattern, query, flags=re.IGNORECASE|re.MULTILINE)
    if selectQuery:
      return self.fetchAll()
    
    self.cursor.close()
    return []
  
  def fetchAll(self):
    result = self.cursor.fetchall()

    columns = [desc[0] for desc in self.cursor.description]
    rows = [dict(zip(columns, row)) for row in result]
    
    json_result = json.dumps(rows, ensure_ascii=False, default=str, indent=2)
    with open(self.result_path, 'w', encoding='utf-8-sig') as file:
      file.writelines(json_result)

    return json_result

  def close(self):
    self.connection.close()
    