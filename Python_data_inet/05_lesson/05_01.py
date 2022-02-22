from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from selenium.webdriver.common.action_chains import ActionChains
import time
from pprint import pprint

driver = webdriver.Chrome()
driver.get("https://mail.ru/")
login = driver.find_element_by_name("login")
# login = driver.find_element_by_class_name("email-input svelte-1eyrl7y")
login.send_keys('study.ai_172@mail.ru')
login.send_keys(Keys.ENTER)
password = driver.find_element_by_name("password")
time.sleep(2)
password.send_keys('NextPassword172!?')
password.send_keys(Keys.ENTER)

list_wait = WebDriverWait(driver, 15)
list_wait.until(EC.element_to_be_clickable((By.CLASS_NAME, 'js-tooltip-direction_letter-bottom')))

# wait
list_wait = WebDriverWait(driver, 15)
list_wait.until(EC.element_to_be_clickable((By.CLASS_NAME, 'js-tooltip-direction_letter-bottom')))
mail_links = []

while True:
    mail_links_len = len(mail_links)
    links = driver.find_elements_by_class_name('js-letter-list-item')

    for link in links:
        mail_links.append(link.get_attribute('href'))

    actions = ActionChains(driver)
    actions.move_to_element(links[-1])
    actions.perform()

    if len(mail_links) == mail_links_len or len(mail_links) > 3:
        # чтобы не ждать
        break

# собираем данные
letter_data = []
for link in mail_links:
    driver.get(link)
    time.sleep(1)
    try:
        date = driver.find_element_by_xpath("//div[@class='letter__date']").text
        from_ = driver.find_element_by_xpath("//span[@class='letter-contact']").get_attribute("title")
        title = driver.find_element_by_xpath("//h2[@class='thread__subject']").text
        text = driver.find_element_by_xpath("//div[@class='letter__body']").text
    except Exception as err:
        print('невозможно загрузить данные')
    else:
        letter_data.append({
            'title': title,
            'from': from_,
            'date': date,
            'text': text
        })

pprint(letter_data)