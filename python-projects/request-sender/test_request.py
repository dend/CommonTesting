import requests
import json

data = {"someJson"}

headers = {
    "Accept-Encoding": "gzip, deflate, sdch",
    "content-type": "application/json; charset=UTF-8"
}

response = requests.post('', data=json.dumps(data))
print(response.content)