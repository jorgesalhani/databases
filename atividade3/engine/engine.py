import psycopg2
from psycopg2.extras import LoggingConnection
import json
import os

class Engine:
  def __init__(self, config_path: str, log_path: str = 'db.log', result_path: str = 'result.json'):
    """
    @params
      config_path: caminho para arquivo de configurações de DB
      log_path: [db.log] caminho para arquivo de logs de DB
    """
    self.config_path = config_path
    self.log_path = log_path
    self.result_path = result_path
    self.connection : LoggingConnection = None

  def connect(self):
    if not os.path.exists(self.config_path):
      raise FileNotFoundError(f'Arquivo {self.config_path} não encontrado')
    
    config_file = open(self.config_path, 'r')

    db_config = json.load(config_file)

    DSN = f'postgresql://{db_config["user"]}:{db_config["password"]}@{db_config["host"]}/{db_config["dbname"]}'
    self.connection = LoggingConnection(DSN)

    log_file = open(self.log_path, 'a')
    self.connection.initialize(log_file)
    self.connection.autocommit = True

  def execute(self, query):
    self.cursor = self.connection.cursor()
    self.cursor.execute(query)

    if ('SELECT' in query):
      return self.fetchAll()
    
    self.cursor.close()
    return []
  
  def fetchAll(self):
    result = self.cursor.fetchall()

    columns = [desc[0] for desc in self.cursor.description]
    rows = [dict(zip(columns, row)) for row in result]
    
    json_result = json.dumps(rows, default=str, indent=2)
    result_file = open(self.result_path, 'w')
    result_file.writelines(json_result)

    return json_result

  def close(self):
    self.connection.close()