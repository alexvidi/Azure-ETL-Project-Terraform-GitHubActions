# Azure ETL Automation Project

[![Python](https://img.shields.io/badge/Python-3.8%2B-blue?logo=python)](https://www.python.org/) [![Terraform](https://img.shields.io/badge/Terraform-%3E%3D1.0.0-623CE4?logo=terraform)](https://www.terraform.io/) [![Azure](https://img.shields.io/badge/Azure-Cloud-blue?logo=microsoft-azure)](https://azure.microsoft.com/)

## Project Overview
This repository contains my capstone project for learning and demonstrating modern data engineering and cloud automation skills. The goal was to design and implement a complete ETL (Extract, Transform, Load) pipeline for sales analytics, using real-world tools and best practices. Throughout this project, I focused on building a solution that is not only functional, but also maintainable, scalable, and secure—mirroring the standards of professional data teams. By integrating Python, Azure Data Factory, Terraform, and GitHub Actions, I gained hands-on experience with technologies that are widely used in the industry, and I am excited to showcase my ability to deliver end-to-end data solutions.

## Executive Summary
- **Automated ETL Pipeline:** End-to-end automation from data ingestion to cloud deployment.
- **Cloud-Native Architecture:** Built on Azure services, ensuring scalability, reliability, and security.
- **Infrastructure as Code:** All resources are provisioned and managed via Terraform for reproducibility and compliance.
- **CI/CD Integration:** GitHub Actions orchestrate continuous integration and deployment, ensuring rapid, error-free delivery.
- **Best Practices:** Adheres to modern standards in DevOps, data governance, and software engineering.

## Key Project Highlights
- **Full automation:** No manual steps required from data extraction to reporting-ready datasets.
- **Enterprise security:** Credentials and secrets are managed securely with Azure Key Vault; infrastructure is auditable and compliant.
- **Extensibility:** Modular design enables rapid adaptation to new data sources, business rules, or cloud environments.
- **Operational visibility:** All processes are version-controlled, logged, and easily monitored.

## Core Competencies & Technologies
- **Python:** Advanced scripting, data wrangling (Pandas), API integration.
- **Azure Data Factory:** Visual orchestration, data flows, and pipeline automation.
- **Terraform:** Infrastructure provisioning, compliance, and lifecycle management.
- **GitHub Actions:** CI/CD automation, workflow orchestration, and secure secret management (integrated with Azure Key Vault).
- **Azure Blob Storage:** Scalable, durable cloud storage for raw and processed data.
- **Kaggle API:** Automated data acquisition from external sources.
- **DevOps & Cloud Engineering:** End-to-end automation, monitoring, and best practices.
- **Azure Key Vault:** Secure, centralized secrets management for credentials and sensitive configuration.

## Project Structure
```
├── adf/                  # Azure Data Factory artifacts
├── data/                 # Local data (raw and processed)
├── docs/                 # Documentation and images
├── src/                  # Python scripts for extraction and transformation
├── terraform/            # Infrastructure as code
├── .github/workflows/    # GitHub Actions workflows
├── requirements.txt      # Python dependencies
├── README.md             # Main documentation
```

## ETL Flow Overview
```mermaid
flowchart LR
    A[1. Extract\nKaggle Sales Data]
    B[2. Transform\nPython ETL Script]
    C[3. Cleaned CSV\n(Processed Data)]
    D[4. Upload Raw Data\nAzure Blob Storage (Raw)]
    E[5. Orchestrate & Transform\nAzure Data Factory]
    F[6. Store Processed Data\nAzure Blob Storage (Processed)]
    G[Secure Secrets\nAzure Key Vault]

    A --> B
    B --> C
    C --> D
    D --> E
    G -. "retrieves secrets" .-> E
    E --> F

    classDef data           fill:#e8f5e9,stroke:#2e7d32,stroke-width:2px;
    classDef process        fill:#fff9c4,stroke:#fbc02d,stroke-width:2px;
    classDef storage        fill:#e3f2fd,stroke:#1565c0,stroke-width:2px;
    classDef orchestration  fill:#f3e5f5,stroke:#6a1b9a,stroke-width:2px;
    classDef security       fill:#ffebee,stroke:#c62828,stroke-width:2px,stroke-dasharray: 5 5;
```

## Solution Architecture & Process
### 1. Data Extraction
- **Source:** Kaggle public dataset (`rohitsahoo/sales-forecasting`).
- **Automation:** Python script authenticates and downloads the latest data securely.

### 2. Data Transformation & Cleaning
- **Process:** Data is cleaned, normalized, and validated using Pandas, ensuring high data quality and consistency.

### 3. Data Storage
- **Cloud Storage:** Both raw and processed datasets are stored in Azure Blob Storage, enabling secure, scalable access for downstream analytics.

### 4. Orchestration & Advanced Transformation
- **ADF Pipelines & Data Flows:** Azure Data Factory orchestrates the ETL process, applying business logic, aggregations, and data enrichment.

### 5. Infrastructure as Code
- **Terraform:** All Azure resources, including Key Vault, are defined as code, supporting rapid deployment, versioning, and compliance.

### 6. CI/CD & Automation
- **GitHub Actions:** Automates data uploads, infrastructure changes, and workflow management. Secrets are managed securely via GitHub Secrets and Azure Key Vault.

## CI/CD Automation with GitHub Actions
- **Workflow:** `.github/workflows/upload-to-blob.yml`
- **Triggers:** On push to `data/processed/sales_clean.csv` or manual dispatch.
- **Steps:** Checkout, setup, authenticate, upload to Azure Blob Storage.
- **Secrets:** Managed securely via GitHub Secrets and Azure Key Vault.

## Secure Secrets Management with Azure Key Vault
This project integrates **Azure Key Vault** to ensure the highest standards of security for sensitive information such as credentials, API keys, and connection strings. Key Vault is provisioned and managed via Terraform, and access policies are strictly defined to allow only authorized identities to retrieve or manage secrets.

### Key Features
- **Centralized Secret Storage:** All sensitive data is stored securely in Azure Key Vault, never hardcoded or exposed in code repositories.
- **Access Control:** Fine-grained access policies restrict secret access to only required users and services (e.g., Data Factory, automation identities).
- **Automation Ready:** Key Vault is provisioned automatically as part of the infrastructure-as-code deployment, ensuring consistency across environments.
- **Integration with Azure Data Factory:** Data Factory pipelines and linked services securely retrieve secrets (such as storage keys or database credentials) directly from Azure Key Vault at runtime.
- **Compliance & Auditability:** All secret access is logged and auditable, supporting compliance with enterprise and regulatory standards.

### Example: Terraform Resource
```hcl
resource "azurerm_key_vault" "kv" {
  name                        = "kv-etl-automation"
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  tenant_id                   = var.tenant_id
  sku_name                    = "standard"
  purge_protection_enabled    = false

  access_policy {
    tenant_id = var.tenant_id
    object_id = var.object_id
    secret_permissions = ["Get", "Set", "List", "Delete"]
  }
}
```

### Best Practices Followed
- No secrets are stored in code or configuration files.
- All automation (Terraform, CI/CD) uses secure identity and access management.
- Key Vault is integrated with other Azure services for seamless, secure secret retrieval.

## Azure Data Factory: Orchestration & Advanced Data Transformation
Azure Data Factory (ADF) is the core orchestration engine in this project, enabling scalable, visual, and code-free data integration across cloud and on-premises sources. ADF pipelines and data flows are used to automate and manage the entire ETL process, ensuring data quality, consistency, and business logic enforcement.

### Key Features & Implementation
- **Pipeline Orchestration:** ADF pipelines coordinate the movement and transformation of data from raw ingestion to processed analytics-ready outputs.
- **Mapping Data Flows:** Visual, scalable data transformation logic is implemented using Mapping Data Flows, allowing for complex operations such as filtering, type conversion, aggregation, and enrichment—all without manual coding.
- **Integration with Azure Key Vault:** Linked services and datasets securely retrieve credentials and connection strings from Azure Key Vault, ensuring secrets are never exposed in code or configuration files.
- **Parameterization:** Pipelines and data flows are parameterized for reusability and flexibility, supporting multiple environments and data sources.
- **Monitoring & Logging:** ADF provides built-in monitoring, logging, and alerting, enabling operational visibility and rapid troubleshooting.
- **Artifacts Structure:**
  - `adf/pipeline_sales_etl/pipeline_sales_etl.json`: Main pipeline definition for orchestrating the ETL process.
  - `adf/dataflow_sales_transformations/df_sales_transformations.json`: Data flow for advanced sales data transformation and aggregation.
  - `adf/datasets/`: Definitions for source and sink datasets.
  - `adf/linkedservices/`: Secure connections to Azure resources, including Key Vault integration.

### Example: Data Flow Logic
- **Filter:** Remove records with missing or invalid dates.
- **Type Conversion:** Ensure all columns have the correct data types for downstream analytics.
- **Aggregation:** Summarize sales by customer, region, or product as needed.
- **Enrichment:** Add calculated fields or business logic transformations.

### Best Practices Followed
- All pipelines and data flows are version-controlled and documented.
- Secrets and credentials are never stored in ADF directly; always retrieved from Azure Key Vault.
- Modular, reusable design for easy adaptation to new business requirements.

## Tools & Services Used
- Python, Pandas, Kaggle API
- Azure Blob Storage, Azure Data Factory, Azure Key Vault
- Terraform, GitHub Actions, Azure CLI, VS Code

## Example Use Case: Sales Analytics
- **Business Problem:** Automate the ingestion, cleaning, and transformation of sales data for analytics and reporting.
- **Solution:** Data is extracted, cleaned, uploaded, and processed for BI or ML.
- **Benefits:** Fully automated, reproducible, scalable, and auditable pipeline.

## Documentation & Visual Evidence
The `docs/images` directory contains a curated collection of professional screenshots from the Azure Portal. These images provide visual evidence of the deployed resources, pipeline executions, data flows, monitoring dashboards, and security configurations. They serve to validate the successful implementation and operation of the ETL solution, and can be referenced for technical presentations, documentation, or interviews.

## Contributing
Contributions are welcome! Open an issue or pull request for suggestions, improvements, or fixes.

## Author
**Alexandre Vidal**  
Email: alexvidaldepalol@gmail.com  
[LinkedIn](https://www.linkedin.com/in/alexandre-vidal-de-palol-a18538155/)  
[GitHub](https://github.com/alexvidi)

**Project Repository:** [Azure-Automation-Project](https://github.com/alexvidi/azure-etl-automation-project)

---
