IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseParquetFormat') 
	CREATE EXTERNAL FILE FORMAT [SynapseParquetFormat] 
	WITH ( FORMAT_TYPE = PARQUET)
GO



CREATE EXTERNAL TABLE dbo.Stock_price (
	[Date] date,
	[Open] float,
	[High] float,
	[Low] float,
	[Close] float,
	[Volume] bigint,
	[Dividends] float,
	[Stock Splits] float,
	[symbol] nvarchar(4000)
	)
	WITH (
	LOCATION = 'synapse/workspaces/data/stock_price/**',
	DATA_SOURCE = datalake,
	FILE_FORMAT = [SynapseParquetFormat]
	)
GO


SELECT TOP 100 * FROM dbo.Stock_price
GO