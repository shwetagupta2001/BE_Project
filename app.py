import warnings
from flask.helpers import flash, get_debug_flag
from werkzeug.utils import secure_filename
import traceback
import sys
import pickle
from flask.logging import default_handler
from werkzeug.exceptions import HTTPException
from flask_mysqldb import MySQL
from os.path import join
import os
from flask import send_from_directory, sessions
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
app.config['MYSQL_DB'] = 'stubble management system'
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


@app.route('/product', methods=['GET'])
@cross_origin()
def product():
    if request.method == "GET":
        cur = mysql.connection.cursor()
        query = ("SELECT * FROM product")
        cur.execute(query)
        data = cur.fetchall()
        print(data)
        return jsonify({
            "data": data
        })
@app.route('/farmerregister', methods=['POST'])
@cross_origin()
def farmer_register():
    if request.method == "POST":
        print("hello")
        allvalue=request.json
        Farmer_id=allvalue['Farmer_id']
        Name=allvalue['Name']
        Email_id=allvalue['Email_id']
        Password=allvalue['Password']
        Location=allvalue['Location']
        print(allvalue)
        cur = mysql.connection.cursor()
        # cur.execute('''INSERT INTO farmer VALUES(%s,%s,%s,%s,%s)''',(Farmer_id,Name, Email_id, Password,Location))
        # cur.execute(
        # '''insert into farmer (Name,Email_id, Password, Phone_no,Location) VALUES (%s,%s,%s,%s,%s)''', (Name, Email_id, Password, Phone_no,Location))
        # query="INSERT INTO farmer(Name, Email_id, Password,Phone_no, Location) VALUES(?, ?, ?, ?,?)",(Name, Email_id, Password, Phone_no,Location)
        # query="insert into %s values (%s, %s, %s, %s, %s)" % ('farmer',Farmer_id,Name, Email_id, Password,Location)
        # query="SELECT * from {}".format("farmer")
        # query=("SELECT * FROM farmer")
        # cur.execute(query)
        # data = cur.fetchall()
        # print(data)
        # return jsonify({
        #     "data": data
        # })
        cur.execute("INSERT INTO farmer(Farmer_id,Name, Email_id, Password,Location) VALUES (%s,%s,%s,%s,%s)", (Farmer_id,Name, Email_id, Password,Location))
        mysql.connection.commit()
        print("success")

@app.route('/displayngo', methods=['GET'])
@cross_origin()
def display_ngo():
    if request.method == "GET":
        cur = mysql.connection.cursor()
        query = ("SELECT * FROM ngo")
        cur.execute(query)
        data = cur.fetchall()
        print(data)
        return jsonify({
            "data": data
        })
@app.route('/delete', methods=['POST'])
def delete_entry():
    if request.method == "POST":
        print("hello")
        allvalue=request.json
        cur = mysql.connection.cursor()
        print(allvalue)
        cur.execute("DELETE FROM product WHERE ID = '%d'" % (allvalue['entry_id']))
        mysql.connection.commit()
        print("success")
@app.route('/addproduct', methods=['POST'])
@cross_origin()
def addproduct():
    if request.method == "POST":
        print("hello")
        allvalue=request.json
        Farmer_id=Farmer
        Type=allvalue['Type']
        Quantity=allvalue['Quantity']
        Price=allvalue['Price']
        print(allvalue)
        cur = mysql.connection.cursor()
        # conn.execute('SELECT i.content, l.title FROM items i JOIN lists l \ON i.list_id = l.id ORDER BY l.title;').fetchall()
        # cur.execute('SELECT i.content, l.title FROM items i JOIN lists l \ON i.list_id = l.id ORDER BY l.title;').fetchall()
        mysql.connection.commit()
        print("success")
@app.route('/login', methods=['GET'])
@cross_origin()
def login():
    if request.method == "GET":
        print("hello")
        allvalue=request.json
        Farmer_id=allvalue['Farmer_id']
        Password=allvalue['Password']
        print(allvalue)
        cur = mysql.connection.cursor()
        cur.execute('SELECT * FROM farmer WHERE Farmer_id = % s AND Password = % s', (Farmer_id, Password, ))
        account = cur.fetchone()
        if account:
            print("Logged in succesfully")
        else:
            print("Unsuccessfull")  
         