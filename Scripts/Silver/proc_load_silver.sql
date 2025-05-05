/*
========================================================================
Stored Procedure: Load Silver Layer(Bronze -> Silver)
========================================================================
Script Purpose:
  This stored procedure performs the ETL (Extract, Transform, Load) process to
  populate the silver schema tables from the bronze schema.
  Actions Performed:
    -Truncates Silver Tables.
    -Inserts transformed and cleansed data from Bronze into Silver tables.

Parameters:
  None.
  This stored procedure does not accept any parameters orreturn any values.

Usage Example:
  EXEC silver.load_silver;
======================================================================
*/


CREATE OR ALTER PROCEDURE silver.load_silver AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
	BEGIN TRY
		PRINT '====================='
		PRINT 'Loading Silver Layer'
		PRINT '====================='

		PRINT '====================='
		PRINT 'Loading CRM Tables'
		PRINT '====================='

		SET @start_time = GETDATE();
		TRUNCATE TABLE silver.crm_cust_info;
		PRINT 'Inserting Data into silver.crm_cust_info'
		INSERT INTO silver.crm_cust_info(
		cst_id,
		cst_key,
		cst_firstname,
		cst_lastname,
		cst_marital_status,
		cst_gndr,
		cst_create_date)

		SELECT
		cst_id,
		cst_key,
		TRIM(cst_firstname) AS cst_firstname,
		TRIM(cst_lastname) AS cst_lastname,
		CASE WHEN UPPER(TRIM(cst_marital_status)) = 'S' THEN 'Single'
			 WHEN UPPER(TRIM(cst_marital_status)) = 'M' THEN 'Married'
			 ELSE 'n/a'
		END cst_marital_status,
		CASE WHEN UPPER(TRIM(cst_gndr)) = 'F' THEN 'FEMALE'
			 WHEN UPPER(TRIM(cst_gndr)) = 'M' THEN 'MALE'
			 ELSE 'n/a'
		END cst_gndr,
		cst_create_date
		FROM(
		SELECT 
		*,
		ROW_NUMBER() OVER (partition by cst_id ORDER BY cst_create_date DESC) flag_last
		FROM bronze.crm_cust_info
		WHERE cst_id IS NOT NULL
		)t where flag_last = 1 ;

		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '-----------------------';


		SET @start_time = GETDATE();
		TRUNCATE TABLE silver.crm_prd_info;
		PRINT 'Inserting Data into silver.crm_prd_info'
		--Loading silver.crm_prd_info
		INSERT INTO silver.crm_prd_info(
			prd_id,
			cat_id,
			prd_key,
			prd_nm,
			prd_cost,
			prd_line,
			prd_start_dt,
			prd_end_dt
		)
		SELECT
		prd_id,
		REPLACE(SUBSTRING(prd_key, 1, 5), '-', '_') as cat_id,
		SUBSTRING(prd_key, 7 ,LEN(prd_key)) as prd_key,
		prd_nm,
		ISNULL(prd_cost, 0) as prd_cost,
		CASE UPPER(TRIM(prd_line))
			WHEN  'M' THEN 'Mountain'
			WHEN  'R' THEN 'Road'
			WHEN  'S' THEN 'otherSales'
			WHEN  'T' THEN 'Touring'
			ELSE 'n/a'
		END prd_line,
		CAST(prd_start_dt AS DATE) AS prd_start_dt,
		CAST(DATEADD(DAY, -1, LEAD(prd_start_dt) OVER (PARTITION BY prd_key ORDER BY prd_start_dt)) as date) AS prd_end_dt
		FROM bronze.crm_prd_info;

		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '-----------------------';

		SET @start_time = GETDATE();
		TRUNCATE TABLE silver.crm_sales_details;
		PRINT 'Inserting Data into silver.crm_sales_details'
		--Loading silver.crm_sales_details
		INSERT INTO silver.crm_sales_details(
		sls_ord_num,
		sls_prd_key,
		sls_cust_id,
		sls_order_dt,
		sls_ship_dt,
		sls_due_dt,
		sls_sales,
		sls_quantity,
		sls_price
		)
		SELECT
		sls_ord_num,
		sls_prd_key,
		sls_cust_id,
		CASE 
			WHEN sls_order_dt = 0 OR LEN(sls_order_dt) != 8 THEN NULL
			ELSE CAST(CAST(sls_order_dt AS VARCHAR) AS DATE)
		END AS sls_order_dt,
		sls_ship_dt,
		sls_due_dt,
		CASE WHEN sls_sales IS NULL OR sls_sales <=0 OR sls_sales!= sls_quantity * ABS(sls_price)
			THEN sls_quantity * ABS(sls_price)
			ELSE sls_sales
		END AS sls_sales,
		sls_quantity,
		CASE WHEN sls_price IS NULL OR sls_price <= 0
			THEN sls_sales / NULLIF(sls_quantity, 0)
			ELSE sls_price
		END AS sls_price
		from bronze.crm_sales_details;

		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '-----------------------';

		PRINT '====================='
		PRINT 'Loading ERP Tables'
		PRINT '====================='

		SET @start_time = GETDATE();
		TRUNCATE TABLE silver.erp_cust_az12;
		PRINT 'Inserting Data into silver.erp_cust_az12'

		--Loading silver.erp_cust_az12
		INSERT INTO silver.erp_cust_az12(cid, bdate, gen)
		 SELECT 
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
		FROM bronze.erp_cust_az12;

		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '-----------------------';

		SET @start_time = GETDATE();
		PRINT 'Inserting Data into silver.erp_loc_a101'
		TRUNCATE TABLE silver.erp_loc_a101; 
		--Loading silver.erp_loc_a101
		INSERT INTO silver.erp_loc_a101(cid,cntry)
		SELECT 
		REPLACE(cid, '-', '') AS cid,
		CASE(TRIM(cntry))
			WHEN 'US' THEN 'USA'
			WHEN 'United Kingdom' THEN 'UK'
			WHEN 'United States' THEN 'USA'
			WHEN 'DE' THEN 'Germany'
			WHEN NULL THEN 'n/a'
			WHEN '' THEN 'n/a'
			ELSE cntry
		END cntry
		from bronze.erp_loc_a101;
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '-----------------------';

		SET @start_time = GETDATE();
		PRINT 'Inserting Data into silver.erp_px_cat_g1v2'
		TRUNCATE TABLE silver.erp_px_cat_g1v2; 

		--Loading silver.erp_px_cat_g1v2
		INSERT INTO silver.erp_px_cat_g1v2(id,cat,subcat,maintenance)
		SELECT
		REPLACE(id, '_', '-') id, --REPLACE _ WITH -
		cat,
		REPLACE(subcat, '-', '') subcat,
		maintenance
		from bronze.erp_px_cat_g1v2;
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '-----------------------';
	END TRY
	BEGIN CATCH
		PRINT '=========================='
		PRINT 'ERROR OCCURED DURING LOADING SILVER LAYER'
		PRINT 'ERROR MESSAGE' + ERROR_MESSAGE();
		PRINT '============================'
	END CATCH
END
GO
