# Record for app.aura-apparel.com (points to main ALB)
resource "aws_route53_record" "app" {
  zone_id = var.route53_zone_id
  name    = "app.${var.domain_base}"
  type    = "A"

  alias {
    name                   = aws_lb.app_alb.dns_name
    zone_id                = aws_lb.app_alb.zone_id
    evaluate_target_health = true
  }
}

# Record for meta.aura-apparel.com (points to Metabase ALB or instance IP)
resource "aws_route53_record" "metabase" {
  zone_id = var.route53_zone_id
  name    = "meta.${var.domain_base}"
  type    = "A"

  alias {
    name                   = var.metabase_dns_name # This can be another ALB
    zone_id                = var.metabase_zone_id
    evaluate_target_health = true
  }
}
