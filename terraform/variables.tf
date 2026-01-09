variable "admin_password" {
  type      = string
  sensitive = true
}

variable "ssh_source_cidr" {
  type        = string
  description = "IP público em formato /32"
  default     = "*"
}
