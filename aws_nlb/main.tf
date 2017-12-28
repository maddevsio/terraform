resource "aws_lb" "main" {
  load_balancer_type = "network"
  name               = "${var.name}"
  internal           = "${var.is_internal}"
  subnets            = ["${var.subnets}"]

  tags = "${merge(var.tags, map("Name", format("%s", var.name)))}"
}

resource "aws_lb_listener" "main" {
  load_balancer_arn = "${aws_lb.main.arn}"
  port              = "${var.port}"
  protocol          = "TCP"

  default_action {
    target_group_arn = "${aws_lb_target_group.main.arn}"
    type             = "forward"
  }
}

resource "aws_lb_target_group" "main" {
  name                 = "${var.name}"
  port                 = "${var.target_port}"
  protocol             = "TCP"
  vpc_id               = "${var.vpc_id}"
  deregistration_delay = "${var.deregistration_delay}"

  health_check {
    healthy_threshold   = 5
    interval            = 30
    //timeout             = 10
    unhealthy_threshold = 5
    port                = "${var.target_port}"
    protocol            = "TCP"
  }

  tags = "${merge(var.tags, map("Name", format("%s", var.name)))}"
}
