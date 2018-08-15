# terraform-azure
Building a simple webserver with Terraform in Azure.

# Prerequisites

Terraform installed (> version v0.11.6)
Azure CLI (> version 2.0.43)

# Instructions

1. Run `az configure` and sign in the standard way via the web front end, this will generate credentials on your local machine.

2. Make sure you're inside of the Terraform dir (cd terraform)

3. Run `terraform init`, this will download and install the azurerm provider required to create the infrastructure.

4. Run `terraform apply`, this will create your basic webserver.
