FROM python:3.8
WORKDIR /app
COPY api.py .
RUN pip install Flask mysql-connector-python
CMD ["python", "./api.py"]

