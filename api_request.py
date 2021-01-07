import requests
import json

def object_data():
    response = requests.get("http://dataeng.quero.com:5000/caged-data", timeout=5)
    dictionary = json.dumps(response.json(), sort_keys = True, indent = 4)
    print(dictionary)
    response.raise_for_status()

try:
    object_data()

except requests.exceptions.HTTPError as errh:
    print("Http Error: ", errh)

except requests.exceptions.ConnectionError as errc:
    print("Connection Error:", errc)

except requests.exceptions.Timeout:
    object_data()

except requests.exceptions.RequestException as err:
    print ("Something got wrong: ", err)



