from flask import Flask, jsonify
import mysql.connector
import os

app = Flask(__name__)

def get_db_connection():
    return mysql.connector.connect(
        host=os.environ.get('DB_HOST', 'localhost'),
        user=os.environ.get('DB_USER', 'root'),
        passwd=os.environ.get('DB_PASSWORD', 'password'),
        database=os.environ.get('DB_NAME', 'mydatabase')
    )

@app.route('/data')
def get_data():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM mytable')
    results = cursor.fetchall()
    cursor.close()
    conn.close()
    
    return jsonify(results)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)

