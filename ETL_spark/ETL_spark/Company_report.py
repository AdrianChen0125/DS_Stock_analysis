# Databricks notebook source
from pyspark.sql.types import *
from pyspark.sql import functions as f
import requests
import pandas as pd 

# COMMAND ----------

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

# COMMAND ----------

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
    # final_df_sp.write.parquet(adls_path)

# COMMAND ----------

out_put ='FileStore/tables/company_report'
final_df_sp.write.parquet(out_put,partitionBy="symbol")