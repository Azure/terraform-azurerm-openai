module "openai" {
  source              = "../.."
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  deployment = {
    "text-davinci-003" = {
      name          = "text-davinci-003"
      model_format  = "OpenAI"
      model_name    = "text-davinci-003"
      model_version = "1"
      scale_type    = "Standard"
    },
  }
  depends_on = [
    azurerm_resource_group.this
  ]
}