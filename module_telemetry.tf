resource "modtm_telemetry" "this" {
  tags = {

    avm_git_commit           = "a74763da8d8966df560383196df2f51cb25994dd"
    avm_git_file             = "module_telemetry.tf"
    avm_git_last_modified_at = "2024-01-12 12:11:03"
    avm_git_org              = "Azure"
    avm_git_repo             = "terraform-azurerm-openai"
    avm_yor_name             = "this"
    avm_yor_trace            = "0b41d2fb-6567-4814-bc09-e52394075799"
  }
  ephemeral_number = 15617

  lifecycle {
    ignore_changes = [ephemeral_number]
  }
}