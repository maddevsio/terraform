AWS Network Load Balancer (NLB) Terraform module
================================================

Simple terraform module which creates NLB enpoint with single listener.

Usage
-----

```hcl
module "nlb" {
  source = "git::https://github.com/maddevsio/terraform/tree/master/aws_nlb"

  name             = "example-nlb"
  subnets          = ["subnet-13579", "subnet-24680"]
  is_internal      = false
  port             = 9000
  target_group_arn = "${var.target_group_arn}"
  sns_topic_arn    = "${var.sns_topic_arn}"

  tags {
    Terraform   = "true"
    Environment = "${terraform.workspace}"
  }
}
```
