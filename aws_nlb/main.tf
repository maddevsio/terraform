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
    target_group_arn = "${var.target_group_arn}"
    type             = "forward"
  }
}
