resource "modtm_telemetry" "this" {
  tags = {

    avm_git_commit           = "edfb556e861b31be732337674f105f9de8e87f13"
    avm_git_file             = "module_telemetry.tf"
    avm_git_last_modified_at = "2023-12-12 09:55:42"
    avm_git_org              = "Azure"
    avm_git_repo             = "terraform-azurerm-openai"
    avm_yor_name             = "this"
    avm_yor_trace            = "0ba6cfcb-5a95-4ef6-8742-cc7ab9a4812a"
  }
  nonce = 2296

  lifecycle {
    ignore_changes = [nonce]
  }
}