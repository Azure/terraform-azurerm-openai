resource "modtm_telemetry" "this" {
  tags = {

    avm_git_commit           = "85058677c04067d191d46e38e173e11d00caafa2"
    avm_git_file             = "module_telemetry.tf"
    avm_git_last_modified_at = "2024-01-29 15:15:29"
    avm_git_org              = "Azure"
    avm_git_repo             = "terraform-azurerm-openai"
    avm_yor_name             = "this"
    avm_yor_trace            = "bbfeb8dc-4a52-40ab-b156-4e709a8e867e"
  }
  ephemeral_number = 18499

  lifecycle {
    ignore_changes = [ephemeral_number]
  }
}