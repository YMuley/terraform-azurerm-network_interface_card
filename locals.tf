locals {
   network_interface_card = { for network_interface_card in var.network_interface_card_list :format("%s/%s",network_interface_card.resource_group_name,network_interface_card.name)  => network_interface_card} 
}