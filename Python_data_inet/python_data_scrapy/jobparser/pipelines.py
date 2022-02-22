# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html


# useful for handling different item types with a single interface
from itemadapter import ItemAdapter
from pymongo import MongoClient

class JobparserPipeline:
    def __init__(self):
        client = MongoClient('localhost', 27017)
        self.mongo_base = client['vac23_08']

    def process_item(self, item, spider):
        data = {}
        if spider.name == 'hhru':
            data = {
                'name': item['name'].replace('\xa0', ' '),
                'url': item['url'].split('?')[0],
                'salary': self.get_hh_salary(item['salary'].replace('\xa0', ' ')),}
        elif spider.name == 'sjru':
            salary = item['salary']
            salary = [x.replace('\xa0', '') for x in salary if x.replace('\xa0', '')]
            data = {
                'name': item['name'].replace('\xa0', ' '),
                'url': item['url'].split('?')[0],
                'salary': self.get_sj_salary(salary), }

        collection = self.mongo_base[spider.name]
        collection.insert_one(item)
        return item

    @staticmethod
        def get_sj_salary(value_list):
            _min = None
            _max = None
            _cur = None

            if len(value_list) <= 1:
                pass
            elif len(value_list) == 3 and value_list[0].isdigit() and value_list[1].isdigit():
                _min = int(value_list[0])
                _max = int(value_list[1])
                _cur = value_list[2]
            elif len(value_list) == 2 and value_list[0] == 'от':
                _min = int(value_list[1].replace('руб.'))
                _cur = 'руб.'
            elif len(value_list) == 2 and value_list[0] == 'до':
                _max = int(value_list[1].replace('руб.'))
                _cur = 'руб.'

            return {'min': _min, 'max': _max, 'currency': _cur,}

        @staticmethod
        def get_hh_salary(value):
            _min = None
            _max = None
            _cur = None
            if value:
                if value.split()[0] == 'от' and value.find('до') == -1:
                    _cur = ''.join(value.split()[-1:])
                    _min = int(value.replace('от', '').replace(f'{_cur}', '').replace(' ', ''))
                elif value.split()[0] == 'до':
                    _cur = ''.join(value.split()[-1:])
                    _max = int(value.replace('до', '').replace(f'{_cur}', '').replace(' ', ''))
                elif value == 'зарплата не указана':
                    pass
                else:
                    _cur = ''.join(value.split()[-1:])
                    _tmp = value.replace(' ', '').replace('от', '').replace('руб.', '').split('до')
                    _min = int(_tmp[0])
                    _max = int(_tmp[1])
            return {'min': _min, 'max': _max, 'currency': _cur, }
