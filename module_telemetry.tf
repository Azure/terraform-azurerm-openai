resource "modtm_telemetry" "this" {
  tags = {

    avm_git_commit           = "1dcc58dfb3068da744e544a3c3d3b331334fa02c"
    avm_git_file             = "module_telemetry.tf"
    avm_git_last_modified_at = "2024-01-08 12:58:46"
    avm_git_org              = "Azure"
    avm_git_repo             = "terraform-azurerm-openai"
    avm_yor_name             = "this"
    avm_yor_trace            = "716ffbf3-10e5-4b35-af46-b347dfd15d83"
  }
  ephemeral_number = 30079

  lifecycle {
    ignore_changes = [ephemeral_number]
  }
}