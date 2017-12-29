Terraform Module to create AWS resources to run PGBouncer
================================================

Module creates AWS Network LB, ECS cluster, Autoscaling group and pgbouncer service

Usage
-----
* Download latest [terraform](https://www.terraform.io/downloads.html)
* Configure pgbouncer by editing docker/pgbouncer.ini and docker/userlist.txt
* Set terraform variables through env, tfvars or by setting defaults in variables.tf
* run `terraform init`
* run `terraform apply`
