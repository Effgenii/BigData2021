from 06_lesson.scrapy.crawler import CrawlerProcess
from 06_lesson.scrapy.settings import Settings

from 06_lesson.jobparser import settings
from 06_lesson.jobparser.spiders.hhru import HhruSpider

if __name__ == '__main__':
    crawler_settings = Settings()
    crawler_settings.setmodule(settings)

    process = CrawlerProcess(settings=crawler_settings)
    process.crawl(HhruSpider)

    process.start()
