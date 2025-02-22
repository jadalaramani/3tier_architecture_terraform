variable "alb_name" {
  description = "Name of the ALB"
  type        = string
}

variable "origin_id" {
  description = "Origin ID for CloudFront"
  type        = string
  default     = "frontend-alb"
}

variable "acm_certificate_arn" {
  description = "ACM certificate ARN for CloudFront"
  type        = string
}
