# FastAPI with Apache Kafka

requirements

- poetry
- kafka
- python3.9

### Install dependencies

```bash
poetry install
```

### Run app

```bash
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

**Remarque** if you note kafka installed then run `docker-compose -f kafka.yml up`

### Run consumer

```bash
python consumer.py
```

**Remarque** if you note kafka installed then run `docker-compose -f kafka.yml up`
