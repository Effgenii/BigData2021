# 1. Посмотреть документацию к API GitHub, разобраться как вывести список репозиториев для
# конкретного пользователя, сохранить JSON-вывод в файле *.json.

import requests
import json
# import pprint
url = 'https://api.github.com/users/'
user = 'Effgenii'
repos = '/repos'
response = requests.get(url+user+repos)
# pprint.pprint(dict(response.headers))
for i in response.json():
    print(i['full_name'])
with open('data.json', 'w') as file:
    json.dump(response.json(), file)
