#!/usr/bin/env python3
import datetime
import os
import requests

name = os.getenv('MY_NAME', 'Друг')

# Запрос к бесплатному API для проверки работы библиотеки
try:
    response = requests.get('https://api.github.com', timeout=5)
    github_status = f"GitHub API доступен (статус: {response.status_code})"
except:
    github_status = "GitHub API НЕ доступен"

# Создаем файл в папке /data
with open('/data/log.txt', 'a') as f:
    f.write(f"Контейнер запущен: {datetime.datetime.now()}\n")

print(f" Привет, {name}!")
print(f" Текущее время: {datetime.datetime.now()}")
print(" Лог записан в /data/log.txt")
