#!/bin/bash

#Convert markdown to html
pandoc *.md -o *.html

#Upload file to server directory /web
lftp ftp://3mmmts729i222:SS89CjM1@103.132.234.237 << EOF
put ~/blog/{index, 202411}.html

bye
EOF

read -p "Enter the commit message : " message
git add *
git commit -m "$message"
git push
