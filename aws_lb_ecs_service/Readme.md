AWS ECS Service Terraform module
================================================

Simple terraform module which creates ECS service and registers it on LB with preassigned target group.

Usage
-----

```hcl
module "example_service" {
  source = "git::https://github.com/maddevsio/terraform//aws_lb_ecs_service"

  name             = "example-ecs-service"
  service_memory   = 500
  desired_count    = 2
  container_port   = 9000
  cluster_id       = "${var.cluster_id}"
  cluster_name     = "${var.cluster_name}"
  target_group_arn = "${var.target_group_arn}"
  task_role_arn    = "${var.task_role_arn}"
  task_definition  = "${file("${path.module}/task-definition.json")}"
  sns_topic_arn    = "${var.sns_topic_arn}"
}
```
