from flask import Flask, jsonify

app = Flask(__name__)

LOTS = [
    {"id": 1, "olives_kg": 1000, "huile_litres": 180, "qualite": "extra vierge"},
    {"id": 2, "olives_kg": 800, "huile_litres": 130, "qualite": "vierge"},
    {"id": 3, "olives_kg": 1200, "huile_litres": 210, "qualite": "extra vierge"},
]

@app.route('/health')
def health():
    return jsonify({"status": "ok"})

@app.route('/lots')
def lots():
    return jsonify(LOTS)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=3000)
