resource "azurerm_public_ip" "terraform_pip" {
    name                         = "AzureDemoTerraform-PIP"
    location                     = "${var.azure_default_location}"
    resource_group_name          = "${azurerm_resource_group.terraform_resource_group.name}"
    public_ip_address_allocation = "dynamic"
}