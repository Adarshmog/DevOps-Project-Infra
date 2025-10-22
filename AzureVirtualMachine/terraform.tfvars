rg_name     = "yamunaRG"
rg_location = "central india"

vnet_name     = "yamunaVnet"
address_space = ["10.4.0.0/16"]

subnet_name    = "yamunaSubnet"
address_prefix = ["10.4.1.0/24"]

pubipname        = "publicIp"
allocationMethod = "Static"

nsg_name     = "nsg_yamuna"
nic_name     = "nic_yamuna"
ipconfigname = "ipname1"
size           = "Standard_D2ads_v5"

image = {
  publisher = "Canonical"
  offer     = "0001-com-ubuntu-server-jammy"
  sku       = "22_04-lts-gen2"
  version   = "latest"
}

vmname_linux = "VM1"
computer_name = "vm1"
admin_user = "yamuna"
admin_pass = "Yamuna@123"

