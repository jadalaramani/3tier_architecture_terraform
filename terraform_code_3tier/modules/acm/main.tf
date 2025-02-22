resource "aws_acm_certificate" "b15facebook_cert" {
  domain_name               = var.domain_name
  validation_method         = "DNS"
  subject_alternative_names = var.san_names

  lifecycle {
    create_before_destroy = true
    ignore_changes        = [domain_validation_options]
  }
}
