#!/usr/bin/python3
import os
import json
from flask import Flask, render_template, request, jsonify, redirect

# Utils
import utils.conf as conf
import utils.redis_utils as redis_utils
import utils.api_info as api_info

# Global Vars
app = Flask(__name__)

##### BASIC FOR THE INCLUDED TEXT FILE WILL CHANGE FOR NEW SCRIPT FOR REDIS USAGE #######################
def format_data(filename):
    cur_dir = str(os.getcwd())
    # remember to edit file path for linux
    file = open(cur_dir + '/static/data/' + filename, "r")
    data = {}
    cur_cat = ''
    cur_sub = ''
    line = file.readline()

    while line:
        if "----------" in line:
            category = line.split('----------')[1].strip()
            data[category] = {}
            cur_cat = category
        elif "**********" in line:
            sub_cat = line.split('**********')[1].strip()
            cur_sub = sub_cat
            data[cur_cat][sub_cat] = []
        else:
            if line == '\n':
                pass
            else:
                data[cur_cat][cur_sub].append(line.strip())

        line = file.readline()

    file.close()
    return data

@app.route('/audit')
def audit():
    try:
        data = format_data('linux-output.txt')
        return render_template('audit.html', data=data, c_name=conf.company_name)
    except:
        return render_template('audit.html', c_name=conf.company_name)
###########################################################################################

@app.route('/api', methods=["GET"])
def api_home():
    return jsonify(api_info.routes)

@app.route('/api/test-redis', methods=["GET"])
def api_test_redis():
    return redis_utils.test_redis()

# RECIEVE - JSON OUTPUT FROM SCRIPTS
@app.route('/api/recv', methods=["POST"])
def api_recv():
    return

@app.route('/')
def index():
    return render_template('index.html', c_name=conf.company_name)

if __name__ == '__main__':
    app.run(host='0.0.0.0', threaded=True, debug=True, port=8080)