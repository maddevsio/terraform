provider "aws" {
  region = "${var.region}"
}

resource "aws_key_pair" "main" {
  key_name   = "${var.name}"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

module "linuxkit-cluster" {
  source = "git::https://github.com/maddevsio/terraform//aws_ecs_cluster?ref=linuxkit"

  name               = "${var.name}"
  subnets            = ["subnet-aaaaaaaa", "subnet-bbbbbbbb"]
  key_name           = "${aws_key_pair.main.key_name}"
  instance_type      = "t2.small"
  ami_name           = ["${var.name}*"]
  ami_owner          = ["self"]
  asg_min            = 0
  asg_max            = 2
  asg_desired        = 1
  public_ip          = true
  ebs_optimized      = false
  docker_volume_size = 20
  security_group_ids = "sg-22222222"
  sns_topic_arn      = "arn:aws:sns:us-east-1:xxxxxxxx"

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
