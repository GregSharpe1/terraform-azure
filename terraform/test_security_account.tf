resource "random_id" "terraform_random_id" {
    keepers = {
        # Generate a new ID only when a new resource group is defined
        resource_group = "${azurerm_resource_group.terraform_resource_group.name}"
    }

    byte_length = 8
}

resource "azurerm_storage_account" "terraform_storage_account" {
    name                = "diag${random_id.terraform_random_id.hex}"
    resource_group_name = "${azurerm_resource_group.terraform_resource_group.name}"
    location            = "${var.azure_default_location}"
    account_replication_type = "LRS"
    account_tier = "Standard"
}