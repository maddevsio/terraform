resource "aws_cloudwatch_metric_alarm" "tcp_client_resets" {
  alarm_name          = "${var.name}-client-resets"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "TCP_Client_Reset_Count"
  namespace           = "AWS/NetworkELB"
  period              = "60"
  statistic           = "Average"
  threshold           = "${var.tcp_client_resets}"
  unit                = "Count"

  dimensions {
    LoadBalancer = "${aws_lb.main.arn_suffix}"
  }

  alarm_description = "This metric monitors reset counts on the client"
  alarm_actions     = ["${var.sns_topic_arn}"]
}

resource "aws_cloudwatch_metric_alarm" "tcp_target_resets" {
  alarm_name          = "${var.name}-target-resets"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "TCP_Target_Reset_Count"
  namespace           = "AWS/NetworkELB"
  period              = "60"
  statistic           = "Average"
  threshold           = "${var.tcp_target_resets}"
  unit                = "Count"

  dimensions {
    LoadBalancer = "${aws_lb.main.arn_suffix}"
  }

  alarm_description = "This metric monitors reset counts on the target"
  alarm_actions     = ["${var.sns_topic_arn}"]
}

resource "aws_cloudwatch_metric_alarm" "tcp_elb_resets" {
  alarm_name          = "${var.name}-elb-resets"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "TCP_ELB_Reset_Count"
  namespace           = "AWS/NetworkELB"
  period              = "60"
  statistic           = "Average"
  threshold           = "${var.tcp_elb_resets}"
  unit                = "Count"

  dimensions {
    LoadBalancer = "${aws_lb.main.arn_suffix}"
  }

  alarm_description = "This metric monitors reset counts on the LB"
  alarm_actions     = ["${var.sns_topic_arn}"]
}

resource "aws_cloudwatch_metric_alarm" "lb_processed_bytes" {
  alarm_name          = "${var.name}-bytes"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "ProcessedBytes"
  namespace           = "AWS/NetworkELB"
  period              = "120"
  statistic           = "Average"
  threshold           = "${var.lb_processed_bytes}"
  unit                = "Bytes"

  dimensions {
    LoadBalancer = "${aws_lb.main.arn_suffix}"
  }

  alarm_description = "This metric monitors bytes processed by LB"
  alarm_actions     = ["${var.sns_topic_arn}"]
}

resource "aws_cloudwatch_metric_alarm" "active_flow_count" {
  alarm_name          = "${var.name}-active-flows"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "ActiveFlowCount"
  namespace           = "AWS/NetworkELB"
  period              = "120"
  statistic           = "Average"
  threshold           = "${var.active_flow_count}"
  unit                = "Count"

  dimensions {
    LoadBalancer = "${aws_lb.main.arn_suffix}"
  }

  alarm_description = "This metric monitors active flow count"
  alarm_actions     = ["${var.sns_topic_arn}"]
}

resource "aws_cloudwatch_metric_alarm" "new_flow_count" {
  alarm_name          = "${var.name}-new-flows"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "NewFlowCount"
  namespace           = "AWS/NetworkELB"
  period              = "60"
  statistic           = "Average"
  threshold           = "${var.new_flow_count}"
  unit                = "Count"

  dimensions {
    LoadBalancer = "${aws_lb.main.arn_suffix}"
  }

  alarm_description = "This metric monitors new flow count"
  alarm_actions     = ["${var.sns_topic_arn}"]
}
