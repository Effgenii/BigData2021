# Парсер новостей для Ленты-ру

from pprint import pprint
from lxml import html
import requests
import time
from pymongo import MongoClient

header = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36'}

def request_to_lenta(num):
    url_base = 'https://lenta.ru/'
    try:
        time.sleep(1)
        response = requests.get(url_base, header)
        root = html.fromstring(response.text)
        # название источника
        sourse = 'Лента - РУ'
        # наименование новости
        message = root.xpath(
            "//body/div[@id='root']/section[2]/div[1]/div[1]/div[2]/div[1]/section[1]/div[1]/div["
            + str(num) + "]/a[1]/text()")
        message = str(message).replace('[', '').replace(']', '').replace('\\xa0', ' ').replace("'", "")
        # ссылку на  новость
        site = root.xpath(
            "//body/div[@id='root']/section[2]/div[1]/div[1]/div[2]/div[1]/section[1]/div[1]/div["
            + str(num) + "]/a[1]/ @href")
        site = url_base + str(site).replace('[', '').replace(']', '').replace('\\xa0', ' ').replace("'", "")
        # дата публикации
        date = root.xpath(
            "//body/div[@id='root']/section[2]/div[1]/div[1]/div[2]/div[1]/section[1]/div[1]/div["
            + str(num) + "]/a[1]/ @href")
        date = str(date)
        date = date[(date.find('/2021') + 1):(date.find('/2021') + 11)]
        dt = time.strptime(date, '%Y/%m/%d')
        dt = time.strftime('%Y-%m-%d', dt)

        return [sourse, message, site, dt]
    except:
        print('Ошибка запроса')

client = MongoClient('127.0.0.1', 27017)
db = client['my_db']
lenta = db.lenta

for i in range(2, 11):
    result = request_to_lenta(i)
    pprint(result)

    lenta.insert_one({"sourse": result[0],
                         "message": result[1],
                         "site": result[2],
                         "date": result[3]})

