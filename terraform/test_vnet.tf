# Create a virtual network within the resource group
resource "azurerm_virtual_network" "terraform_vnet" {
  name                = "AzureDemoTerraform-vNet"
  address_space       = ["10.0.0.0/16"]
  location            = "${azurerm_resource_group.terraform_resource_group.location}"
  resource_group_name = "${azurerm_resource_group.terraform_resource_group.name}"

}