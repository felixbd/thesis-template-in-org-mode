#!/usr/bin/env python3

import os
import sys
from datetime import datetime


def get_file_info(filename):
    filename = f"./out/{filename}"
    file_size = os.path.getsize(filename) / (1024 * 1024)
    mod_time = os.path.getmtime(filename)
    mod_date = datetime.fromtimestamp(mod_time).strftime("%Y-%m-%d %H:%M:%S")
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
</br>
</br>
Note: All files are generated automatically via the GNU/Emacs Org-Mode export functions.
</br>
see: <a href="https://github.com/felixbd/thesis-template-in-org-mode/">https://github.com/felixbd/thesis-template-in-org-mode/</a>
</body>
</html>
"""


def main() -> None:
    fen = sys.argv[1]  # file export name

    body = ""

    for suffix in ["pdf", "txt", "html"]:
        file_name = f"{fen}.{suffix}"
        s, d = get_file_info(file_name)

        body += f"""
            <tr>
                <td><a href="{file_name}">{file_name}</a></td>
                <td>{d}</td>
                <td>{s:.2f} MB</td>
                <td>-</td>
            </tr>
        """

    index_content = HEAD + body + FOOTER

    with open("./out/index.html", "w") as file:
        file.write(index_content)

    print("index.html generated successfully.")


if __name__ == "__main__":
    main()
