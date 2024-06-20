FROM python

RUN mkdir -p /app
WORKDIR /app
COPY . /app

RUN python3 -m pip install flask

CMD ["python3", "/app/test.py"]
