import logging
from logging.handlers import RotatingFileHandler
import os
import pickle   # Or can use joblib
import time

import pandas as pd

import flask

from flask import Flask, request, render_template

app = Flask(__name__)

# Load the model
# model_file = 'app/models/model.pkl'
# model = load_model(model_file)


@app.route('/', methods=['GET'])
def get_num():

    return render_template('get_num.html'), 200

@app.route('/sum', methods=['POST'])
def my_sum():
    text1 = int(request.form['text1'])
    text2 = int(request.form['text2'])
    summa = text1 + text2
    return render_template('sum.html', name=str(summa)), 200

@app.route('/predict', methods=['POST'])
def predict():

    return "Здесь пока ничего нет, но будет предикт"


if __name__ == "__main__":
    app.run(debug=True)



