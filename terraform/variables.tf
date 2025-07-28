# variables.tf
# Project: Azure ETL Automation

variable "tenant_id" {
  description = "Azure Active Directory Tenant ID."
  type        = string
}

variable "object_id" {
  description = "Object ID of the Service Principal with access to resources."
  type        = string
}

