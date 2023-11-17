#!/usr/bin/env python3

"""Example echo server application prepared for Perimeter81."""
import os

import requests
from flask import Flask, abort, jsonify, request

app = Flask(__name__)

# Get data from the environment variables
app_environment = os.environ.get("APP_ENVIRONMENT", "Getting APP_ENVIRONMENT failed")
ipinfo_token = os.environ.get("IPINFO_TOKEN", "")

# Define the local path for index.html
INDEX_HTML_PATH = "index.html"


@app.route("/")
def echo():
    """Main function returning the given echo string and geo location of the user."""
    echo_string = {
        "app_environment": app_environment,
    }

    client_ip = request.remote_addr

    ipinfo_url = f"https://ipinfo.io/{client_ip}?token={ipinfo_token}"

    ipinfo = requests.get(ipinfo_url, timeout=10)

    response_data = echo_string | ipinfo.json()

    return jsonify(response_data)


@app.route("/index.html")
def serve_index():
    """Function serving the index.html file."""

    try:
        with open(INDEX_HTML_PATH, "r", encoding="utf-8") as file:
            content = file.read()
        return content
    except FileNotFoundError:
        abort(404)


if __name__ == "__main__":
    # Run the Flask application
    app.run(host="0.0.0.0", port=8080)
