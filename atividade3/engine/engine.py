import psycopg2
from psycopg2.extras import LoggingConnection
import json
import os

class Engine:
  def __init__(self, config_path: str, log_path: str = 'db.log'):
    """
    @params
      config_path: caminho para arquivo de configurações de DB
      log_path: [db.log] caminho para arquivo de logs de DB
    """
    self.config_path = config_path
    self.log_path = log_path
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
    cursor = self.connection.cursor()
    cursor.execute(query)
    result = cursor.fetchall()
    cursor.close()

    return json.dumps(result, indent=2)
  
  def close(self):
    self.connection.close()