from bs4 import BeautifulSoup as bs4
import requests
import pandas as pd
from pprint import pprint

# функция, возвращающая по ссылке характеристики отдельного товара
def get_product_char(url_base, link):
    response_l3 = requests.get(url_base + link)
    soup_l3 = bs4(response_l3.text, 'html.parser')
    name_l3 = soup_l3.find("h1", {"main-title testlab-caption-products util-inline-block"}).text
    if (soup_l3.find("div", {"total"}).text).isdigit():
        rate_total = int(soup_l3.find("div", {"total"}).text)
        # иногда рейтинг бывает "черным" - вообще без значения
    else:
        rate_total = -1
    rates = soup_l3.find_all("div", {"rate-item__value"})
    link = url_base + result_l2.attrs['href']
    if len(rates) == 4:
        try:
            safety = int(rates[0].text)
            naturalness = int(rates[1].text)
            nutritional = int(rates[2].text)
            quality = int(rates[3].text)
        except:
            safety, naturalness, nutritional, quality = 0, 0, 0, 0
    else:
        safety, naturalness, nutritional, quality = 0, 0, 0, 0

        # понимаю что костыль, но дорабатывать функцию нет времени.
        # потом сделаю парсер по заголовками характеристик на карточке товара
    return name_l3, rate_total, safety, naturalness, nutritional, quality, link

pages = []
sp = 0
# количесвто страниц с обзорами для каждой категории товаров
df = pd.DataFrame(columns=['Надгруппа', 'Группа товаров', 'Подгруппа товаров','Товар', 'Общий рейтинг',
                           'Безопасность','Натуральность','Пищевая ценность','Качество','Ссылка на сайт'])
url_base = 'https://roscontrol.com'
url_start = '/category/produkti/#popup'
response = requests.get(url_base + url_start)
# индексирую верхнеуровневую страницу с обзорами продуктов
soup = bs4(response.text, 'html.parser')
# печатаю название верхнеуровневой страницы (надгруппы товаров)
name = soup.find("h1", {"main-title util-inline-block main-title-with-social"}).text
print ('L0', name)
# получаю список ссылок на страницу категорий продуктов
results = soup.find_all("a", {"catalog__category-item util-hover-shadow"})
# Для каждого элемента списка ссылок извлекаю название и список ссылок на обзоры продуктов:
for result in results :
    response_l1 = requests.get(url_base + result.attrs['href'])
    soup_l1 = bs4(response_l1.text, 'html.parser')
    results_l1 = soup_l1.find_all("a", {"catalog__category-item util-hover-shadow"})
    name_l1 = soup_l1.find("h1", {"main-title util-inline-block main-title-with-social"}).text
    # теперь для каждого товара нужно получить количество тестов (для перебора страниц)
    # получаю список c числом тестирований (в виде строк "51 тест")
    tests_l1 = soup_l1.find_all("span", {"catalog__category-tested"})
    # преобразуем строки с количеством тестов в число
    # и формируем список, причем, если для продукта нет испытаний - ставим 0
    for x in range(len(tests_l1)):
        n = (tests_l1[x].text[:(tests_l1[x].text).find(" ")])
        if n.isdigit():
            pages.append((int(n)//18)+1)
        else:
            pages.append(0)
    print(pages)
    print("   L1 ", name_l1)
# получаю список ссылок на страницу отдельных продуктов
    for result_l1 in results_l1:
        print('всего', pages[sp], 'страниц')
        for n in range(pages[sp]):
            print ('смотрим', n, 'страницу')
            # осталось добавить перебор страниц со ссылками на тестирования
            response_l2 = requests.get(url_base + result_l1.attrs['href'] + '?page=' + str(n))
            soup_l2 = bs4(response_l2.text, 'html.parser')
            # получаю список ссылок на страницы с характеристиками отдельного товара
            results_l2 = soup_l2.find_all("a", {"block-product-catalog__item js-activate-rate util-hover-shadow clear"})
            # печатаю название рейтинга конкретного типа продуктов
            name_l2 = soup_l2.find("h1", {"main-title util-inline-block main-title-with-social"}).text
            print("      L2 ", name_l2)
            # теперь нужно по каждой ссылке получить атрибуты отдельного товара
            # на одной странице 18 карточек с товаром поэтому количество страниц = (число тестов
            # для данного товара // 18) + 1
            for result_l2 in results_l2:
                data_prod = (get_product_char(url_base, result_l2.attrs['href']))
                print ("         L3 ", data_prod[0])
                print ("            ", 'общий рейтинг: ', data_prod[1])
                print ("             безопасность: ", data_prod[2])
                print("             натуральность:", data_prod[3])
                print("             пищевая ценность:", data_prod[4])
                print("             качество:", data_prod[5])
                print ("            ", data_prod[6])
                # Загружаю данные в датафрейм Pandas
                df.loc[len(df)] = [name, name_l1, name_l2,
                                   data_prod[0],
                                   data_prod[1],
                                   data_prod[2],
                                   data_prod[3],
                                   data_prod[4],
                                   data_prod[5],
                                   data_prod[6]]
                df.to_csv('products.csv', encoding="utf8")
                # здесь и далее делаем прерывание, чтобы не ждать...
        # переходим на следующую подгруппу товаров
        sp = sp + 1
    break
print(df)
# Сохраняю в csv
# df.to_csv('products.csv', encoding="utf8" )
