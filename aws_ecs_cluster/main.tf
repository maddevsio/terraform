resource "aws_ecs_cluster" "main" {
  name = "${var.name}"
}

resource "aws_cloudwatch_log_group" "main" {
  name = "${var.name}"
}

resource "aws_autoscaling_group" "main" {
  name                  = "${var.name}"
  vpc_zone_identifier   = ["${var.subnet_id}"]
  min_size              = "${var.asg_min}"
  max_size              = "${var.asg_max}"
  desired_capacity      = "${var.asg_desired}"
  launch_configuration  = "${aws_launch_configuration.main.name}"
  termination_policies  = ["OldestInstance", "OldestLaunchConfiguration"]
  protect_from_scale_in = "${var.protect_from_scale_in}"

  lifecycle {
    create_before_destroy = true
  }

  /*  
  initial_lifecycle_hook {
    name                 = "${var.name}-up"
    default_result       = "CONTINUE"
    heartbeat_timeout    = 60
    lifecycle_transition = "autoscaling:EC2_INSTANCE_LAUNCHING"
  } 
*/

  tags = ["${concat(
    list(
      map("key", "Name", "value", "${format("%s", var.name)}", "propagate_at_launch", true)
    ),
    var.tags
  )}"]

}

resource "aws_launch_configuration" "main" {
  name_prefix                 = "${var.name}"
  key_name                    = "${var.key_name}"
  image_id                    = "${data.aws_ami.main.id}"
  instance_type               = "${var.instance_type}"
  iam_instance_profile        = "${aws_iam_instance_profile.main.name}"
  security_groups             = ["${var.security_group_ids}"]
  associate_public_ip_address = "${var.public_ip}"
  ebs_optimized               = "${var.ebs_optimized}"

  user_data = "${data.template_file.main.rendered}"

  root_block_device {
    volume_size           = "10"
    volume_type           = "gp2"
    delete_on_termination = true
  }

  ebs_block_device {
    device_name           = "/dev/xvdcz"
    volume_size           = "${var.docker_volume_size}"
    volume_type           = "gp2"
    delete_on_termination = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
