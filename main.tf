# --------- Network Interface Card ------------
resource "azurerm_network_interface" "network_interface_card" {
  for_each            = local.network_interface_card
  name                = each.value.name
  location            = each.value.location == null ? var.default_values.location : each.value.location
  resource_group_name = var.resource_group_output[each.value.resource_group_name].name
  tags                = each.value.tags == null ? var.default_values.tags : each.value.tags

  dynamic "ip_configuration" {
    for_each = each.value.ip_configuration

    content {
      name                          = ip_configuration.value.name
      subnet_id                     = lookup(var.subnet_output,format("%s/%s",ip_configuration.value.virtual_network_name,ip_configuration.value.subnet_name),null).id
      private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
      public_ip_address_id          = ip_configuration.value.public_ip_name == null ? null : var.public_ip_output[ip_configuration.value.public_ip_name].id
      private_ip_address            = ip_configuration.value.private_ip_address_allocation == "static" ? ip_configuration.value.private_ip_address : null
    }
  }
}

      
