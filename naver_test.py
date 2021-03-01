from bs4 import BeautifulSoup
import requests
headers = {'User-Agent': 'Mozilla/5.0 (Windows; U; MSIE 9.0; WIndows NT 9.0; ko-KR))',} #안티 크롤링
search_word = "하이텍팜"
url = "https://search.naver.com/search.naver?where=news&sm=tab_jum&query="+search_word
req = requests.get(url.format(search_word))
soup = BeautifulSoup(req.text, 'html.parser')

news_dict = {}
idx = 0
cur_page = 1

table = soup.select('#main_pack > section > div > div.group_news > ul > li')
for i in table:
    news_title = i.find(class_='news_tit').text
    news_href = i.find(class_='news_tit')['href']
    print(news_title)
    print(news_href)




