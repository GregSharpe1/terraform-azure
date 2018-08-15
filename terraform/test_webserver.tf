resource "azurerm_virtual_machine" "terraform_webserver" {
    name                  = "AzureDemoTerraform-VM"
    location              = "${var.azure_default_location}"
    resource_group_name   = "${azurerm_resource_group.terraform_resource_group.name}"
    network_interface_ids = ["${azurerm_network_interface.terraform_nic.id}"]
    vm_size               = "Standard_DS1_v2"

    storage_os_disk {
        name              = "AzureDemoTerraform-Disk"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Premium_LRS"
    }

    storage_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "16.04.0-LTS"
        version   = "latest"
    }

    os_profile {
        computer_name  = "azuretestprofile"
        admin_username = "${var.azure_admin_user}"
    }

    os_profile_linux_config {
        disable_password_authentication = true
        ssh_keys {
            path     = "/home/${var.azure_admin_user}/.ssh/authorized_keys"
            key_data = "${var.azure_demo_ssh_key}"
        }
    }

    boot_diagnostics {
        enabled     = "true"
        storage_uri = "${azurerm_storage_account.terraform_storage_account.primary_blob_endpoint}"
    }
}
