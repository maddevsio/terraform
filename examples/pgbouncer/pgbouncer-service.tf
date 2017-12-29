data "template_file" "pgbouncer_definition" {
  template = "${file("${path.module}/user-data/pgbouncer-definition.json")}"

  vars {
    container_name   = "${var.name}"
    environment      = "${var.name}-${var.region}"
    container_port   = "${var.port}"
    host_port        = "${var.port}"
    image_url        = "${aws_ecr_repository.pgbouncer.repository_url}"
    memory           = 3000
    log_group_region = "${var.region}"
    log_group_stream = "${var.name}"
    log_group_name   = "${module.pgbouncer-cluster.log_group_name}"
  }
}

module "pgbouncer-service" {
  source = "git::https://github.com/maddevsio/terraform//aws_lb_ecs_service"

  name             = "${var.name}"
  desired_count    = 2
  container_port   = "${var.port}"
  cluster_id       = "${module.pgbouncer-cluster.cluster_id}"
  cluster_name     = "${module.pgbouncer-cluster.cluster_name}"
  target_group_arn = "${module.pgbouncer-nlb.target_group_arn}"
  task_definition  = "${data.template_file.pgbouncer_definition.rendered}"
  sns_topic_arn    = "${aws_sns_topic.pgbouncer.arn}"
}
