#!/bin/bash

#Создает файлы индекса, скрипта и стиля для быстрых тестов

touch index.html
{
  printf '<!DOCTYPE html>\n<html>\n<head>\n<title>Test</title><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">\n<link rel="stylesheet" href="style.css">\n</head>\n<body>'
  printf '\n\n'
  printf '<script src="script.js" type="text/javascript"></script>\n</body>\n</html>'
} > index.html

touch style.css
touch script.js
