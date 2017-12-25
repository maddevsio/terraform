output "cluster_name" {
  value = "${aws_ecs_cluster.main.name}"
}

output "cluster_id" {
  value = "${aws_ecs_cluster.main.id}"
}

output "log_group_name" {
  value = "${aws_cloudwatch_log_group.ecs.name}"
}

output "group_name" {
  value = "${aws_autoscaling_group.ecs.name}"
}

output "log_group_arn" {
  value = "${aws_cloudwatch_log_group.ecs.arn}"
}
