FROM python

RUN mkdir -p /app
WORKDIR /app
COPY . /app

RUN python3 -m pip install flask psycopg2

CMD ["python3", "/app/api.py"]
