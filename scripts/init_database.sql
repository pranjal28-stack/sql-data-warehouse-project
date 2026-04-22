/*
============================================================
Create Database and Schemas
============================================================

Script Purpose:
This script creates a new database named 'DataWarehouse' after checking if it already exists.
If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
within the database: 'bronze', 'silver', and 'gold'.

WARNING:
Running this script will drop the entire 'DataWarehouse' database if it exists.
All data in the database will be permanently deleted. Proceed with caution
and ensure you have proper backups before running this script.
*/

-- Drop database if it exists
drop database if exists datawarehouse;

-- Create database
create database DataWarehouse;

-- Use the database
use DataWarehouse;

-- LOAD CUSTOMER DATA (CRM)
-- =========================================
LOAD DATA LOCAL INFILE 'datasets/source_crm/cust_info.csv'
INTO TABLE bronze_crm_cust_info
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- =========================================
-- LOAD PRODUCT DATA (CRM)
-- =========================================
LOAD DATA LOCAL INFILE 'datasets/source_crm/prd_info.csv'
INTO TABLE bronze_crm_prd_info
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- =========================================
-- LOAD SALES DATA (CRM)
-- =========================================
LOAD DATA LOCAL INFILE 'datasets/source_crm/sales_details.csv'
INTO TABLE bronze_crm_sales_details
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- =========================================
-- LOAD ERP LOCATION DATA
-- =========================================
LOAD DATA LOCAL INFILE 'datasets/source_erp/loc_a101.csv'
INTO TABLE bronze_erp_loc_a101
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



-- =========================================
-- LOAD ERP CUSTOMER DATA (AZ12)
-- =========================================
LOAD DATA LOCAL INFILE 'datasets/source_erp/cust_az12.csv'
INTO TABLE bronze_erp_cust_az12
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- =========================================
-- LOAD ERP CATEGORY DATA
-- =========================================
LOAD DATA LOCAL INFILE 'datasets/source_erp/px_cat_g1v.csv'
INTO TABLE bronze_erp_px_cat_g1v
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
