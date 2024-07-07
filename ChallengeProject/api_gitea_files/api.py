from flask import Flask, jsonify
import psycopg2
import os

app = Flask(__name__)

# Database configuration
DB_HOST = 'db-service'
DB_PASSWORD = 'mypass'
#DB_NAME = 'your_db_name'
DB_USER = 'postgres'

def get_db_connection():
    conn = psycopg2.connect(
        host=DB_HOST,
        #database=DB_NAME,
        user=DB_USER,
        password=DB_PASSWORD
    )
    return conn

@app.route('/describe_tables', methods=['GET'])
def describe_tables():
    conn = get_db_connection()
    cur = conn.cursor()

    # Query to get table names
    cur.execute("""
    SELECT table_name
    FROM information_schema.tables
    WHERE table_schema = 'public';
    """)
    tables = cur.fetchall()

    table_descriptions = {}

    # For each table, get column details
    for table in tables:
        table_name = table[0]
        cur.execute(f"""
        SELECT column_name, data_type
        FROM information_schema.columns
        WHERE table_name = '{table_name}';
        """)
        columns = cur.fetchall()
        table_descriptions[table_name] = columns

    cur.close()
    conn.close()
    return jsonify(table_descriptions)

@app.route('/data', methods=['GET'])
def get_data():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('SELECT * FROM your_table LIMIT 10;')
    rows = cur.fetchall()
    cur.close()
    conn.close()
    return jsonify(rows)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

