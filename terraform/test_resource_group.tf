# Create a resource group
resource "azurerm_resource_group" "terraform_resource_group" {
  name     = "AzureDemoTerraform-RG"
  location = "${var.azure_default_location}"
}