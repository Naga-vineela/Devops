resource "azurerm_virtual_machine" "TFVM" {
    name = "terraformVM"
    location = "${azurerm_resource_group.TFRG.location}"
    resource_group_name   = "${azurerm_resource_group.TFRG.name}"
    network_interface_ids = ["${azurerm_network_interface.TFNIC.id}"]
    vm_size = "Standard_B1s"
    storage_os_disk {
    name              = "TF_disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
    }
    storage_image_reference {
        id = "/subscriptions/366b75c9-17f4-4af3-94ad-78af08f204c0/resourceGroups/TerraformTestRG/providers/Microsoft.Compute/images/myPackerImage-terra"
    }
    os_profile {
    computer_name  = "TFgitVM"
    admin_username = "vineela"
    admin_password = "Password@123" }

    os_profile_linux_config {
        disable_password_authentication = false
    }
    
    provisioner "local-exec" {
    command = "echo ${azurerm_virtual_machine.TFVM.private_ip} >> private_ips.txt"
        
   
    }
    

}

output "webip"{
    value = "${azurerm_virtual_machine.TFVM.id}"
    description = "The public IP address of the main server instance."

}


