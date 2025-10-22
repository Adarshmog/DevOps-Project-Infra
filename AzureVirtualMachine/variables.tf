variable "rg_name" {
  description = "Resource Group name"
  type        = string
}

variable "rg_location" {
  description = "Azure region"
  type        = string
}

variable "vnet_name" {
  description = "Virtual Network name"
  type        = string
}

variable "address_space" {
  description = "Address space for VNet"
  type        = list(string)
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
}

variable "address_prefix" {
  description = "Address prefix for subnet"
  type        = list(string)
}

variable "pubipname" {
  description = "Public IP name"
  type        = string
}

variable "allocationMethod" {
  description = "IP Allocation Method"
  type        = string
}

variable "nsg_name" {
  description = "Network Security Group name"
  type        = string
}

variable "nic_name" {
  description = "Network Interface name"
  type        = string
}

variable "ipconfigname" {
  description = "IP configuration name"
  type        = string
}

variable "size" {
  description = "VM Size"
  type        = string
}

variable "image" {
  description = "Image details for VM"
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
}


# Linux VM variables
variable "vmname_linux" {
  description = "Linux VM name"
  type        = string
}

variable "computer_name" {
  description = "Computer hostname"
  type        = string
}

variable "admin_user" {
  description = "Linux admin username"
  type        = string
}

variable "admin_pass" {
  description = "Linux admin password"
  type        = string
  sensitive   = true
}




