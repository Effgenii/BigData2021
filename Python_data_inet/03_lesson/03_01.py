from pymongo import MongoClient
from pprint import pprint

# создаем новую базу данных и в ней библиотеку 'products'

client = MongoClient('127.0.0.1', 27017)
db = client['my_db']
products = db.products

# добавляем в скрипт 2 задания строчки, вставляющую словарь с характеристиками продукта в бд:
# ID объектов пусть создает MongoDB

products.insert_one({"name": name,
                     "name_l1": name_l1,
                     "name_l2": name_l2,
                     "name_l3": data_prod[0],
                     "rate_total": data_prod[1],
                     "safety": data_prod[2],
                     "naturalness": data_prod[3],
                     "nutritional": data_prod[4],
                     "quality": data_prod[5],
                     "link": data_prod[6],
                     })
# выводим список товаров с общим рейтингом больше 95

for product in products.find({'rate_total': {'$gt': 95}, '_id': 0}):
    pprint(product)

# добавляем в базу данных только новые товары "name_l3"

db.products.update({"name": name,
                     "name_l1": name_l1,
                     "name_l2": name_l2,
                     "name_l3": data_prod[0],
                     "rate_total": data_prod[1],
                     "safety": data_prod[2],
                     "naturalness": data_prod[3],
                     "nutritional": data_prod[4],
                     "quality": data_prod[5],
                     "link": data_prod[6]},
# обновляем поля  с рейтингом
                { {"name": name,
                     "rate_total": data_prod[1],
                     "safety": data_prod[2],
                     "naturalness": data_prod[3],
                     "nutritional": data_prod[4],
                     "quality": data_prod[5]},
# наименование товара оставляем без изменений
                $setOnInsert: { "name_l3": data_prod[0] }},
                { upsert: true })
