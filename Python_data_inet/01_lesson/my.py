import requests
import json
import pprint
headers = {'Content-Type': 'application/json'}
r = requests.get('http://192.168.1.51/values', headers)
pprint.pprint(r.text)