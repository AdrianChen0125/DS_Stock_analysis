#!/usr/bin/env python
# coding: utf-8

# ## ETL01_Stock_price
# 
# extract stock price 
# 

# In[19]:


from pyspark.sql.types import *
from pyspark.sql import functions as f
import requests
import pandas as pd 
import os

# get data from api 
def get_stock_data(symbol,apikey,data_size):
    url = 'https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol={0}&apikey={1}&outputsize={2}'.format(symbol,apikey,data_size)
    r = requests.get(url)
    data = r.json()
    return data
# read data into pandas df and change schema and add symbol
def transform_stock_data(data):
    df = (
        pd.DataFrame(data['Time Series (Daily)'])
        .transpose()
        .reset_index()
        .rename(columns={"index":'date',"1. open":'open',"2. high":"high","3. low":"low","4. close":"close","5. volume":"volume"})
    )
    # add symbol
    df['symbol']=data['Meta Data']['2. Symbol']
    return df

# join data frame and load into csv
def concate_df (dataframe_list):
    united_df = pd.concat(dataframe_list)
    return united_df

# turn pandas df into spark datafrme and change scheme
def read_into_sp(dataframe):
    result = (
    spark.createDataFrame(dataframe)
    .withColumn("date", f.to_date(f.col('date'), "yyyy-MM-dd"))
    .withColumn("open",f.col('open').cast(FloatType()))
    .withColumn("high",f.col('high').cast(FloatType()))
    .withColumn("low",f.col('low').cast(FloatType()))
    .withColumn("close",f.col('close').cast(FloatType()))
    .withColumn("volume",f.col('volume').cast(FloatType()))
    )
    return result


# In[4]:


if __name__ == "__main__":
    # adls_path = "adl://<your-storage-account>.azuredatalakegen2.net/<path-to-folder>/output.parquet"
    apikey='YGCUCM7FNF36SZJ0'
    #data size compact = 100 data points and full data from previous 20 years
    data_size='full'
    # set up target ticker 
    symbol_list=['NVDA','AMD','INTC','QCOM','GOOG','MSFT','AMZN','AAPL']
    # get data from api
    stock_data = [get_stock_data(symbol,apikey,data_size) for symbol in symbol_list]
    # transfrom json into data frame
    transformed_df_list = [transform_stock_data(data) for data in stock_data]
    final_df = concate_df (transformed_df_list)
    final_df_sp = read_into_sp(final_df)
    print('load data into filepath')
    #add year 
    add_year = final_df_sp.withColumn('year',f.year(f.col('date')))
    file_path ='abfss://files@datalakehuv7g91.dfs.core.windows.net/stock_price/'
    add_year.write.parquet(file_path,partitionBy='symbol',mode='overwrite')

