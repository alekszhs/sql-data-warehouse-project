/*
================================================================
Quality Checks
===================================================================
Script Purpose:
  This script performs various quality checks for data consistency, accuracy,
  and standarization across the silver schemas.It includes checks for:
  -Null or duplicate primary keys.
  -Unwanted spaces in string fields.
  -Data standarization and consistency.
  -Invalid date ranged and orders.
  -Data consistency between related fields.

Usage Notes:
  -Run these checks after data loading Silver layer.
  -Investigate and resolve any discrepancies found during the checks.
====================================================================
*/

--Expectation: No Results
SELECT cst_key
FROM silver.crm_cust_info
WHERE cst_key != TRIM(cst_key)

--Data Standarization & Consistency
SELECT DISTINCT cst_marital_status
FROM silver.crm_cust_info


--Expectation: No Results
SELECT cst_key
FROM silver.crm_cust_info
WHERE cst_key != TRIM(cst_key)

--Data Standarization & Consistency
SELECT DISTINCT cst_gndr
FROM silver.crm_cust_info

--check for unwanted spaces
--Expectation: No results
SELECT cst_firstname
FROM silver.crm_cust_info
where cst_firstname != TRIM(cst_firstname)

SELECT cst_firstname
FROM silver.crm_cust_info
where cst_firstname != TRIM(cst_firstname)

--check for Nulls or Duplicates in Primary Key
--expectation : No Result

SELECT 
cst_id,
COUNT(*)
FROM silver.crm_cust_info
group by cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL

SELECT 
cst_id,
COUNT(*)
FROM silver.crm_cust_info
group by cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL

--Checking prd_id column
--check for duplicates in crm_prd_info key
select 
prd_id,
COUNT(*)
FROM silver.crm_prd_info
group by prd_id
HAVING count(*) >1 or prd_id IS NULL


--check for spaces
select 
prd_nm
from silver.crm_prd_info
where TRIM(prd_nm) != prd_nm

--check for NULLS
select 
prd_nm
from silver.crm_prd_info
where prd_nm IS  NULL

--CHECKING prd_start_dt column AND prd_end_dt
--check for nulls prd_start_dt
select 
prd_start_dt
from silver.crm_prd_info
where prd_start_dt IS NULL

--check for nulls prd_end_dt
select 
prd_end_dt,
COUNT(*)
from silver.crm_prd_info
where prd_end_dt IS NULL
GROUP by prd_end_dt

--replace NULLS in prd_end_dt with n/a
select 
CASE	
	WHEN prd_end_dt IS NULL THEN 'n/a'
	ELSE prd_end_dt
END prd_end_dt
from silver.crm_prd_info

--check if the start date is bigger than the end date
select 
*
from silver.crm_prd_info
where prd_start_dt > prd_end_dt

--fixing the date issue
SELECT 
  prd_start_dt,
  DATEADD(DAY, -1, LEAD(prd_start_dt) OVER (PARTITION BY prd_key ORDER BY prd_start_dt)) AS prd_end_dt_tes
FROM silver.crm_prd_info;


--check for spaces
select 
prd_key
from silver.crm_prd_info
where TRIM(prd_key)!= prd_key

--CHECK FOR NULL
select 
prd_key
from silver.crm_prd_info
where prd_key IS  NULL

--CHECKING prd_cost column

--check for Nulls
select 
prd_cost
from silver.crm_prd_info
where prd_cost is NULL

--Replace Nulls with zero
SELECT
CASE 
	WHEN prd_cost IS NULL then 0
	ELSE prd_cost
END prd_cost
FROM silver.crm_prd_info


--checking for values and nulls
select 
DISTINCT prd_line 
from silver.crm_prd_info

--replace null with n/a AND full names
select
prd_line,
CASE 
	WHEN UPPER(TRIM(prd_line))  = 'M' THEN 'Mountain'
	WHEN UPPER(TRIM(prd_line))  = 'R' THEN 'Road'
	WHEN UPPER(TRIM(prd_line))  = 'S' THEN 'other Sales'
	WHEN UPPER(TRIM(prd_line))  = 'T' THEN 'Touring'
	ELSE 'n/a'
END prd_line
from silver.crm_prd_info


--Checking prd_id column
--check for duplicates in crm_prd_info key
select 
prd_id,
COUNT(*)
FROM silver.crm_prd_info
group by prd_id
HAVING count(*) >1 or prd_id IS NULL


--check for spaces
select 
prd_nm
from silver.crm_prd_info
where TRIM(prd_nm) != prd_nm

--check for NULLS
select 
prd_nm
from silver.crm_prd_info
where prd_nm IS  NULL

--CHECKING prd_start_dt column AND prd_end_dt
--check for nulls prd_start_dt
select 
prd_start_dt
from silver.crm_prd_info
where prd_start_dt IS NULL

--check for nulls prd_end_dt
select 
prd_end_dt,
COUNT(*)
from silver.crm_prd_info
where prd_end_dt IS NULL
GROUP by prd_end_dt

--replace NULLS in prd_end_dt with n/a
select 
CASE	
	WHEN prd_end_dt IS NULL THEN 'n/a'
	ELSE prd_end_dt
