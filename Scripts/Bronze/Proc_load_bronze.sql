/*
================================
Stored Procedure: Load Bronze Layer(Source --> Bronze)
This stored procedure loads data into the 'bronze' schema from external CSV files.
It performs the following actions:
-Truncates the bronze table before loading data
-Uses the BULK insert command to load data from csv files to bronze tables.

Parameters:
  None  
  This stored procedure does not accept any parameters or return any values.

USAGE example:
  EXEC bronze.load_bronze

*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @bronze_start_time DATETIME, @bronze_end_time DATETIME;
	BEGIN TRY
		SET @bronze_start_time = GETDATE();
		PRINT '====================='
		PRINT 'Loading Bronze Layer'
		PRINT '====================='

		PRINT '====================='
		PRINT 'Loading CRM Tables'
		PRINT '====================='

		SET @start_time = GETDATE();
		PRINT 'Inserting Data into bronze.crm_cust_info'
		TRUNCATE TABLE bronze.crm_cust_info; -- FIRST TRUNCATE THE TABLE

		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\Administrator\Desktop\DataWarehouseProject\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2, --ALREADY DEFINED THE FIRST ROW
			FIELDTERMINATOR = ',', --DELIMITER
			TABLOCK
		)

		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '-----------------------';

		SET @start_time = GETDATE();
		PRINT 'Inserting Data into bronze.crm_prd_info'
		TRUNCATE TABLE bronze.crm_prd_info; 

		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\Administrator\Desktop\DataWarehouseProject\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2, 
			FIELDTERMINATOR = ',', 
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '-----------------------';

		SET @start_time = GETDATE();
		PRINT 'Inserting Data into bronze.crm_sales_details'
		TRUNCATE TABLE bronze.crm_sales_details; 

		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\Administrator\Desktop\DataWarehouseProject\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2, 
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '-----------------------';

		PRINT '====================='
		PRINT 'Loading ERP Tables'
		PRINT '====================='

		SET @start_time = GETDATE();
		PRINT 'Inserting Data into bronze.erp_cust_az12'
		TRUNCATE TABLE bronze.erp_cust_az12; 

		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\Administrator\Desktop\DataWarehouseProject\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW = 2, 
			FIELDTERMINATOR = ',', 
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '-----------------------';

		SET @start_time = GETDATE();
		PRINT 'Inserting Data into bronze.erp_loc_a101'
		TRUNCATE TABLE bronze.erp_loc_a101; 

		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\Administrator\Desktop\DataWarehouseProject\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW = 2, 
			FIELDTERMINATOR = ',', 
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '-----------------------';

		SET @start_time = GETDATE();
		PRINT 'Inserting Data into bronze.erp_px_cat_g1v2'
		TRUNCATE TABLE bronze.erp_px_cat_g1v2; 

		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\Administrator\Desktop\DataWarehouseProject\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW = 2, 
			FIELDTERMINATOR = ',', 
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '-----------------------';
		SET @bronze_end_time = GETDATE();
		PRINT 'Load Duration of Bronze: ' + CAST(DATEDIFF(second, @bronze_start_time, @bronze_end_time) as NVARCHAR) + ' seconds';
	END TRY
	BEGIN CATCH
		PRINT '=========================='
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'ERROR MESSAGE' + ERROR_MESSAGE();
		PRINT '============================'
	END CATCH
END
GO
