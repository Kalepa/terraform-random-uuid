data "external" "uuid" {
  program = dirname("/") == "\\" ? [
    "powershell.exe",
    "@{uuid = [guid]::NewGuid()} | ConvertTo-Json"
    ] : [
    local.var_unix_interpreter,
    "-c",
    "echo \"{\\\"uuid\\\": \\\"$(if [ command -v uuidgen &> /dev/null ]; then uuidgen; elif [ -e /proc/sys/kernel/random/uuid ]; then cat /proc/sys/kernel/random/uuid; elif [ -e /compat/linux/proc/sys/kernel/random/uuid ]; then cat /compat/linux/proc/sys/kernel/random/uuid; elif [ -e /dev/urandom ]; then head -c 10000 /dev/urandom | LC_ALL=C tr -dc 'a-f0-9' | head -c 32; else head -c 10000 /dev/random | LC_ALL=C tr -dc 'a-f0-9' | head -c 32; fi)\\\"}\""
  ]
}

locals {
  // Not all generation methods will include the hyphen, so strip it out
  generated = replace(lower(data.external.uuid.result.uuid), "-", "")
  // And then properly format the UUID from just the hex characters
  uuid = "${substr(local.generated, 0, 8)}-${substr(local.generated, 8, 4)}-${substr(local.generated, 12, 4)}-${substr(local.generated, 16, 4)}-${substr(local.generated, 20, 12)}"
}
