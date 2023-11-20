resource "modtm_telemetry" "this" {
  tags = {

    avm_git_commit           = "9afe6b69f450912951236a0d59029cea83ede48e"
    avm_git_file             = "module_telemetry.tf"
    avm_git_last_modified_at = "2023-11-20 10:16:12"
    avm_git_org              = "Azure"
    avm_git_repo             = "terraform-azurerm-openai"
    avm_yor_name             = "this"
    avm_yor_trace            = "9d6c725a-409c-41d6-9caf-a55703d05dd7"
  }
  nonce = 21859

  lifecycle {
    ignore_changes = [nonce]
  }
}