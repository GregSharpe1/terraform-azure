resource "azurerm_subnet" "terraform_subnet" {
    name                 = "AzureDemoTerraform-Subnet"
    resource_group_name  = "${azurerm_resource_group.terraform_resource_group.name}"
    virtual_network_name = "${azurerm_virtual_network.terraform_vnet.name}"
    address_prefix       = "10.0.2.0/24"
}