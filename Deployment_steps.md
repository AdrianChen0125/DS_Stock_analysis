## step 1 Login into azure account.
## step 2 Open azure cloud shell
![image](https://github.com/AdrianChen0125/DS_Stock_analysis/assets/105028082/6ff74aae-512e-4a8e-ab85-d3684ead0b8e)

## step 3 Use git clone get the project from git hub
![image](https://github.com/AdrianChen0125/DS_Stock_analysis/assets/105028082/0510857f-6bf6-4178-b9cf-055120a368b7)

## step 4 Utilise setup.ps1 to create azure synapse workspace 
![image](https://github.com/AdrianChen0125/DS_Stock_analysis/assets/105028082/7cbaba2b-6214-48c6-bcfb-1fe6115adfe0)

## step 5 Set up password for built in sql database in Azure synapse 
![image](https://github.com/AdrianChen0125/DS_Stock_analysis/assets/105028082/e2f70a9a-1f62-4c9b-b564-852b13920f1e)

## step 6 Login into Azure synapse workspace and copy the workspace name 
![image](https://github.com/AdrianChen0125/DS_Stock_analysis/assets/105028082/ecfd5b8c-57a4-4f8c-b1ff-de1cab473acc)

## step 7	Create Azure key-value service for storing api-key
1. Assign Key Vault Administrator to your azure AD 
![image](https://github.com/AdrianChen0125/DS_Stock_analysis/assets/105028082/2d7a01e6-f9f0-4ca8-95de-4638ca54b5ac)
2. Store api-key in the Azure key vault
![image](https://github.com/AdrianChen0125/DS_Stock_analysis/assets/105028082/0fb1caa4-89d5-43b1-b351-8db20e30eb1a)
3. Grant access for Azure synapse work space to key-vault
![image](https://github.com/AdrianChen0125/DS_Stock_analysis/assets/105028082/055d1d47-f03c-49eb-a866-9450492d7cf3)

## step 8 Import notebooks from git hub to Azure synapse
![image](https://github.com/AdrianChen0125/DS_Stock_analysis/assets/105028082/e47c253e-4d71-44ed-8b90-a66e08fed341)

## step 9 create shared access signature 
![image](https://github.com/AdrianChen0125/DS_Stock_analysis/assets/105028082/03eb020d-421e-4a31-a6d7-2474a0d0e007)

## step 10 import SQL script Create db to create azure serverless database and credential for powerbi paste the sas token in credential
![image](https://github.com/AdrianChen0125/DS_Stock_analysis/assets/105028082/a3c2b2d8-46ad-49bd-9bc1-d947f5f39e27)

## step 11 Create external table for each data set 
![image](https://github.com/AdrianChen0125/DS_Stock_analysis/assets/105028082/e1b1fa17-8d60-42c9-8afc-73c2105f7b53)

### remove the data source to datalake which was created in  Create db SQL
![image](https://github.com/AdrianChen0125/DS_Stock_analysis/assets/105028082/b9f9127f-81be-441d-b96a-adda8b6ee151)




