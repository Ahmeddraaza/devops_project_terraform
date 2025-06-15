output "app_subdomain_url" {
  value = "http://app.${var.domain_base}"
}

output "metabase_subdomain_url" {
  value = "http://meta.${var.domain_base}"
}
