# Парсер новостей для Яндекса
# без заливки в базу данных

from lxml import html
import requests
from pprint import pprint
import time

url_base = 'https://yandex.ru/news/'
header = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36'}
try:
    time.sleep(1)
    response = requests.get(url_base, header)
    root = html.fromstring(response.text)
    items = root.xpath("//div[contains(@class, 'mg-grid__row mg-grid__row_gap_8 news-top-flexible-stories news-app__top')]/div")
except:
    print('Ошибка запроса')

data_new = {}

for item in items:
    message = item.xpath(".//div[@class = 'mg-card__annotation']/text()")
    site = item.xpath(".//a[@class = 'mg-card__source-link']/@href")
    sours = item.xpath(".//span[@class = 'mg-card-source__source']/a/text()")
    publication_time = (item.xpath(".//span[@class = 'mg-card-source__time']/text()"))

    data_new['sours'] = sours
    data_new['message'] = message
    data_new['site'] = site
    # беру текущую дату - потому что не нашел дату новости, только время публикации
    data_new['date'] = [time.strftime ('%m/%d/%Y', time.localtime())]
    data_new['date'].append(publication_time)
    pprint(data_new)




