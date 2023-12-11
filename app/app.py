#!/usr/bin/env python3

"""Example echo server application prepared for Perimeter81."""
import os

import requests
from flask import Flask, abort, jsonify, request

app = Flask(__name__)

# Get data from the environment variables
app_environment = os.environ.get("APP_ENVIRONMENT", "undefined")
ipinfo_token = os.environ.get("IPINFO_TOKEN", "")
index_html_dir = os.environ.get("INDEX_HTML_DIR", "web")


@app.route("/")
def echo():
    """Main function returning the given echo string and geo location of the user."""
    echo_string = {
        "app_environment": app_environment,
        "app_repository": "https://github.com/langburd/p-shmonim-ve-ehad-example-app",
    }

    if request.headers.getlist("X-Forwarded-For"):
        client_ip = request.headers.getlist("X-Forwarded-For")[0]
    else:
        client_ip = request.remote_addr

    if ipinfo_token == "":
        token_part_in_url = ""
    else:
        token_part_in_url = f"?token={ipinfo_token}"

    ipinfo_url = f"https://ipinfo.io/{client_ip}{token_part_in_url}"

    # ipinfo_url = f"https://ipapi.co/{client_ip}/json/"

    ipinfo = requests.get(ipinfo_url, timeout=10)

    response_data = echo_string | ipinfo.json()

    return jsonify(response_data)


@app.route("/index.html")
def serve_index():
    """Function serving the index.html file."""

    try:
        with open(f"{index_html_dir}/index.html", "r", encoding="utf-8") as file:
            content = file.read()
        return content
    except FileNotFoundError:
        abort(404)


if __name__ == "__main__":
    # Run the Flask application
    app.run(host="0.0.0.0", port=8080)
