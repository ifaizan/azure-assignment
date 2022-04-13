resource "azurerm_resource_group" "rg" {
  for_each = toset(var.resource_group_name)
  name     = each.key
  location = var.region
}

module "network-security-group" {
  for_each              = local.vnet_info
  source                = "../modules/terraform-azurerm-network-security-group"
  security_group_name   = each.value["nsg_name"]
  resource_group_name   = each.value["resource_group_name"]
  location              = var.region
  source_address_prefix = ["*"]
}

module "route_table" {
  source              = "../modules/terraform-azurerm-route-table"
  for_each            = local.vnet_info
  name                = each.value["route_table_name"]
  resource_group_name = each.value["resource_group_name"]
  location            = var.region
  routes = [
    { name = "Local", address_prefix = join("", each.value["cidr"]), next_hop_type = "VnetLocal" },
    { name = "Default", address_prefix = "0.0.0.0/0", next_hop_type = "VirtualAppliance", next_hop_in_ip_address = "123.123.123.123" } // Replace next hop IP with Hub's gateway IP
  ]
  disable_bgp_route_propagation = false
}

module "vnet" {
  for_each            = local.vnet_info
  source              = "../modules/terraform-azurerm-vnet"
  vnet_name           = each.key
  resource_group_name = each.value["resource_group_name"]
  vnet_location       = var.region
  address_space       = each.value["cidr"]
  subnet_prefixes     = each.value["snet_cidr"]
  subnet_names        = each.value["subnet_names"]

  nsg_ids = {
    "${each.value["subnet_names"][0]}" = module.network-security-group["${each.key}"].network_security_group_id,
    "${each.value["subnet_names"][1]}" = module.network-security-group["${each.key}"].network_security_group_id
  }

  route_tables_ids = {
    "${each.value["subnet_names"][0]}" = module.route_table["${each.key}"].id
    "${each.value["subnet_names"][1]}" = module.route_table["${each.key}"].id
  }

  depends_on = [
    module.network-security-group, module.route_table
  ]
}
