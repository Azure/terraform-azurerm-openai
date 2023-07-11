module "openai" {
  source                        = "../.."
  resource_group_name           = azurerm_resource_group.this.name
  location                      = azurerm_resource_group.this.location
  public_network_access_enabled = true
  deployment = {
    "text-davinci-003" = {
      name          = "gpt-35-turbo"
      model_format  = "OpenAI"
      model_name    = "gpt-35-turbo"
      model_version = "0613"
      scale_type    = "Standard"
    },
  }
  depends_on = [
    azurerm_resource_group.this
  ]
}
