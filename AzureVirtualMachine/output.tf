output "ansible_inventory" {
  description = "Ansible inventory file content for VM provisioning"
  value = <<EOT
[web]
${azurerm_public_ip.example.ip_address} ansible_user=yamuna ansible_ssh_pass=Yamuna@123
EOT
}


# Output just the VM public IP
output "vm_ip" {
  value       = azurerm_public_ip.example.ip_address
  description = "Public IP of the VM"
}

