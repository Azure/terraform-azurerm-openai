resource "modtm_telemetry" "this" {
  tags = {

    avm_git_commit           = "1fe4ed30a5a04d9ce26c8b20111a9fc7720f1c34"
    avm_git_file             = "module_telemetry.tf"
    avm_git_last_modified_at = "2023-11-03 13:26:13"
    avm_git_org              = "Azure"
    avm_git_repo             = "terraform-azurerm-openai"
    avm_yor_name             = "this"
    avm_yor_trace            = "3dca10fd-266a-42da-a3b1-20435e38b99a"
  }
  nonce = 23463

  lifecycle {
    ignore_changes = [nonce]
  }
}