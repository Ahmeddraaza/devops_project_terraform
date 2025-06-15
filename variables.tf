variable "route53_zone_id" {
  description = "Hosted zone ID for aura-apparel.com"
  type        = string
}

variable "domain_base" {
  description = "Base domain name"
  default     = "aura-apparel.com"
}

# Metabase specific vars
variable "metabase_dns_name" {
  description = "DNS name of the Metabase target (ALB or EC2 public DNS)"
  type        = string
}

variable "metabase_zone_id" {
  description = "Zone ID of the Metabase ALB (if aliasing it)"
  type        = string
}
