FROM python:3.8
WORKDIR /app
COPY writer.py .
RUN pip install mysql-connector-python
CMD ["python", "./writer.py"]

