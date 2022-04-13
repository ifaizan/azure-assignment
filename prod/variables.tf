variable "resource_group_name" {
  type        = list(string)
  description = "The names of resource groups"
  default     = ["RG-PROD-SWT-WESTEU-OMS", "RG-PROD-SWT-WESTEU-CMS", "RG-PROD-SWT-WESTEU-PIMS"]
}

variable "region" {
  type        = string
  description = "The name of region"
  default     = "West Europe"
}

variable "nsg_name" {
  type        = list(string)
  description = "The list of NSG"
  default     = ["NSG-PROD-SWT-WESTEU-OMS", "NSG-PROD-SWT-WESTEU-CMS", "NSG-PROD-SWT-WESTEU-PIMS"]
}

variable "route_table_name" {
  type        = list(string)
  description = "The name of route table"
  default     = ["RT-PROD-SWT-WESTEU-OMS", "RT-PROD-SWT-WESTEU-CMS", "RT-PROD-SWT-WESTEU-PIMS"]
}