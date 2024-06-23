USE StockDB
GO

IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseParquetFormat') 
	CREATE EXTERNAL FILE FORMAT [SynapseParquetFormat] 
	WITH ( FORMAT_TYPE = PARQUET)
GO


CREATE EXTERNAL TABLE dbo.Economic_Index (
	[name] nvarchar(4000),
	[date] nvarchar(4000),
	[value] nvarchar(4000)
	)
	WITH (
	LOCATION = 'synapse/workspaces/data/economic_index/**',
	DATA_SOURCE = datalake,
	FILE_FORMAT = [SynapseParquetFormat]
	)
GO


SELECT TOP 100 * FROM dbo.Economic_Index
GO