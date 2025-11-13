import os        # import inutile
import sys       # encore un import inutile
from flask import Flask

app = Flask(__name__)

# Code smell: fonction trop simple, sans docstring, nom pas clair
@app.route('/')
def h():  
    return 'Hello world!'  # pas de formatage, pas de f-string

# Code smell: logique inutile dans le main
if __name__ == '__main__':
    x = 42
    if x == 42:   # condition inutile
        app.run(host='0.0.0.0')  # pas de port spécifié, pas de debug
