#!/bin/bash

#Convert markdown to html
# pandoc index.md -o index.html
# pandoc 202411.md -o 202411.html
find . -name '*.md' | xargs  -n 1 bash -c 'pandoc -f markdown -t html -o "${1/.md/.htm}" "${1}"' -

#Upload file to server directory /web
lftp ftp://3mmmts729i222:SS89CjM1@103.132.234.237 << EOF
put ~/blog/index.html
put ~/blog/202411.html

bye
EOF

read -p "Enter the commit message : " message
git add *
git commit -m "$message"
git push
