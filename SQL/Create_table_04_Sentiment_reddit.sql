IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseParquetFormat') 
	CREATE EXTERNAL FILE FORMAT [SynapseParquetFormat] 
	WITH ( FORMAT_TYPE = PARQUET)
GO

CREATE EXTERNAL TABLE dbo.Reddit_sentiment (
	[created_utc_x] datetime2(7),
	[symbol] nvarchar(4000),
	[comment] nvarchar(4000),
	[sentiment] float,
	[sentiment_category] nvarchar(4000)
	)
	WITH (
	LOCATION = 'synapse/workspaces/data/reddit_sentiments/**',
	DATA_SOURCE = datalake,
	FILE_FORMAT = [SynapseParquetFormat]
	)
GO


SELECT TOP 100 * FROM dbo.Reddit_sentiment
GO