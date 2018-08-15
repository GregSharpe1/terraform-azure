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
            key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDTWT8KVki//S0vO7D3Pv+CPdEkYhKq+DdXLXPSbQxTbLQNeWAIa4jKpsh8aa2Wyi1QfmeyC0ZWWfqYEcup62RvY7KjOgx3VlLcX5tL5U8O/oMUckMSsdPzAb9jPjR7lAmL9lwT1lKvyjQCWISmZGg1AQDrHBQIkwuEQ2qmg585aFkOl7JPJl6lmxGW9nlMXafJ2QDIiDDbEkjdV+umw8W1EYoawMBLG15M9m7vLnEelqO2M+yANIOoCkAZFDHFhBdSE8vh6MC50mDe+U4gW9DtOHGaN7Yq7z+71+lSw8qTnfLCvlmQe2aIwuUd/MqaaP0hp8sjVSOd8ypMlqs4jRq9 Azure SSH Key - greg.sharpe@devopsguys.com"
        }
    }

    boot_diagnostics {
        enabled     = "true"
        storage_uri = "${azurerm_storage_account.terraform_storage_account.primary_blob_endpoint}"
    }
}