from flask import Flask
import socket

app = Flask(__name__)

@app.route("/")
def hello() -> tuple:
    hostname = socket.gethostname()
    return f"Hostname: {hostname} - howdy!", 200

if __name__ == "__main__":
    app.run(host="0.0.0.0")
