IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseParquetFormat') 
	CREATE EXTERNAL FILE FORMAT [SynapseParquetFormat] 
	WITH ( FORMAT_TYPE = PARQUET)
GO


CREATE EXTERNAL TABLE dbo.Stock_news (
	[title] nvarchar(4000),
	[time_published] nvarchar(4000),
	[source] nvarchar(4000),
	[relevance_score] nvarchar(4000),
	[ticker] nvarchar(4000),
	[ticker_sentiment_label] nvarchar(4000),
	[ticker_sentiment_score] nvarchar(4000)
	)
	WITH (
	LOCATION = 'synapse/workspaces/data/stock_news/**',
	DATA_SOURCE = datalake,
	FILE_FORMAT = [SynapseParquetFormat]
	)
GO


SELECT TOP 100 * FROM dbo.Stock_news
GO