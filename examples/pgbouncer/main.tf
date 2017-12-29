provider "aws" {
  region = "${var.region}"
}

resource "aws_sns_topic" "pgbouncer" {
  name = "${var.name}"
}

data "aws_vpc" "vpc" {
  id = "${var.vpc_id}"
}

// PGBOUNCER Security Group
resource "aws_security_group" "pgbouncer" {
  name   = "${var.name}"
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port = "${var.port}"
    to_port   = "${var.port}"
    protocol  = "tcp"

    //cidr_blocks = ["${data.aws_vpc.vpc.cidr_block}"]
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name        = "${var.name}"
    Terraform   = "true"
    Environment = "${terraform.workspace}"
  }
}
