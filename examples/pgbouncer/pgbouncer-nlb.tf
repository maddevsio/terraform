module "pgbouncer-nlb" {
  source = "git::https://github.com/maddevsio/terraform//aws_nlb"

  name          = "${var.name}"
  subnets       = "${var.subnets}"
  is_internal   = false
  port          = "${var.port}"
  vpc_id        = "${var.vpc_id}"
  target_port   = "${var.port}"
  sns_topic_arn = "${aws_sns_topic.pgbouncer.arn}"

  tags {
    Terraform   = "true"
    Environment = "${terraform.workspace}"
  }
}
