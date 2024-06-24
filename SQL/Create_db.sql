-- Create a Database 
CREATE DATABASE StockDB
    COLLATE Latin1_General_100_BIN2_UTF8;
GO;

USE StockDB;
GO;

-- Create a master key
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Aks10513010@'

-- Create database scoped credential that use Synapse Managed Identity 
CREATE DATABASE SCOPED CREDENTIAL WorkspaceIdentity
WITH IDENTITY = 'SHARED ACCESS SIGNATURE',
    SECRET = 'sv=2022-11-02&ss=bfqt&srt=co&sp=rwdlacupyx&se=2024-07-24T23:43:34Z&st=2024-06-24T15:43:34Z&spr=https&sig=iK36ePkJcxkyVwHRCxGAVQidcyKg1BhXwjYRYGeZ6IA%3D'
GO;
    

-- Create an External Data Source
CREATE EXTERNAL DATA SOURCE datalake
WITH (
    LOCATION = 'abfss://files@datalakemu3i5h9.dfs.core.windows.net',
    CREDENTIAL =  WorkspaceIdentity
);
GO;

CREATE LOGIN powerBI WITH PASSWORD = 'Aks10513010@';
GO;

CREATE USER powerBI FROM LOGIN powerBI;
GO;

-- to read data from sql view using custom credential and openrowset 
GRANT REFERENCES ON DATABASE SCOPED CREDENTIAL::[WorkspaceIdentity] TO [powerBI];
GO;

ALTER ROLE db_datareader ADD MEMBER [powerBI];
GO;


