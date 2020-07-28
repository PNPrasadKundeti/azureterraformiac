variable "az_subscription_id" {}
variable "location"{
    default = "southeastasia"
}

variable "prefix" {
  default = "example-machine"
}

locals {
  vm_name = "${var.prefix}-vm"
}