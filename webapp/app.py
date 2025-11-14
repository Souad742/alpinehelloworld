
from flask import Flask

app = Flask(__name__)

# Code smell: fonction trop simple, sans docstring, nom pas clair
@app.route('/')
def h():  
    return 'Hello world!'  # pas de formatage, pas de f-string





