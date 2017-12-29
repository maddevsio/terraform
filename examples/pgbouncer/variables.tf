variable "region" {
  default = "us-east-1"
}

variable "ecs_key_name" {}

variable "name" {
  default = "pgbouncer"
}

variable "port" {
  default = 5432
}

variable "ecs_instance_type" {
  default = "c4.large"
}

variable "ecs_public_ip" {
  default = false
}

variable "ecs_ebs_optimized" {
  default = true
}

variable "ecs_asg_min" {
  default = 2
}

variable "ecs_asg_max" {
  default = 4
}

variable "ecs_asg_desired" {
  default = 2
}

variable "vpc_id" {}

variable "subnets" {
  type = "list"
}
