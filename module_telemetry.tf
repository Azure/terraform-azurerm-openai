resource "modtm_telemetry" "this" {
  tags = {

    avm_git_commit           = "7f2d515e046058767a5426adf45cae565f5272cb"
    avm_git_file             = "module_telemetry.tf"
    avm_git_last_modified_at = "2023-11-14 08:39:45"
    avm_git_org              = "Azure"
    avm_git_repo             = "terraform-azurerm-openai"
    avm_yor_name             = "this"
    avm_yor_trace            = "ff104cd4-caac-4001-92bc-fc960726a6f9"
  }
  nonce = 21859

  lifecycle {
    ignore_changes = [nonce]
  }
}