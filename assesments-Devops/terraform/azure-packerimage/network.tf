resource "azurerm_network_security_group" "TFSG" {
  name                = "WebSG"
  location            = "${azurerm_resource_group.TFRG.location}"
  resource_group_name = "${azurerm_resource_group.TFRG.name}"
        security_rule {
    name                       = "allow"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_virtual_network" "TF_VNET" {
        name                = "TF_VNET1"
        location            = "${azurerm_resource_group.TFRG.location}"
        resource_group_name = "${azurerm_resource_group.TFRG.name}"
        address_space       = ["10.0.0.0/16"]
}
resource "azurerm_subnet" "TGsub" {
    name                 = "mySubnet"
    resource_group_name  = "${azurerm_resource_group.TFRG.name}"
    virtual_network_name = "${azurerm_virtual_network.TF_VNET.name}"
    address_prefix       = "10.0.1.0/24"
}

 # Create public IPs
resource "azurerm_public_ip" "TFpublicIp" {
    name                         = "myPublicIP"
    location                     = "${azurerm_resource_group.TFRG.location}"
    resource_group_name          = "${azurerm_resource_group.TFRG.name}"
    allocation_method            = "Dynamic"
}

resource "azurerm_network_interface" "TFNIC" {
  name                = "TFnic"
  location            = "${azurerm_resource_group.TFRG.location}"
  resource_group_name = "${azurerm_resource_group.TFRG.name}"
  network_security_group_id = "${azurerm_network_security_group.TFSG.id}"

  ip_configuration {
    name                          = "TFconfiguration1"
    subnet_id                     = "${azurerm_subnet.TGsub.id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${azurerm_public_ip.TFpublicIp.id}"

  }
}