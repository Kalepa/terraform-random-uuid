data "external" "uuid" {
  program = dirname("/") == "\\" ? [
    "powershell.exe",
    "@{uuid = [guid]::NewGuid()} | ConvertTo-Json"
    ] : [
    "bash",
    "-c",
    "echo \"{\\\"uuid\\\": \\\"$((command -v uuidgen &> /dev/null && uuidgen) || cat /proc/sys/kernel/random/uuid || cat /compat/linux/proc/sys/kernel/random/uuid)\\\"}\""
  ]
}
