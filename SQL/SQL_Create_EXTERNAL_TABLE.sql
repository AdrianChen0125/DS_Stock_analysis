-- Step 1: Create a Database 
CREATE DATABASE StockDB
    COLLATE Latin1_General_100_BIN2_UTF8;
GO;

USE StockDB;
GO;
-- Step 2: Create an External Data Source
CREATE EXTERNAL DATA SOURCE files
WITH (
    LOCATION = 'https://datalakeqtkzlfx.dfs.core.windows.net/files/synapse'
);
GO;

-- Step 3: Create an External File Format
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

-- Step 4: Create the External Table
CREATE EXTERNAL TABLE Stock_Price (
    [Date] DATE,
    [Open] FLOAT,
    [High] FLOAT,
    [Low] FLOAT,
    [Close] FLOAT,
    [Volumn] FLOAT,
    [Symbol] VARCHAR(20),
    [Year] INT
)
WITH (
    LOCATION = 'stock_price/**',
    DATA_SOURCE = files,
    FILE_FORMAT = [CsvFileFormat]
);
GO;
