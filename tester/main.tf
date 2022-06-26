module "uuid" {
  source           = "../"
  unix_interpreter = var.unix_interpreter
}

module "assert_valid_uuid" {
  source        = "Invicton-Labs/assertion/null"
  version       = "~>0.2.1"
  condition     = length(regexall("[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}", module.uuid.uuid)) == 1
  error_message = "The UUID must match the regex \"[a-f0-9]{8}-[a-f0-9]{4}[a-f0-9]{4}[a-f0-9]{4}[a-f0-9]{12}\". The received UUID (${module.uuid.uuid}) does not."
}

output "checked" {
  value = module.assert_valid_uuid.checked ? module.uuid.uuid : null
}
