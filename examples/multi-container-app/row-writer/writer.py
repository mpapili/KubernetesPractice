import mysql.connector
import time

db = mysql.connector.connect(
    host="mysql",
    user="root",
    passwd="password",
    database="mydatabase"
)

cursor = db.cursor()

while True:
    cursor.execute("INSERT INTO mytable (data) VALUES (NOW())")
    db.commit()
    time.sleep(15)

