AWS ECS Cluster Terraform module
================================================

A terraform module which creates ECS cluster with simple autoscaling group.

Usage
-----

```hcl
module "ecs-clister" {
  source = "git::https://github.com/maddevsio/terraform//aws_ecs_cluster"

  name               = "example-ecs"
  subnets            = ["subnet-13579", "subnet-24680"]
  key_name           = "ecs"
  instance_type      = "c4.large"
  asg_min            = 2
  asg_max            = 6
  asg_desired        = 4
  public_ip          = false
  ebs_optimized      = true
  docker_volume_size = 50
  security_group_ids = [${var.security_group_ids}]
  sns_topic_arn = "${var.sns_topic_arn}"

  tags {
    Terraform   = "true"
    Environment = "${terraform.workspace}"
  }
}
```
