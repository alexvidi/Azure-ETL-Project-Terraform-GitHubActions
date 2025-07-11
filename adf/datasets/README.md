# Datasets

This folder contains the Azure Data Factory dataset definitions used in the ETL pipeline.

## Files

- `ds_sales_clean_csv.json`: Defines the source dataset for raw sales data stored as CSV in the `raw` container.
- `SinkProcessedSales.json`: Defines the sink (output) dataset for processed sales data stored as CSV in the `processed` container.

Each JSON file was exported directly from Azure Data Factory and describes the schema, file format, and connection information.
