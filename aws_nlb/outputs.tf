output "dns_name" {
  value = "${aws_lb.main.dns_name}"
}

output "arn_suffix" {
  value = "${aws_lb.main.arn_suffix}"
}

output "arn" {
  value = "${aws_lb.main.arn}"
}

output "zone_id" {
  value = "${aws_lb.main.zone_id}"
}

output "target_group_arn" {
  value = "${aws_lb_target_group.main.arn}"
}
