resource "modtm_telemetry" "this" {
  tags = {

    avm_git_commit           = "5b6c653baf3d148ace1d69cb97b317f0ff1b18ac"
    avm_git_file             = "module_telemetry.tf"
    avm_git_last_modified_at = "2023-12-19 10:03:02"
    avm_git_org              = "Azure"
    avm_git_repo             = "terraform-azurerm-openai"
    avm_yor_name             = "this"
    avm_yor_trace            = "33f7d085-e45f-46e4-8e1a-0b9054ac2ccc"
  }
  nonce = 13750

  lifecycle {
    ignore_changes = [nonce]
  }
}