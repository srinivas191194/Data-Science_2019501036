import requests
from bs4 import BeautifulSoup
import pandas as pd
import io
from multiprocessing import Pool

url = "https://en.wikipedia.org/wiki/List_of_S%26P_500_companies"

response_object = requests.get(url)
soup = BeautifulSoup(response_object.text,"html.parser")

header = soup.find_all('th')
headerList = []
for x in header:
    headerList.append(x.get_text(strip=True))
headerList = headerList[0:9]

table_data = soup.find('table')

data = []

for row in table_data.find_all('tr'):
    temp = []
    for td in row.find_all('td'):
        temp.append(td.get_text(strip=True))
    data.append(temp)

data.pop(0)

df = pd.DataFrame(data, columns = headerList)

symbol = df['Symbol']
period1 = "1483228800"
period2 = "1609545600"

weekly_monthly_period1 = "1519862400"
weekly_monthly_period2 = "1544659200"


def scrape(l):
    link = "https://query1.finance.yahoo.com/v7/finance/download/"+l+"?period1="+period1+"&period2="+period2+"&interval=1d&events=history&includeAdjustedClose=true"
    response = requests.get(link)
    bytes_io = io.BytesIO(response.content)
    dataframe = pd.read_csv(bytes_io)
    dataframe['Symbol'] = l
    return dataframe

def scrape_weekly(l):
    link = "https://query1.finance.yahoo.com/v7/finance/download/"+l+"?period1="+weekly_monthly_period1+"&period2="+weekly_monthly_period2+"&interval=1wk&events=history&includeAdjustedClose=true"
    response = requests.get(link)
    bytes_io = io.BytesIO(response.content)
    dataframe = pd.read_csv(bytes_io)
    dataframe['Symbol'] = l
    return dataframe

def scrape_monthly(l):
    link = "https://query1.finance.yahoo.com/v7/finance/download/"+l+"?period1="+weekly_monthly_period1+"&period2="+weekly_monthly_period2+"&interval=1mo&events=history&includeAdjustedClose=true"
    response = requests.get(link)
    bytes_io = io.BytesIO(response.content)
    dataframe = pd.read_csv(bytes_io)
    dataframe['Symbol'] = l
    return dataframe

if __name__ == '__main__':
    p = Pool(10)
    df_list = p.map(scrape,symbol)
    p.close()
    table = pd.concat(df_list).reset_index(drop=True)
    table.to_csv('Daily.csv')

    p = Pool(10)
    df_weekly_list = p.map(scrape_weekly,symbol)
    p.close()
    table = pd.concat(df_weekly_list).reset_index(drop=True)
    table.to_csv('Weekly.csv')

    p = Pool(10)
    df_monthly_list = p.map(scrape_monthly,symbol)
    p.close()
    table = pd.concat(df_monthly_list).reset_index(drop=True)
    table.to_csv('Monthly.csv')