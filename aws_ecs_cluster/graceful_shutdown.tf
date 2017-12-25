resource "aws_autoscaling_lifecycle_hook" "graceful_shutdown_asg_hook" {
  name                   = "${var.name}-down"
  autoscaling_group_name = "${aws_autoscaling_group.main.name}"
  default_result         = "CONTINUE"
  heartbeat_timeout      = "${var.heartbeat_timeout}"
  lifecycle_transition   = "autoscaling:EC2_INSTANCE_TERMINATING"
}
