resource "azurerm_network_security_group" "terraform_security_group_ssh" {
    name                = "AzureDemoTerraform-SG-SSH"
    location            = "${var.azure_default_location}"
    resource_group_name = "${azurerm_resource_group.terraform_resource_group.name}"

    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
}