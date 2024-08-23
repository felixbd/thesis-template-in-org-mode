#!/usr/bin/env python3

import os
import sys
from datetime import datetime

def get_file_info(filename):
    filename = f"./out/{filename}"
    file_size = os.path.getsize(filename) / (1024 * 1024)
    mod_time = os.path.getmtime(filename)
    mod_date = datetime.fromtimestamp(mod_time).strftime('%Y-%m-%d %H:%M:%S')
    return file_size, mod_date


HEAD = """
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Index of /</title>
    <style>
        body { font-family: monospace; }
        h1 { font-size: 1.5em; }
        table { width: 100%; }
        th, td { text-align: left; padding: 8px; }
        th { background-color: #f2f2f2; }
        a { text-decoration: none; color: #007bff; }
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <h1>Index of /</h1>
    <table>
        <tr>
            <th>Name</th>
            <th>Last modified</th>
            <th>Size</th>
            <th>Description</th>
        </tr>
        <tr>
            <td><a href="../">Parent Directory</a></td>
            <td></td>
            <td>-</td>
            <td></td>
        </tr>
"""

FOOTER = """
    </table>
</body>
</html>
"""


def main() -> None:
    x = sys.argv[1]

    body = "".join([f"""
            <tr>
                <td><a href="{file_name}">{file_name}</a></td>
                <td>{get_file_info(file_name)[1]}</td>
                <td>{get_file_info(file_name)[0]:.2f} MB</td>
                <td>-</td>
            </tr>
    """ for file_name in [f"{x}.pdf", f"{x}.txt", f"{x}.html"]])

    index_content = HEAD + body + FOOTER

    with open("./out/index.html", "w") as file:
        file.write(index_content)

    print("index.html generated successfully.")

if __name__ == "__main__":
    main()

