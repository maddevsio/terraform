output "pgbouncer_endpoint" {
  value = "${module.pgbouncer-nlb.dns_name}:${var.port}"
}
