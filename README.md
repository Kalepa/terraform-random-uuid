![Build](https://github.com/Invicton-Labs/terraform-random-uuid/actions/workflows/CICD.yml/badge.svg)

# Terraform UUID

On the Terraform Registry: [Invicton-Labs/uuid/random](https://registry.terraform.io/modules/Invicton-Labs/uuid/random/latest)

This module functions similarly to the `uuid()` function, except that it produces a UUID value during the plan step which remains consistent through to the apply step.

On Windows, it will use PowerShell's built-in `[guid]::NewGuid()` function. On Unix, it will use the first of the following methods that is available:
- `uuidgen` (if it's installed)
- `cat /proc/sys/kernel/random/uuid` (most Linux systems)
- `cat /compat/linux/proc/sys/kernel/random/uuid` (FreeBSD)
- `/dev/urandom` (other Unix-based systems, e.g. MacOS)
- `/dev/random` (other Unix-based systems, e.g. MacOS)

Regardless of the method that it uses, it guarantees that the output always matches the expected UUID format with hyphens.

## Usage

```
module "uuid" {
  source = "Invicton-Labs/uuid/random"
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
