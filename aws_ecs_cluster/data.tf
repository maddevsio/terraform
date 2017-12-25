data "template_file" "main" {
  template = "${file("${path.module}/user-data/instance.tpl")}"

  vars {
    cluster_name = "${aws_ecs_cluster.main.name}"
  }
}

data "aws_ami" "main" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn-ami-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
}
