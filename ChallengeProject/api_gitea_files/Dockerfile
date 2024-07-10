#FROM python
FROM docker-registry:5000/fortune-api:1.1

RUN mkdir -p /app
WORKDIR /app
COPY . /app

RUN python3 -m pip install flask flask_cors psycopg2

CMD ["python3", "/app/api.py"]
