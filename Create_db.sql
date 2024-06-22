-- Create a Database 
CREATE DATABASE StockDB
    COLLATE Latin1_General_100_BIN2_UTF8;
GO;

USE StockDB;
GO;

-- Create a master key
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'powerbi1234!'

-- Create database scoped credential that use Synapse Managed Identity 
CREATE DATABASE SCOPED CREDENTIAL WorkspaceIdentity
WITH IDENTITY = 'Managed Identity'
GO;
    
-- Create an External Data Source
CREATE EXTERNAL DATA SOURCE files
WITH (
    LOCATION = 'https://datalakeqtkzlfx.dfs.core.windows.net/files/synapse',
    CREDENTIAL =  WorkspaceIdentity
);
GO;

CREATE LOGIN [powerBI] WITH PASSWORD = 'powerbi1234!';
GO;

CREATE USER [powerBI] FROM LOGIN powerBI;
GO;

-- to read data from sql view using custom credential and openrowset 
GRANT REFERENCES ON DATABASE SCOPED CREDENTIAL::[WorkspaceIdentity] TO [powerBI];
GO;

ALTER ROLE db_datareader ADD MEMBER [powerBI];
GO;
