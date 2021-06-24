import warnings
from werkzeug.utils import secure_filename
import traceback
import sys
import pickle
import numpy as np
import datetime
from flask.logging import default_handler
from werkzeug.exceptions import HTTPException
from flask_mysqldb import MySQL
from os.path import join
import os
from flask import send_from_directory
from flask_cors import CORS, cross_origin
from flask import Flask, request, jsonify, render_template
from flask import Flask
import json
import logging
logging.basicConfig(filename='app.log', level=logging.ERROR)
#### import for error handling ####
#### import for logging error #####

error = 0

app = Flask(__name__)
with warnings.catch_warnings():
    warnings.simplefilter("ignore", category=UserWarning)

cors = CORS(app)
app.config['CORS_HEADERS'] = 'Content-Type'

#app.config['MYSQL_HOST'] = 'localhost'
app.config["MYSQL_PORT"] = 3306
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'demo'
mysql = MySQL(app)

#### logging config ####
app.logger.removeHandler(default_handler)
# http exceptions handler


@app.errorhandler(HTTPException)
def handle_exception(e):
    """Return JSON instead of HTML for HTTP errors."""
    # start with the correct headers and status code from the error
    response = e.get_response()
    # replace the body with JSON
    response.data = json.dumps({
        "code": e.code,
        "name": e.name,
        "description": e.description,
    })
    response.content_type = "application/json"

    logging.error('########### ' + str(e) + ' ###########', exc_info=True)

    return response

# other exceptions handler -> comment this one to see errors on console


@app.errorhandler(Exception)
def handle_exception(e):
    # pass through HTTP errors
    if isinstance(e, HTTPException):
        return e

    err = {
        "code": -1,
        "name": "Server Error",
        "description": "Unexpected Error. Please contact Admin"
    }

    logging.error('########### ' + str(e) + ' ###########', exc_info=True)

    # now you're handling non-HTTP exceptions only
    return jsonify(err)

#### end of error handlers ####

# Create a directory in a known location to save files to.
# uploads_dir = os.path.join(app.instance_path)

# This function will run when our api is hit for the first time


@app.route('/product', methods=['POST'])
@cross_origin()
def product():
    if request.method == "POST":
        cur = mysql.connection.cursor()
        query = ("SELECT * FROM employee")
        cur.execute(query)
        data = cur.fetchall()
        print(data)
        return jsonify({
            "data": data
        })