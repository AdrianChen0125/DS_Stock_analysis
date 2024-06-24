IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseParquetFormat') 
	CREATE EXTERNAL FILE FORMAT [SynapseParquetFormat] 
	WITH ( FORMAT_TYPE = PARQUET)
GO


CREATE EXTERNAL TABLE dbo.Sentiment_youtube (
	[Date] nvarchar(4000),
	[symbol] nvarchar(4000),
	[Comment] nvarchar(4000),
	[sentiment] float,
	[sentiment_category] nvarchar(4000)
	)
	WITH (
	LOCATION = 'synapse/workspaces/data/youtube/youtube_sentiments/**',
	DATA_SOURCE = datalake,
	FILE_FORMAT = [SynapseParquetFormat]
	)
GO


SELECT TOP 100 * FROM dbo.Sentiment_youtube
GO