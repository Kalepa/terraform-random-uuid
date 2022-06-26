output "uuid" {
  value = module.assert_valid_uuid.checked ? module.uuid.uuid : null
}
