output "cluster_name" {
  value = "${aws_ecs_cluster.main.name}"
}

output "cluster_id" {
  value = "${aws_ecs_cluster.main.id}"
}

output "log_group_name" {
  value = "${aws_cloudwatch_log_group.main.name}"
}

output "group_name" {
  value = "${aws_autoscaling_group.main.name}"
}

output "log_group_arn" {
  value = "${aws_cloudwatch_log_group.main.arn}"
}
