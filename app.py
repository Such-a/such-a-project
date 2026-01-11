from flask import Flask, jsonify
from flask_cors import CORS
import os

app = Flask(__name__)
CORS(app)  # allow requests from any origin

DATA_DIR = "/data"
COUNTER_FILE = os.path.join(DATA_DIR, "counter.txt")
LOG_FILE = os.path.join(DATA_DIR, "requests.log")

os.makedirs(DATA_DIR, exist_ok=True)

def read_counter():
    if not os.path.exists(COUNTER_FILE):
        return 0
    with open(COUNTER_FILE, "r") as f:
        return int(f.read())

def write_counter(value):
    with open(COUNTER_FILE, "w") as f:
        f.write(str(value))

@app.route("/api/stats")
def stats():
    count = read_counter() + 1
    write_counter(count)
    with open(LOG_FILE, "a") as log:
        log.write(f"Request number {count}\n")
    return jsonify({"requests": count})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
