resource "modtm_telemetry" "this" {
  tags = {

    avm_git_commit           = "a853a10b599c714dff8fd8649e4e111ca4865cc2"
    avm_git_file             = "module_telemetry.tf"
    avm_git_last_modified_at = "2023-11-21 12:52:46"
    avm_git_org              = "Azure"
    avm_git_repo             = "terraform-azurerm-openai"
    avm_yor_name             = "this"
    avm_yor_trace            = "364d97b3-3711-47e6-89d5-9d7281996d1c"
  }
  nonce = 23932

  lifecycle {
    ignore_changes = [nonce]
  }
}