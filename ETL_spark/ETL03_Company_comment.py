#!/usr/bin/env python
# coding: utf-8

# ## ETL03_Company_comment
# 
# Extract company data from api
# 

# In[6]:


from pyspark.sql.types import *
from pyspark.sql import functions as f
import requests
import pandas as pd 


# In[7]:


try:
    import praw
except:
    get_ipython().system('pip install praw')
    import praw


# In[9]:


user_agent='scraper 1.0 by /u/Adrian_10511'

reddit= praw.Reddit(
    client_id='ZSsuFt18m9u6PnXJJwjF1A',
    client_secret='cKPHnxi_E9gr7HM5DKdO-XU7nFdO2w',
    user_agent = user_agent
)


# In[20]:


stock_symbols=['NVDA','AMD']
subreddit_name = "stocks"
# comment_ls = reddit.subreddit(subreddit_name).hot(limit=)

list_=[]
for symbol in stock_symbols:
    list_.append([reddit.subreddit(subreddit_name).search(symbol,limit=10)]) 
    


# In[33]:


from praw.models import MoreComments
for top_level_comment in reddit.submission("1d181jb").comments:
    if isinstance(top_level_comment, MoreComments):
        continue
    print(top_level_comment.body)


# In[ ]:





# In[18]:


for i in comment_ls:
    print (i.title)


# In[21]:


# get data from api 
def get_stock_data(symbol,limit,apikey):
    url ='https://financialmodelingprep.com/api/v3/income-statement-as-reported/{0}?period=annual&limit={1}&apikey={2}'.format(symbol,limit,apikey)
    r = requests.get(url)
    data = r.json()
    return data
    
# read data into pandas df and change schema and add symbol
def transform_stock_data(data):
    df = (pd.DataFrame(data))
    return df

# join data frame and load into csv
def concate_df(dataframe_list):
    united_df = pd.concat(dataframe_list)
    return united_df

# turn pandas df into spark datafrme and change scheme
def read_into_sp(dataframe):
    result = (spark.createDataFrame(dataframe))
    return result



# In[22]:


if __name__ == "__main__":
    # adls_path = "adl://<your-storage-account>.azuredatalakegen2.net/<path-to-folder>/output.parquet"
    apikey='Zw1r6iuegK2CX3beasj6nxAkrllOCkoy'
    #data size compact = 100 data points and full data from previous 20 years
    limit = 5
    # set up target ticker 
    symbol_list=['NVDA','AMD','INTC','QCOM','GOOG','MSFT','AMZN','AAPL']
    # get data from api
    stock_data = [get_stock_data(symbol,limit,apikey) for symbol in symbol_list]
    # transfrom json into data frame
    transformed_df_list = [transform_stock_data(data) for data in stock_data]
    final_df = concate_df(transformed_df_list)
    final_df_sp = read_into_sp(final_df)
    print('load data into filepath')
    #add year 
    add_year = final_df_sp.withColumn('year',f.year(f.col('date')))
    file_path ='abfss://files@datalakehuv7g91.dfs.core.windows.net/company_report/'
    add_year.write.parquet(file_path,partitionBy='symbol',mode='overwrite')

