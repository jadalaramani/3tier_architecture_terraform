output "ns_records" {
  value = data.aws_route53_zone.selected.name_servers
}
