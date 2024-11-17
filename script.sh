#!/bin/bash

#Convert markdown to html
pandoc -f markdown -t html index.md 

#Upload file to server directory /web
lftp ftp://3mmmts729i222:SS89CjM1@103.132.234.237 << EOF

put index.html -o /web/index.html

bye
EOF

