variable "unix_interpreter" {
  description = "The interpreter to use when running commands on a Unix-based system. This is primarily used for testing, and should usually be left to the default value."
  type        = string
  default     = "/bin/sh"
}
locals {
  var_unix_interpreter = var.unix_interpreter != null ? var.unix_interpreter : "/bin/sh"
}
