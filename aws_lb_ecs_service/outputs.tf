output "task_definition_family" {
  value = "${aws_ecs_task_definition.td.family}"
}

output "name" {
  value = "${aws_ecs_service.main.name}"
}

output "iam_role" {
  value = "${aws_ecs_service.main.iam_role}"
}
