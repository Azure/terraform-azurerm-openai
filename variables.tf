variable "location" {
  type        = string
  description = "Azure OpenAI deployment region. Set this variable to `null` would use resource group's location."
}

variable "resource_group_name" {
  type        = string
  description = "Name of the azure resource group to use. The resource group must exist."
}

variable "application_name" {
  type        = string
  default     = ""
  description = "Name of the application. A corresponding tag would be created on the created resources if `var.default_tags_enabled` is `true`."
}

variable "azureopenai_account_name" {
  type        = string
  default     = ""
  description = "Specifies the name of the Cognitive Service Account. Changing this forces a new resource to be created. Leave this variable as default would use a default name with random suffix."
}

variable "azureopenai_customsubdomain_name" {
  type        = string
  default     = ""
  description = "The subdomain name used for token-based authentication. Changing this forces a new resource to be created. Leave this variable as default would use a default name with random suffix."
}

variable "access_from_private_endpoint" {
  type        = bool
  default     = false
  description = "Specifies whether access to the Azure OpenAI account is done throught private endpoint. Changing this forces a new resource to be created. Default to false."
}

variable "default_tags_enabled" {
  type        = bool
  default     = false
  description = "Determines whether or not default tags are applied to resources. If set to true, tags will be applied. If set to false, tags will not be applied."
  nullable    = false
}

variable "deployment" {
  type = map(object({
    name            = string
    model_format    = string
    model_name      = string
    model_version   = string
    scale_type      = string
    rai_policy_name = optional(string)
  }))
  default     = {}
  description = <<-DESCRIPTION
      type = map(object({
        name                 = (Required) The name of the Cognitive Services Account Deployment. Changing this forces a new resource to be created.
        cognitive_account_id = (Required) The ID of the Cognitive Services Account. Changing this forces a new resource to be created.
        model = {
          model_format  = (Required) The format of the Cognitive Services Account Deployment model. Changing this forces a new resource to be created. Possible value is OpenAI.
          model_name    = (Required) The name of the Cognitive Services Account Deployment model. Changing this forces a new resource to be created.
          model_version = (Required) The version of Cognitive Services Account Deployment model.
        }
        scale = {
          scale_type = (Required) Deployment scale type. Possible value is Standard. Changing this forces a new resource to be created.
        }
        rai_policy_name = (Optional) The name of RAI policy. Changing this forces a new resource to be created.
      }))
  DESCRIPTION
  nullable    = false
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment of the application. A corresponding tag would be created on the created resources if `var.default_tags_enabled` is `true`."
}

# tflint-ignore: terraform_unused_declarations
variable "network_acls_default_action" {
  type        = string
  default     = "Deny"
  description = "Azure OpenAI account network ACLs default action."
}

variable "pe_subresource" {
  type        = list(string)
  default     = ["account"]
  description = "A list of subresource names which the Private Endpoint is able to connect to. `subresource_names` corresponds to `group_id`. Possible values are detailed in the product [documentation](https://docs.microsoft.com/azure/private-link/private-endpoint-overview#private-link-resource) in the `Subresources` column. Changing this forces a new resource to be created."
}

variable "private_dns_zone" {
  type = object({
    name                = string
    resource_group_name = optional(string)
  })
  default     = null
  description = <<-DESCRIPTION
  A map of object that represents the existing Private DNS Zone you'd like to use. Leave this variable as default would create a new Private DNS Zone.
  type = object({
    name = "(Required) The name of the Private DNS Zone."
    resource_group_name = "(Optional) The Name of the Resource Group where the Private DNS Zone exists. If the Name of the Resource Group is not provided, the first Private DNS Zone from the list of Private DNS Zones in your subscription that matches `name` will be returned."
  }
DESCRIPTION
}

variable "private_endpoint" {
  type = map(object({
    name                               = string
    vnet_rg_name                       = string
    vnet_name                          = string
    subnet_name                        = string
    dns_zone_virtual_network_link_name = optional(string, "dns_zone_link")
    private_dns_entry_enabled          = optional(bool, false)
    private_service_connection_name    = optional(string, "privateserviceconnection")
    is_manual_connection               = optional(bool, false)
  }))
  default     = {}
  description = <<-DESCRIPTION
  A map of objects that represent the configuration for a private endpoint."
  type = map(object({
    name = (Required) Specifies the Name of the Private Endpoint. Changing this forces a new resource to be created.
    vnet_rg_name = (Required) Specifies the name of the Resource Group where the Private Endpoint's Virtual Network Subnet exists. Changing this forces a new resource to be created.
    vnet_name = (Required) Specifies the name of the Virtual Network where the Private Endpoint's Subnet exists. Changing this forces a new resource to be created.
    subnet_name = (Required) Specifies the name of the Subnet which Private IP Addresses will be allocated for this Private Endpoint. Changing this forces a new resource to be created.
    dns_zone_virtual_network_link_name = (Optional) The name of the Private DNS Zone Virtual Network Link. Changing this forces a new resource to be created. Default to `dns_zone_link`.
    private_dns_entry_enabled = (Optional) Whether or not to create a `private_dns_zone_group` block for the Private Endpoint. Default to `false`.
    private_service_connection_name = (Optional) Specifies the Name of the Private Service Connection. Changing this forces a new resource to be created. Default to `privateserviceconnection`.
    is_manual_connection = (Optional) Does the Private Endpoint require Manual Approval from the remote resource owner? Changing this forces a new resource to be created. Default to `false`.
  }))
DESCRIPTION
  nullable    = false
}

variable "public_network_access_enabled" {
  type        = bool
  default     = false
  description = "Whether public network access is allowed for the Cognitive Account. Defaults to `false`."
}

variable "sku_name" {
  type        = string
  default     = "S0"
  description = "Specifies the SKU Name for this Cognitive Service Account. Possible values are `F0`, `F1`, `S0`, `S`, `S1`, `S2`, `S3`, `S4`, `S5`, `S6`, `P0`, `P1`, `P2`, `E0` and `DC0`. Default to `S0`."
}
