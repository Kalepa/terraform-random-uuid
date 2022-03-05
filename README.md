# Terraform UUID

This module functions similarly to the `uuid()` function, except that it produces a UUID value during the plan step, which remains consistent through to the apply step.

On Windows, it will use PowerShell's built-in `[guid]::NewGuid()` function. On Unix, it will use the first of the following methods that is available:
- `uuidgen` (if it's installed)
- `cat /proc/sys/kernel/random/uuid` (most Linux systems)
- `cat /compat/linux/proc/sys/kernel/random/uuid` (FreeBSD)

## Usage

```
module "uuid" {
  source = "Invicton-Labs/uuid/null"
}

output "uuid" {
  value = module.uuid.uuid
}
```

Note that it knows the new output value prior to applying.
```
Changes to Outputs:
  ~ uuid = "0446f814-250f-4df3-9815-baddb952285f" -> "af7e0bea-08e0-4a60-a165-8a4847862276"

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes


Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

uuid = "af7e0bea-08e0-4a60-a165-8a4847862276"
```
