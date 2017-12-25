variable "name" {
  description = "A name of the cluster"
}

variable "key_name" {
  description = "SSH key name"
}

variable "instance_type" {
  description = "ECS Instance type"
  default     = "t2.small"
}

variable "asg_min" {
  description = "Minimem autoscaling group size"
  default     = 0
}

variable "asg_max" {
  description = "Maximum autoscaling group size"
  default     = 1
}

variable "asg_desired" {
  description = "Desired autoscaling group size"
  default     = 1
}

variable "public_ip" {
  description = "Assign public ip to ECS instance"
  default     = false
}

variable "docker_volume_size" {
  description = "Size of the mounted docker volume"
  default     = 20
}

variable "ebs_optimized" {
  description = "Is ECS instance ebs optimized"
  default     = false
}

variable "heartbeat_timeout" {
  description = "Heartbeat of the graceful shutdown hook"
  default     = "180"
}

variable "subnet_id" {
  description = "A list of subnets"
  type        = "list"
}

variable "security_group_ids" {
  description = "A list of security group ids devided by ,"
}

variable "alarm_cpu_threshold" {
  default = "70"
}

variable "alarm_memory_threshold" {
  default = "70"
}

variable "protect_from_scale_in" {
  description = "Protect instance from scaling in"
  default     = false
}

variable "sns_topic_arn" {}

variable "tags" {
  description = "A map of tags to add to all resources"
  default     = {}
}
