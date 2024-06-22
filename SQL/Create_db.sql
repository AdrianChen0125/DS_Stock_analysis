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
    SECRET = 'sv=2022-11-02&ss=bfqt&srt=sco&sp=rlx&se=2024-07-01T04:19:29Z&st=2024-06-22T20:19:29Z&spr=https&sig=Xb%2BY8MWrqf8jsLssTnJJ1nNxltqzkT8PIXrNtjTRYKQ%3D'
GO;
    
-- Create an External Data Source
CREATE EXTERNAL DATA SOURCE files
WITH (
    LOCATION = 'abfss://files@datalakeqo5mxyg.dfs.core.windows.net',
    CREDENTIAL =  WorkspaceIdentity
);
GO;

CREATE LOGIN powerAA WITH PASSWORD = 'Aks10513010@';
GO;

CREATE USER powerAA FROM LOGIN powerAA;
GO;

-- to read data from sql view using custom credential and openrowset 
GRANT REFERENCES ON DATABASE SCOPED CREDENTIAL::[WorkspaceIdentity] TO [powerAA];
GO;

ALTER ROLE db_datareader ADD MEMBER [powerAA];
GO;


