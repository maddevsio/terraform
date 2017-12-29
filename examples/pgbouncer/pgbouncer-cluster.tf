module "pgbouncer-cluster" {
  source = "git::https://github.com/maddevsio/terraform//aws_ecs_cluster"

  name               = "${var.name}"
  subnets            = "${var.subnets}"
  key_name           = "${var.ecs_key_name}"
  instance_type      = "${var.ecs_instance_type}"
  asg_min            = "${var.ecs_asg_min}"
  asg_max            = "${var.ecs_asg_max}"
  asg_desired        = "${var.ecs_asg_desired}"
  public_ip          = false
  ebs_optimized      = true
  docker_volume_size = 20
  security_group_ids = "${aws_security_group.pgbouncer.id}"
  sns_topic_arn      = "${aws_sns_topic.pgbouncer.arn}"

  tags = [
    {
      key                 = "Terraform"
      value               = "true"
      propagate_at_launch = true
    },
    {
      key                 = "Environment"
      value               = "${terraform.workspace}"
      propagate_at_launch = true
    },
  ]
}
