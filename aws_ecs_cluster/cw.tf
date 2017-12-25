resource "aws_cloudwatch_metric_alarm" "ecs_cluster_cpu_high" {
  alarm_name          = "${aws_ecs_cluster.main.name}-cluster-high-cpu-${var.alarm_memory_threshold}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "60"
  statistic           = "Average"
  threshold           = "${var.alarm_cpu_threshold}"
  unit                = "Percent"

  dimensions {
    ClusterName = "${aws_ecs_cluster.main.name}"
  }

  alarm_description = "This metric monitors cluster's CPU load"
  alarm_actions     = ["${var.sns_topic_arn}"]
}

resource "aws_cloudwatch_metric_alarm" "ecs_cluster_memory_high" {
  alarm_name          = "${aws_ecs_cluster.main.name}-cluster-high-memory-${var.alarm_memory_threshold}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = "60"
  statistic           = "Average"
  threshold           = "${var.alarm_memory_threshold}"
  unit                = "Percent"

  dimensions {
    ClusterName = "${aws_ecs_cluster.main.name}"
  }

  alarm_description = "This metric monitors cluster's memory consumption"
  alarm_actions     = ["${var.sns_topic_arn}"]
}

resource "aws_cloudwatch_metric_alarm" "ecs_asg_failed" {
  alarm_name          = "${aws_autoscaling_group.main.name}-group-failed"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "StatusCheckFailed"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "0"
  unit                = "Count"

  dimensions {
    AutoScalingGroupName = "${aws_autoscaling_group.main.name}"
  }

  alarm_description = "This metric monitors failed status of ecs instances"
  alarm_actions     = ["${var.sns_topic_arn}"]
}
