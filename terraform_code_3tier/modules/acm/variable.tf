variable "domain_name" {
  description = "Primary domain name for the ACM certificate"
  type        = string
}

variable "san_names" {
  description = "List of Subject Alternative Names (SANs) for the certificate"
  type        = list(string)
  default     = []
}
