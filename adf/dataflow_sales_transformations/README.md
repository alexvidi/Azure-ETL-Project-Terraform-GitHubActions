# Azure Data Factory Data Flow: Sales Transformations

This folder contains the exported JSON definition of the **df_sales_transformations** Mapping Data Flow used in Azure Data Factory as part of the Sales ETL automation project.

## Overview

The data flow processes and transforms the cleaned sales data stored in Azure Blob Storage. It applies a series of data quality and enrichment steps to prepare the dataset for advanced analysis or reporting.

## Main Transformations

1. **FilterOrderAndShipDate**
   - Removes any records where `order_date` or `ship_date` is null.
   - Ensures only complete and valid sales records are processed.

2. **ConvertPostalCode**
   - Converts the `postal_code` column from float to string.
   - Removes unnecessary decimals from postal codes.

3. **ConvertSalesToNumber**
   - Converts the `sales` column from string to integer to enable correct aggregation.

4. **AggregateByCustomer**
   - Groups data by `customer_id`.
   - Calculates `total_sales`, `order_count`, and `last_order_date` for each customer.

5. **FormatTotalSales**
   - Converts `total_sales` to string and appends a `$` sign (for display purposes).

## Usage

- Import the `df_sales_transformations.json` file in your Azure Data Factory instance using the **Author & Monitor** portal.
- Connect the Data Flow to your existing Datasets:
  - **Source:** Clean sales CSV in Azure Blob Storage (`ds_sales_clean_csv`).
  - **Sink:** Output file in the processed container (`SinkProcessedSales`).
- This Data Flow can be used within an ADF Pipeline to automate data transformation as part of your ETL process.

## Files

- `df_sales_transformations.json`: Main Data Flow definition.
- `README.md`: This documentation file.

---



