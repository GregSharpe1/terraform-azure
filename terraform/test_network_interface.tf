resource "azurerm_network_interface" "terraform_nic" {
    name                = "AzureDemoTerraform-NIC"
    location            = "${var.azure_default_location}"
    resource_group_name = "${azurerm_resource_group.terraform_resource_group.name}"

    ip_configuration {
        name                          = "AzureDemoTerraform-IPConfig"
        subnet_id                     = "${azurerm_subnet.terraform_subnet.id}"
        private_ip_address_allocation = "dynamic"
        public_ip_address_id          = "${azurerm_public_ip.terraform_pip.id}"
    }
}