END prd_end_dt
from silver.crm_prd_info

--check if the start date is bigger than the end date
select 
*
from silver.crm_prd_info
where prd_start_dt > prd_end_dt

--fixing the date issue
SELECT 
  prd_start_dt,
  DATEADD(DAY, -1, LEAD(prd_start_dt) OVER (PARTITION BY prd_key ORDER BY prd_start_dt)) AS prd_end_dt_tes
FROM silver.crm_prd_info;


--check for spaces
select 
prd_key
from silver.crm_prd_info
where TRIM(prd_key)!= prd_key

--CHECK FOR NULL
select 
prd_key
from silver.crm_prd_info
where prd_key IS  NULL

--CHECKING prd_cost column

--check for Nulls
select 
prd_cost
from silver.crm_prd_info
where prd_cost is NULL

--Replace Nulls with zero
SELECT
CASE 
	WHEN prd_cost IS NULL then 0
	ELSE prd_cost
END prd_cost
FROM silver.crm_prd_info


--checking for values and nulls
select 
DISTINCT prd_line 
from silver.crm_prd_info

--replace null with n/a AND full names
select
prd_line,
CASE 
	WHEN UPPER(TRIM(prd_line))  = 'M' THEN 'Mountain'
	WHEN UPPER(TRIM(prd_line))  = 'R' THEN 'Road'
	WHEN UPPER(TRIM(prd_line))  = 'S' THEN 'other Sales'
	WHEN UPPER(TRIM(prd_line))  = 'T' THEN 'Touring'
	ELSE 'n/a'
END prd_line
from silver.crm_prd_info


--CHECK Data consistency: Between Sales, Price and Quantity
--Sales = price * quantity
--Values must not be NULL, zero or negative

select DISTINCT
sls_sales AS old_sls_sales,
sls_quantity,
sls_price AS old_sls_price,
CASE WHEN sls_sales IS NULL OR sls_sales <=0 OR sls_sales!= sls_quantity * ABS(sls_price)
	THEN sls_quantity * ABS(sls_price)
	ELSE sls_sales
END AS sls_sales,
CASE WHEN sls_price IS NULL OR sls_price <= 0
	THEN sls_sales / NULLIF(sls_quantity, 0)
	ELSE sls_price
END AS sls_price
from silver.crm_sales_details
where sls_sales != sls_price * sls_quantity
OR sls_sales IS NULL OR sls_quantity IS NULL OR sls_price IS NULL
OR sls_sales <= 0 OR sls_quantity <= 0 OR sls_price <= 0
ORDER BY sls_sales, sls_quantity, sls_price

---DATA CLEANING
 SELECT 
 cid as old_cid,
  CASE 
	WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid, 4, LEN(cid))
	ELSE cid
END cid,
CASE 
    WHEN bdate < '1930-01-01' OR bdate > GETDATE() THEN NULL 
    ELSE bdate 
END AS bdate,
CASE UPPER(gen)
	WHEN NULL THEN 'n/a' 
	WHEN 'M' THEN 'Male'
	WHEN 'F' THEN 'Female'
	WHEN '' THEN 'n/a'
	ELSE gen
END gen
FROM silver.erp_cust_az12


--FIXING CID KEY
 SELECT 
 cid as old_cid,
  CASE 
	WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid, 4, LEN(cid))
	ELSE cid
END cid
FROM silver.erp_cust_az12

--CHECK FOR NULLS AND UNWANTED VALUES IN DATES
SELECT 
  CASE 
    WHEN bdate < '1930-01-01' OR bdate > GETDATE() THEN NULL 
    ELSE bdate 
 END AS bdate
FROM silver.erp_cust_az12;



--check gender values
SELECT
DISTINCT gen
from silver.erp_cust_az12

--fixing gender values
SELECT
CASE UPPER(gen)
	WHEN NULL THEN 'n/a' 
	WHEN 'M' THEN 'Male'
	WHEN 'F' THEN 'Female'
	WHEN '' THEN 'n/a'
	ELSE gen
END 
from silver.erp_cust_az12

--data cleaning in silver.erp_loc_a101
select 
REPLACE(cid, '-', ''),
cntry
from silver.erp_loc_a101


--check for empty spaces and nulls
select 
cntry
from silver.erp_loc_a101
where cntry != TRIM(cntry) and cntry IS NULL

SELECT DISTINCT 
cntry
from silver.erp_loc_a101


--FIXING CNTRY VALUES
SELECT
CASE(cntry)
	WHEN 'US' THEN 'USA'
	WHEN 'United Kingdom' THEN 'UK'
	WHEN 'United States' THEN 'USA'
	WHEN 'DE' THEN 'Germany'
	WHEN NULL THEN 'n/a'
	WHEN '' THEN 'n/a'
	ELSE cntry
END cntry
from silver.erp_loc_a101

--check for duplicates in id
SELECT DISTINCT 
id,
count(*)
from silver.erp_px_cat_g1v2
group by id

--check for spaces in cat
SELECT 
cat 
from silver.erp_px_cat_g1v2
where cat != TRIM(cat)

SELECT DISTINCT 
subcat,
count(*)
from silver.erp_px_cat_g1v2
group by subcat
