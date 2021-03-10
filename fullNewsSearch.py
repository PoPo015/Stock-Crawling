import time

from bs4 import BeautifulSoup

import requests,threading,datetime
import json

def full_news_search():
    with open('vi_data.json', 'r', encoding='utf-8') as json_result:
        json_data = json.load(json_result)
    headers = {'User-Agent': 'Mozilla/5.0 (Windows; U; MSIE 9.0; WIndows NT 9.0; ko-KR))',} #안티 크롤링
    for i in json_data["listDate"]:  # json 파일 decoding
        print(i["stk_nm"])
        keyword = i["stk_nm"]  # 종목명
        url = "https://search.naver.com/search.naver?where=news&sm=tab_jum&query="+keyword
        req = requests.get(url.format(keyword))
        soup = BeautifulSoup(req.text, 'html.parser')

        news_dict = {}
        data = []

        table = soup.select('#main_pack > section > div > div.group_news > ul > li')
        for i in table:
            news_title = i.find(class_='news_tit').text
            news_href = i.find(class_='news_tit')['href']
            news_time = i.find("span", {"class": "info"}).text
            print(news_title + " " + news_time)
            print(news_href)
            news_dict = {'news_company':keyword, 'news_title': news_title, 'news_time': news_time, 'news_href': news_href}
            data.append(news_dict) #배열 추가
            news_dict = {'news_Data':data}
            # with open('news_search_full_data.json', 'w', encoding="utf-8") as f:  # json 파일 저장 현재경로에
            #     json.dump(news_dict, f, ensure_ascii=False, indent="\t")
            # with open('news_search_data.json', 'r', encoding='utf-8') as json_result:  # json 파일 load
            #     json_data = json.load(json_result)
        send_json = json.dumps(news_dict, indent='\t')
        url = 'http://localhost:8081/stock/VI_NewsReg'
        headers = {'Content-Type': 'application/json; charset=utf-8'}
        requests.post(url=url, data=send_json, headers=headers)
    print("크롤링 끝")
    time.sleep(600)
    full_news_search()

if __name__ == '__main__':
    full_news_search()
