USE StockDB;
GO;

-- Create an External File Format
CREATE EXTERNAL FILE FORMAT [CsvFileFormat]
WITH (
    FORMAT_TYPE = DELIMITEDTEXT,
    FORMAT_OPTIONS (
        FIELD_TERMINATOR = ',',
        STRING_DELIMITER = '"',
        FIRST_ROW = 2
    )
);
GO;

-- Create the External Table
CREATE EXTERNAL TABLE Stock_Price (
    [Date] DATE,
    [Open] FLOAT,
    [High] FLOAT,
    [Low] FLOAT,
    [Close] FLOAT,
    [Volumn] FLOAT,
    [Dividends] FLOAT,
    [Stock Splits] FLOAT,
    [symbol] VARCHAR(20)
)
WITH (
    LOCATION = 'synapse/workspaces/data/stock_price/*.csv',
    DATA_SOURCE = datalake,
    FILE_FORMAT = [CsvFileFormat]
);
GO;

