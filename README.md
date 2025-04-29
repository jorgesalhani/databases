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
