# databases
Course on Databases

## Inicializar venv
```bash
py -m venv .venv
```

## Atualizar ExecutionPolicy (windows)
```bash
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser 
```

## Ativar
```bash
.venv\Scripts\activate
```

## Instalar dependencias
```bash
pip install -r requirements.txt
```

## Pressupostos
Arquivo 'db_config.json' na raiz do projeto no formato
```json
{
  "dbname": "postgres",
  "user": "postgres",
  "password": "meu_password",
  "host": "localhost",
  "port": "5432"
}
```

## Utilização
Caminhar para arquivo da atividade
```bash
cd ./atividade3/
```

Inserir comando SQL em textBox.sql

Executar script
```bash
python ./main.py
```

Todo comando SQL executado será salvo [default: '.logs/db.log']

Caso SQL apresente comando de seleção (select), resultado retornará em formato json [default: '.logs/results.json']

