resource "aws_ecs_task_definition" "main" {
  family                = "${var.name}"
  container_definitions = "${var.task_definition}"
  task_role_arn         = "${var.task_role_arn}"
}

resource "aws_ecs_service" "main" {
  name            = "${var.name}"
  cluster         = "${var.cluster_id}"
  task_definition = "${aws_ecs_task_definition.main.arn}"
  desired_count   = "${var.desired_count}"
  iam_role        = "${aws_iam_role.main.arn}"

  deployment_minimum_healthy_percent = 50

  load_balancer {
    target_group_arn = "${var.target_group_arn}"
    container_name   = "${var.name}"
    container_port   = "${var.container_port}"
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes        = ["desired_count"]
  }
}

resource "aws_cloudwatch_metric_alarm" "ecs_service_cpu_high" {
  alarm_name          = "${var.name}-high-cpu-${var.alarm_cpu_threshold}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "60"
  statistic           = "Average"
  threshold           = "${var.alarm_cpu_threshold}"
  unit                = "Percent"

  dimensions {
    ClusterName = "${var.cluster_name}"
    ServiceName = "${var.name}"
  }

  alarm_description = "This metric monitors CPU utilisation"
  alarm_actions     = ["${var.sns_topic_arn}"]
}

resource "aws_cloudwatch_metric_alarm" "ecs_service_memory_high" {
  alarm_name          = "${var.name}-high-memory-${var.alarm_memory_threshold}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = "60"
  statistic           = "Average"
  threshold           = "${var.alarm_memory_threshold}"
  unit                = "Percent"

  dimensions {
    ClusterName = "${var.cluster_name}"
    ServiceName = "${var.name}"
  }

  alarm_description = "This metric monitors memory consumption"
  alarm_actions     = ["${var.sns_topic_arn}"]
}
