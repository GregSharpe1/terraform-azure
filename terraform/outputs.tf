output "test_webserver_ip" {
  value = "${azurerm_public_ip.terraform_pip.ip_address}"
}
