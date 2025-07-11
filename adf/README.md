# Azure Data Factory Artifacts

This folder contains the main Azure Data Factory (ADF) artifacts for the Sales ETL Automation Project.

## Structure

- **dataflow_sales_transformations/**:  
  Contains the exported Data Flow (`df_sales_transformations.json`) used for advanced sales data transformations in the pipeline.

- **pipeline_sales_etl/**:  
  Contains the main ETL pipeline definition (`pipeline_sales_etl.json` and `pipeline_sales_etl_manifest.json`).

- **datasets/**:  
  Includes the exported dataset definitions used as sources and sinks in the pipeline ( `ds_sales_clean_csv.json`, `SinkProcessedSales.json`).

- **linked_services/**:  
  Contains the linked service configuration(s) required to connect ADF to Azure Blob Storage (e.g., `ls_blob_etlstoragedemoalex.json`).  

Each subfolder includes an additional README with further details and usage instructions.

---

