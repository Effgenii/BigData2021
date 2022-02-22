# 2. Изучить список открытых API. Найти среди них любое, требующее авторизацию (любого типа).
# Выполнить запросы к нему, пройдя авторизацию. Ответ сервера записать в файл.

import requests
import json
url = 'https://the-one-api.dev/v2'
endpoint = '/movie'
token = 'Bearer 0Pex4JOkNlrk8NTQG9Ac'
headers = {
    'Content-Type': 'application/json',
    'Authorization': token}
r = requests.get(f'{url}{endpoint}', headers = headers)
with open('Lord_of_the_rings.json', 'w') as f:
    json.dump(r.json(), f)
for i in r.json()['docs']:
    print(i['name'])

