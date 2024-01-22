resource "modtm_telemetry" "this" {
  tags = {

    avm_git_commit           = "995f37c63c802af392729e2c9e79c15d84424a66"
    avm_git_file             = "module_telemetry.tf"
    avm_git_last_modified_at = "2024-01-22 19:52:31"
    avm_git_org              = "Azure"
    avm_git_repo             = "terraform-azurerm-openai"
    avm_yor_name             = "this"
    avm_yor_trace            = "7e91499f-5e67-4d16-97b6-319eda372e4d"
  }
  ephemeral_number = 15617

  lifecycle {
    ignore_changes = [ephemeral_number]
  }
}