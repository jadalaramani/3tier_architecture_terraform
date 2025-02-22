variable "godaddy_api_key" {
  description = "GoDaddy API Key"
  type        = string
  sensitive   = true
}

variable "godaddy_api_secret" {
  description = "GoDaddy API Secret"
  type        = string
  sensitive   = true
}

variable "domain_name" {
  description = "Domain name in GoDaddy"
  type        = string
}

variable "route53_zone_id" {
  description = "AWS Route53 Hosted Zone ID"
  type        = string
}
