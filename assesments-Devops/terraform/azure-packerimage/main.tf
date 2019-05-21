provider "azurerm" {
    tenant_id = "**********"
    subscription_id = "***********"
    client_id = "*************"
    client_secret = "*************"
}
resource "azurerm_resource_group" "TFRG" {
        name = "TerraformTestRG"
        location = "EastAsia"
}
