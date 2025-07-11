# Azure ETL Automation Project

## Overview
This project automates the end-to-end ETL (Extract, Transform, Load) process for sales data using Python, Azure Data Factory (ADF), and Terraform. It demonstrates best practices for cloud-based data engineering, including data extraction from Kaggle, transformation and cleaning, orchestration with ADF, and infrastructure-as-code deployment on Azure.

## Features
- Automated extraction of sales data from Kaggle
- Data cleaning and transformation using Python (Pandas)
- Advanced data transformations with Azure Data Factory Mapping Data Flows
- Orchestrated ETL pipeline in Azure Data Factory
- Storage of raw and processed data in Azure Blob Storage
- Infrastructure provisioning using Terraform
- Modular and extensible architecture

## Architecture & Folder Structure
```
├── adf/                  # Azure Data Factory assets (pipelines, dataflows, datasets, linked services)
├── data/                 # Local data storage (raw and processed)
├── docs/                 # Documentation and images
├── src/                  # Python scripts for extraction and transformation
├── terraform/            # Infrastructure-as-code for Azure resources
├── requirements.txt      # Python dependencies
├── README.md             # Project documentation
```

## Prerequisites
- Python 3.8+
- Azure Subscription
- Kaggle account and API credentials
- Terraform >= 1.0.0
- Azure CLI (optional, for manual resource management)

## Setup & Installation
1. **Clone the repository**
   ```sh
   git clone <repo-url>
   cd Azure ETL Automation Project
   ```
2. **Install Python dependencies**
   ```sh
   pip install -r requirements.txt
   ```
3. **Configure Kaggle API**
   - Place your `kaggle.json` credentials in `~/.kaggle/`.
4. **Provision Azure resources with Terraform**
   ```sh
   cd terraform
   terraform init
   terraform apply
   ```
5. **Configure Azure Data Factory**
   - Import ADF assets from the `adf/` folder using the Azure portal.

## Usage Instructions
1. **Extract sales data from Kaggle**
   ```sh
   python src/extract/download_sales_data.py
   ```
2. **Transform and clean the data**
   ```sh
   python src/transform/transform_sales_data.py
   ```
3. **Upload cleaned data to Azure Blob Storage**
   - Use Azure CLI or Storage Explorer to upload `data/processed/sales_clean.csv` to the `raw` container.
4. **Run the ETL pipeline in Azure Data Factory**
   - Trigger the pipeline (`pipeline_sales_etl`) via the Azure portal or programmatically.

## Data Flow (ETL Process)
- **Extract:** Downloads raw sales data from Kaggle.
- **Transform:** Cleans and normalizes the data using Python.
- **Load:** Uploads processed data to Azure Blob Storage.
- **ADF Pipeline:** Orchestrates advanced transformations and aggregates sales metrics using Mapping Data Flows.

## Azure Data Factory Integration
- **Pipelines:** Defined in `adf/pipeline_sales_etl/pipeline_sales_etl.json`.
- **Data Flows:** Defined in `adf/dataflow_sales_transformations/df_sales_transformations.json`.
- **Datasets & Linked Services:** Defined in respective subfolders for seamless integration with Blob Storage.

## Terraform Infrastructure
- Provisions:
  - Resource Group
  - Storage Account
  - Blob Containers (`raw`, `processed`)
  - Role assignments for secure access
- See `terraform/main.tf` for details.

## Contributing
Contributions are welcome! Please open issues or submit pull requests for improvements, bug fixes, or new features.

## License
This project is licensed under the MIT License. See the LICENSE file for details.

## Contact
For questions or support, please contact the project maintainer via GitHub Issues.
