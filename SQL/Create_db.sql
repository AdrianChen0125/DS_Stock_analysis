-- -- Create a Database 
-- CREATE DATABASE StockDB
--     COLLATE Latin1_General_100_BIN2_UTF8;
-- GO;

-- USE StockDB;
-- GO;

-- -- Create a master key
-- CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Aks10513010@'

-- -- Create database scoped credential that use Synapse Managed Identity 
-- CREATE DATABASE SCOPED CREDENTIAL WorkspaceIdentity
-- WITH IDENTITY = 'SHARED ACCESS SIGNATURE',
--     SECRET = 'sv=2022-11-02&ss=bfqt&srt=co&sp=rwdlacupyx&se=2024-07-01T22:20:54Z&st=2024-06-23T14:20:54Z&spr=https&sig=Js7%2FfsOu9JzFPqDjaV4LJZDwa7JGSO1C%2FA%2B5RSxaI58%3D'
-- GO;
    
-- -- Create an External Data Source
-- CREATE EXTERNAL DATA SOURCE files
-- WITH (
--     LOCATION = 'abfss://files@datalakeqo5mxyg.dfs.core.windows.net',
--     CREDENTIAL =  WorkspaceIdentity
-- );
-- GO;

-- CREATE LOGIN powerBI WITH PASSWORD = 'Aks10513010@';
-- GO;

-- CREATE USER powerBI FROM LOGIN powerBI;
-- GO;

-- -- to read data from sql view using custom credential and openrowset 
-- GRANT REFERENCES ON DATABASE SCOPED CREDENTIAL::[WorkspaceIdentity] TO [powerBI];
-- GO;

-- ALTER ROLE db_datareader ADD MEMBER [powerBI];
-- GO;

-- Create an External Data Source
CREATE EXTERNAL DATA SOURCE datalake
WITH (
    LOCATION = 'abfss://files@datalakey4zmcph.dfs.core.windows.net',
    CREDENTIAL =  WorkspaceIdentity
);
GO;
