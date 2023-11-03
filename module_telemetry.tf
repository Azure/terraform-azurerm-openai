resource "modtm_telemetry" "this" {
  tags = {

  }
  nonce = 12786

  lifecycle {
    ignore_changes = [nonce]
  }
}