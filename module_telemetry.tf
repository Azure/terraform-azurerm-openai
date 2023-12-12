resource "modtm_telemetry" "this" {
  tags = {

    avm_git_commit           = "1c1585cb2e7dfb18c2699fb3203cea684cd7d7a3"
    avm_git_file             = "module_telemetry.tf"
    avm_git_last_modified_at = "2023-12-11 09:48:21"
    avm_git_org              = "Azure"
    avm_git_repo             = "terraform-azurerm-openai"
    avm_yor_name             = "this"
    avm_yor_trace            = "7ce8b5ae-e32f-461e-971e-a40d8174b753"
  }
  nonce = 2296

  lifecycle {
    ignore_changes = [nonce]
  }
}