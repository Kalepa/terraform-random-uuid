output "uuid" {
    description = "The generated UUID."
    value = lower(data.external.uuid.result.uuid)
}
