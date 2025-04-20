variable "sql_server_name" {
  description = "The name of the SQL Server"
  type        = string
  default     = "my-sql-server"
}

variable "resource_group_name" {}

variable "location" {}

variable "admin_username" {
  description = "The administrator username for the SQL Server"
  type        = string
    # default     = "sqladmin"
}

variable "admin_password" {
  description = "The administrator password for the SQL Server"
  type        = string
  sensitive   = true
    # default     = "P@ssw0rd1234!"
}

variable "sku_name" {
  description = "The SKU name for the SQL Server"
  type        = string
  default     = "S0"
}

variable "sku_capacity" {
  description = "The capacity for the SKU"
  type        = number
  default     = 1
}

variable "database_name" {
  description = "The name of the SQL Database"
  type        = string
  default     = "mydatabase"
}
