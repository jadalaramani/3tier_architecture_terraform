provider "godaddy" {
 # api_key    = var.godaddy_api_key
 # api_secret = var.godaddy_api_secret
}

data "aws_route53_zone" "selected" {
  zone_id = var.route53_zone_id
}

resource "godaddy_dns_record" "ns_record" {
  domain  = var.domain_name
  type    = "NS"
  ttl     = 3600
  records = data.aws_route53_zone.selected.name_servers
}
