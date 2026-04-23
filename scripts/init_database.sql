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

-- ==============================
-- CRM TABLES (BRONZE)
-- ==============================

drop table if exists  DataWarehouse.bronze_crm_cust_info;
create table DataWarehouse.bronze_crm_cust_info(
cst_id int,
cst_key varchar(50),
cst_firstname varchar(50),
cst_lastname varchar(50),
cst_material_status varchar(50),
cst_gndr varchar(50),
cst_create_date date
);

drop table if exists  DataWarehouse.bronze_crm_prd_info;
CREATE TABLE DataWarehouse.bronze_crm_prd_info (
    prd_id       INT,
    prd_key      VARCHAR(50),
    prd_nm       VARCHAR(50),
    prd_cost     INT,
    prd_line     VARCHAR(50),
    prd_start_dt DATETIME,
    prd_end_dt   DATETIME
);

drop table if exists  DataWarehouse.bronze_crm_sales_details;
CREATE TABLE DataWarehouse.bronze_crm_sales_details (
    sls_ord_num  VARCHAR(50),
    sls_prd_key  VARCHAR(50),
    sls_cust_id  INT,
    sls_order_dt INT,
    sls_ship_dt  INT,
    sls_due_dt   INT,
    sls_sales    INT,
    sls_quantity INT,
    sls_price    INT
);

drop table if exists DataWarehouse.bronze_erp_loc_a101 ;
CREATE TABLE DataWarehouse.bronze_erp_loc_a101 (
    cid    VARCHAR(50),
    cntry  VARCHAR(50)
);

drop table if exists DataWarehouse.bronze_erp_cust_az12;
CREATE TABLE DataWarehouse.bronze_erp_cust_az12 (
    cid    VARCHAR(50),
    bdate  DATE,
    gen    VARCHAR(50)
);

drop table if exists DataWarehouse.bronze_erp_px_cat_g1v2 ;
CREATE TABLE DataWarehouse.bronze_erp_px_cat_g1v2 (
    id           VARCHAR(50),
    cat          VARCHAR(50),
    subcat       VARCHAR(50),
    maintenance  VARCHAR(50)
);

-- LOAD CUSTOMER DATA (CRM)
-- =========================================
TRUNCATE TABLE bronze_crm_cust_info;
LOAD DATA LOCAL INFILE 'datasets/source_crm/cust_info.csv'
INTO TABLE bronze_crm_cust_info
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- =========================================
-- LOAD PRODUCT DATA (CRM)
-- =========================================
TRUNCATE TABLE bronze_crm_prd_info;
LOAD DATA LOCAL INFILE 'datasets/source_crm/prd_info.csv'
INTO TABLE bronze_crm_prd_info
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- =========================================
-- LOAD SALES DATA (CRM)
-- =========================================
TRUNCATE TABLE bronze_crm_sales_details;
LOAD DATA LOCAL INFILE 'datasets/source_crm/sales_details.csv'
INTO TABLE bronze_crm_sales_details
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- =========================================
-- LOAD ERP LOCATION DATA
-- =========================================
TRUNCATE TABLE bronze_erp_loc_a101;
LOAD DATA LOCAL INFILE 'datasets/source_erp/loc_a101.csv'
INTO TABLE bronze_erp_loc_a101
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



-- =========================================
-- LOAD ERP CUSTOMER DATA (AZ12)
-- =========================================
TRUNCATE TABLE bronze_erp_cust_az12;
LOAD DATA LOCAL INFILE 'datasets/source_erp/cust_az12.csv'
INTO TABLE bronze_erp_cust_az12
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- =========================================
-- LOAD ERP CATEGORY DATA
-- =========================================
TRUNCATE TABLE bronze_erp_px_cat_g1v2;
LOAD DATA LOCAL INFILE 'datasets/source_erp/px_cat_g1v.csv'
INTO TABLE bronze_erp_px_cat_g1v
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
