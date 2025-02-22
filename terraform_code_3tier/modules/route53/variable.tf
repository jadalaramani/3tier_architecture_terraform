variable "vpc_id" {
  description = "VPC ID for private hosted zone"
  type        = string
}

variable "rds_private_zone_name" {
  description = "The name of the private hosted zone for RDS"
  type        = string
  default     = "rds.com"
}

variable "rds_record_name" {
  description = "The record name for RDS endpoint"
  type        = string
  default     = "book.rds.com"
}

variable "rds_endpoint" {
  description = "The RDS endpoint"
  type        = string
}

variable "public_zone_name" {
  description = "The name of the public hosted zone"
  type        = string
  default     = "b15facebook.xyz"
}

variable "alb_record_name" {
  description = "The record name for the backend ALB"
  type        = string
  default     = "api.b15facebook.xyz"
}

variable "alb_dns_name" {
  description = "The DNS name of the backend ALB"
  type        = string
}
