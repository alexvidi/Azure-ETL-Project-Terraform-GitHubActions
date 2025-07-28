# --------------------------------------------------------------------
# main.tf
# Infrastructure as Code for Azure ETL Automation Project
# Provisions core Azure resources: Resource Group, Storage, Blob Containers,
# Key Vault, and Data Factory for a secure and automated ETL workflow.
# Author: Alex Vidal
# --------------------------------------------------------------------

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.0.0"
}

provider "azurerm" {
  features {}
}

# --------------------------------------------------
# Resource Group for all ETL project resources
# --------------------------------------------------
resource "azurerm_resource_group" "rg" {
  name     = "rg-etl-automation"
  location = "UK South"

  tags = {
    Project     = "azure-etl-automation"
    Owner       = "alex.vidal"
    Environment = "dev"
    Purpose     = "Resource group for ETL pipeline demo"
  }
}

# --------------------------------------------------
# Azure Storage Account for data storage
# --------------------------------------------------
resource "azurerm_storage_account" "storage" {
  name                     = "etlstoragedemoalex"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    Project     = "azure-etl-automation"
    Owner       = "alex.vidal"
    Environment = "dev"
    Purpose     = "Blob storage for raw and processed ETL data"
  }
}

# --------------------------------------------------
# Blob Container for raw (ingested) data
# --------------------------------------------------
resource "azurerm_storage_container" "raw_data" {
  name                  = "raw"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}

# --------------------------------------------------
# Blob Container for processed data
# --------------------------------------------------
resource "azurerm_storage_container" "processed_data" {
  name                  = "processed"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}

# --------------------------------------------------
# Azure Key Vault for secure secrets management
# --------------------------------------------------
resource "azurerm_key_vault" "kv" {
  name                        = "kv-etl-automation"
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  tenant_id                   = var.tenant_id
  sku_name                    = "standard"
  purge_protection_enabled    = false

  # Access policy for the main admin/service principal
  access_policy {
    tenant_id = var.tenant_id
    object_id = var.object_id

    secret_permissions = [
      "Get",
      "Set",
      "List",
      "Delete"
    ]
  }

  tags = {
    Project     = "azure-etl-automation"
    Owner       = "alex.vidal"
    Environment = "dev"
    Purpose     = "Centralized secrets storage (e.g., Kaggle, SQL credentials)"
  }
}

# --------------------------------------------------
# Azure Data Factory for orchestrating ETL workflows
# --------------------------------------------------
resource "azurerm_data_factory" "adf" {
  name                = "adf-etl-automation"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Project     = "azure-etl-automation"
    Owner       = "alex.vidal"
    Environment = "dev"
    Purpose     = "Data pipeline orchestration"
  }
}


