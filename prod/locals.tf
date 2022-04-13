locals {
  vnet_info = {
    "VNET-PROD-SWT-WESTEU-OMS" = {
      cidr                = ["10.0.0.0/22"]
      subnet_names        = ["SNET-PROD-SWT-WESTEU-OMS-APP", "SNET-PROD-SWT-WESTEU-OMS-DATABASE"],
      snet_cidr           = ["10.0.0.0/23", "10.0.2.0/23"],
      resource_group_name = var.resource_group_name[0],
      nsg_name            = var.nsg_name[0],
      route_table_name    = var.route_table_name[0]
    },
    "VNET-PROD-SWT-WESTEU-CMS" = {
      cidr                = ["10.1.0.0/22"]
      subnet_names        = ["SNET-PROD-SWT-WESTEU-CMS-APP", "SNET-PROD-SWT-WESTEU-CMS-DATABASE"],
      snet_cidr           = ["10.1.0.0/23", "10.1.2.0/23"],
      resource_group_name = var.resource_group_name[1]
      nsg_name            = var.nsg_name[1],
      route_table_name    = var.route_table_name[1]
    },
    "VNET-PROD-SWT-WESTEU-PIMS" = {
      cidr                = ["10.2.0.0/22"]
      subnet_names        = ["SNET-PROD-SWT-WESTEU-PIMS-APP", "SNET-PROD-SWT-WESTEU-PIMS-DATABASE"],
      snet_cidr           = ["10.2.0.0/23", "10.2.2.0/23"],
      resource_group_name = var.resource_group_name[2],
      nsg_name            = var.nsg_name[2],
      route_table_name    = var.route_table_name[2]
    }
  }
}
