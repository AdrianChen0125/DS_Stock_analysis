# Project Title: Stock Market Insights combined with Market sentiments.
## data resource api 
1. Stock price: yfinance
2. Economic index & Stock news: https://www.alphavantage.co/
3. Company report: https://financialmodelingprep.com
4. Reddit comments.
5. Youtube Comments.
   
## Description:
The Stock Market Insights Platform is a comprehensive tool designed to provide valuable insights into the stock market by leveraging advanced data processing, machine learning, and visualization techniques.
The platform aims to empower investors, analysts, and traders with actionable information to make informed decisions in the dynamic world of finance.
## Key Features:
1. ETL Pipeline with Azure Synapse: The platform employs an Extract, Transform, Load (ETL) pipeline built using Azure Synapse, a powerful analytics service. This pipeline efficiently collects and processes vast      amounts of stock market data from various sources, ensuring data integrity and reliability.

2. Youtube & Reddit Comment Collection: Utilizing Reddit's API, the platform gathers comments related to stock market discussions in real-time. By monitoring sentiment and trends expressed in these comments, users gain valuable insights into market sentiment and emerging trends.

3. LSTM for Stock Price Prediction: The platform implements Long Short-Term Memory (LSTM) neural networks to forecast stock prices. By analyzing historical stock data, including price movements and trading  volumes, the LSTM model generates predictive insights to anticipate future price trends with high accuracy.

4. Sentiment Analysis: Natural Language Processing (NLP) techniques are applied to analyze the sentiment of market-related discussions extracted from Reddit comments. By identifying positive, negative, and neutral sentiment, users can gauge market sentiment and investor sentiment shifts, aiding in decision-making.

5. Visualization with Power BI: The platform offers interactive data visualization capabilities using Power BI, a business analytics tool by Microsoft. Users can explore comprehensive dashboards and intuitive visualizations, including stock price trends, sentiment analysis results, and key performance indicators, enabling them to identify patterns and trends effortlessly.

## Benefits:
Actionable Insights: The platform provides actionable insights derived from real-time data, enhancing decision-making processes for investors and traders.
Predictive Analytics: By leveraging advanced machine learning techniques, the platform offers predictive analytics for anticipating stock price movements.
Comprehensive Visualization: Visualizations generated through Power BI facilitate intuitive exploration and interpretation of complex market data, empowering users with actionable insights at a glance.
Future Enhancements:

Integration with Additional Data Sources: Expand the platform's data sources to include financial news, social media platforms, and economic indicators for a more comprehensive analysis.
Enhanced Predictive Models: Continuously refine and optimize predictive models to improve accuracy and reliability.
Advanced Analytics: Introduce advanced analytics techniques such as anomaly detection and clustering to uncover hidden patterns and opportunities in the market.
The Stock Market Insights Platform represents a cutting-edge solution for individuals and organizations seeking to gain a competitive edge in the stock market. By combining the power of data analytics, machine 
learning, and visualization, the platform revolutionizes the way market insights are generated and utilized, paving the way for smarter, more informed investment decisions.

## The structure of application
![image](https://github.com/AdrianChen0125/DS_Stock_analysis/assets/105028082/33ce57bf-83ed-4543-8b03-134803f8f295)
Detailed deployment step: https://github.com/AdrianChen0125/DS_Stock_analysis/blob/main/Deployment_steps.md

## Demonstrations
1. Economic index and news and sentiment about stocks:
![image](https://github.com/AdrianChen0125/DS_Stock_analysis/assets/105028082/a3f5aad9-661a-4634-a0f6-4169802532dd)

2. Time series analysis: Stock price with simple moving average & bollinger band and utilise LSTM predict stock value:
![image](https://github.com/AdrianChen0125/DS_Stock_analysis/assets/105028082/65d51322-323e-4b81-ad0c-0e68f58687c0)

3. Company performance:
![image](https://github.com/AdrianChen0125/DS_Stock_analysis/assets/105028082/cf2db885-be01-4986-9fcf-e012e795b6a7)
4. Maket sentiment from reddit and Youtube:
![image](https://github.com/AdrianChen0125/DS_Stock_analysis/assets/105028082/3fa32da9-fc78-4153-8059-e40a08dd14e4)
5. Stock price and market sentiment
   1. AMZN 
      ![image](https://github.com/AdrianChen0125/DS_Stock_analysis/assets/105028082/c750d5ad-7f1d-4ed6-9a34-3636d7aefe12)
   2. NVDA
      ![image](https://github.com/AdrianChen0125/DS_Stock_analysis/assets/105028082/a63ce658-9800-47e8-be9a-6b3feea7522b)
   3. Correlation
      ![image](https://github.com/AdrianChen0125/DS_Stock_analysis/assets/105028082/9c2c911b-6132-41b1-8840-c44ebf139a90)
      there is no significant correlation between stock price and sentiment score. From scatter plot, it indicated that most stocks' price did not vary with       sentiment score.  





   

