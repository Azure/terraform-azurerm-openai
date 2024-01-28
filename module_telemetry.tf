resource "modtm_telemetry" "this" {
  tags = {

    avm_git_commit           = "afc3df8815bed913088075c17ab5b7dbe94633d6"
    avm_git_file             = "module_telemetry.tf"
    avm_git_last_modified_at = "2024-01-28 22:51:17"
    avm_git_org              = "Azure"
    avm_git_repo             = "terraform-azurerm-openai"
    avm_yor_name             = "this"
    avm_yor_trace            = "0595de0a-d0b6-4ea8-a85f-bac99e56a41b"
  }
  ephemeral_number = 3035

  lifecycle {
    ignore_changes = [ephemeral_number]
  }
}