IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseParquetFormat') 
	CREATE EXTERNAL FILE FORMAT [SynapseParquetFormat] 
	WITH ( FORMAT_TYPE = PARQUET)
GO


CREATE EXTERNAL TABLE dbo.Stock_prediction (
	[NVDA] real,
	[AMD] real,
	[INTC] real,
	[QCOM] real,
	[GOOG] real,
	[MSFT] real,
	[AMZN] real,
	[AAPL] real
	)
	WITH (
	LOCATION = 'synapse/workspaces/data/Stock_predictions/**',
	DATA_SOURCE = datalake,
	FILE_FORMAT = [SynapseParquetFormat]
	)
GO


SELECT TOP 100 * FROM dbo.Stock_prediction
GO