AWS Network Load Balancer (NLB) Terraform module
================================================

Simple terraform module which creates NLB enpoint with single listener and target group.

Usage
-----

```hcl
module "nlb" {
  source = "git::https://github.com/maddevsio/terraform//aws_nlb"

  name          = "example-nlb"
  subnets       = ["subnet-13579", "subnet-24680"]
  is_internal   = false
  port          = 9000
  vps_id        = "${var.vpc_id}"
  target_port   = 9000
  sns_topic_arn = "${var.sns_topic_arn}"

  tags {
    Terraform   = "true"
    Environment = "${terraform.workspace}"
  }
}
```
