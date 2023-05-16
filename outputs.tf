output "openai_endpoint" {
  description = "The endpoint used to connect to the Cognitive Service Account."
  value       = azurerm_cognitive_account.this.endpoint
}

output "openai_subdomain" {
  description = "The subdomain used to connect to the Cognitive Service Account."
  value       = azurerm_cognitive_account.this.custom_subdomain_name
}

output "private_ip_addresses" {
  description = "A map dictionary of the private IP addresses for each private endpoint."
  value = {
    for key, pe in azurerm_private_endpoint.this : key => pe.private_service_connection[0].private_ip_address
  }
}
