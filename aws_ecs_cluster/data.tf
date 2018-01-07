data "aws_ami" "main" {
  most_recent = true

  filter {
    name   = "name"
    values = "${var.ami_name}"
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "owner-alias"
    values = "${var.ami_owner}"
  }
}
