IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseParquetFormat') 
	CREATE EXTERNAL FILE FORMAT [SynapseParquetFormat] 
	WITH ( FORMAT_TYPE = PARQUET)
GO



CREATE EXTERNAL TABLE dbo.Company_Report (
	[date] nvarchar(4000),
	[symbol] nvarchar(4000),
	[period] nvarchar(4000),
	[documenttype] nvarchar(4000),
	[revenues] float,
	[cost_of_revenue] float,
	[assets_current] bigint,
	[gross_profit] float,
	[net_income_loss] bigint,
	[earnings_per_share_basic] float,
	[earnings_per_share_diluted] float,
	[operating_income_loss] bigint,
	[operating_expenses] float,
	[research_development_expense] float,
	[selling_general_and_administrative_expense] float,
	[interest_expense] bigint,
	[cash_and_cash_equivalents_at_carrying_value] float,
	[common_stock_shares_outstanding] bigint,
	[long_term_debt] float,
	[liabilities_current] bigint,
	[liabilities] float
	)
	WITH (
	LOCATION = 'synapse/workspaces/data/company_report/**',
	DATA_SOURCE = datalake,
	FILE_FORMAT = [SynapseParquetFormat]
	)
GO


SELECT TOP 100 * FROM dbo.Company_Report
GO